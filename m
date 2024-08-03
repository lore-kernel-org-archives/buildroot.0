Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC00DC49EA1
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 13:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73CA1605C1;
	Sat,  3 Aug 2024 13:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EHmsDyApiOm7; Sat,  3 Aug 2024 13:13:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B56C605FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B56C605FF;
	Sat,  3 Aug 2024 13:13:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CA611BF2EB
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 13:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 567894015F
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 13:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RjZRsTJRllMk for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 13:13:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9BAA3400F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BAA3400F8
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BAA3400F8
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 13:13:44 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id A032835364DC; Sat,  3 Aug 2024 15:13:41 +0200 (CEST)
Date: Sat, 3 Aug 2024 15:13:41 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zq4tBZt24KCzNTcq@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1722690821; bh=vJuurQ/+ZrzxbB1D7glKjGwoYwBSI8TyAD57NY23dSM=;
 h=Date:From:To:Subject:From;
 b=ljYo5vwAYMEayn5C5aVZeew42MwuiMIvcJKX/LPjX95cX3S/jq/EzKPnHps2WPWlP
 dOLQP3Obeci2Vc0Kh3+8OcryxRDfqWxv3yJUkSw7IgAC/nq4ZscyOW+EX81pgc0KVi
 CsqDtfFRHqjJ2bX3PeYWd3KnXnrn1AtMATyyNHD54MiuN7S84gqOe2rWkGUigBH80B
 Z3s+z6NKCnABfu5FcyPavirPIjGrO6uuVmjIFGjp+0Z5xlB3mHQRwjednONppWOOOU
 ni/mMzox+ybI59xKhSYO+DJuWZGUju8JSZexfoWQS/HXfU7D5Q+7M6Hn+V89IbPEnw
 iVEyDWT3+Bskw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=ljYo5vwA
Subject: [Buildroot] [PATCH] package/valgrind: update to 3.23.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See here for Changes:
https://valgrind.org/docs/manual/dist.news.html

Enable for S/390X as it is supported. (Only compile time
tested).

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/valgrind/Config.in     | 1 +
 package/valgrind/valgrind.hash | 4 ++--
 package/valgrind/valgrind.mk   | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
index 700849130f..56fda07d09 100644
--- a/package/valgrind/Config.in
+++ b/package/valgrind/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_s390x
 	depends on !BR2_MIPS_SOFT_FLOAT
 
 comment "valgrind needs a toolchain w/ dynamic library, threads"
diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
index d236c7b4a0..9cb66b583a 100644
--- a/package/valgrind/valgrind.hash
+++ b/package/valgrind/valgrind.hash
@@ -1,7 +1,7 @@
 # From https://valgrind.org/downloads/current.html
-sha1  60894cbf59d480c1794674da24a8406518a8df59  valgrind-3.22.0.tar.bz2
+sha1  ec410c75d3920d4f9249a5cfa2cac31e1bf6d586  valgrind-3.23.0.tar.bz2
 # locally computed
-sha256  c811db5add2c5f729944caf47c4e7a65dcaabb9461e472b578765dd7bf6d2d4c  valgrind-3.22.0.tar.bz2
+sha256  c5c34a3380457b9b75606df890102e7df2c702b9420c2ebef9540f8b5d56264d  valgrind-3.23.0.tar.bz2
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 97a955bd3b..a5cb4b1c03 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.22.0
+VALGRIND_VERSION = 3.23.0
 VALGRIND_SITE = https://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
