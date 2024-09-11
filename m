Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34837EE021F
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 09:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 997EA40C1F;
	Wed, 11 Sep 2024 09:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4AnMD_zs0XpC; Wed, 11 Sep 2024 09:09:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DF0C40C7F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DF0C40C7F;
	Wed, 11 Sep 2024 09:09:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 212FD1BF3E5
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 09:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D2A660AA9
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 09:09:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wi9rUef9UFKT for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 09:09:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 92C5060AAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92C5060AAC
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92C5060AAC
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 09:09:42 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id C44C33536649; Wed, 11 Sep 2024 11:09:32 +0200 (CEST)
Date: Wed, 11 Sep 2024 11:09:32 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZuFeS3LE0/MttrzN@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1726045772; bh=PmsxXiH+FzjmFW+DMO52/hRatN3Ee0eqmMfwYZI5x2g=;
 h=Date:From:To:Subject:From;
 b=KcvRUcLKk6Nq3no75uo7rZ/iDUUa8kqZr2DRrI2RsxpjCmauZ5zWagd31jYCqVzlu
 QaUL5laX8nD60hc1bp3z+OnV27Ahkg9TVGoV82r0k+LwmMuX7kiSZ5ynlEF1u+m6BC
 KA8TVnbXlGihB6eIyh2KxFzrfWVMAEo3y+yl0N3cd43vc4/H4rlq+9F43dznV5seNE
 EQ3AN2fMc/8IY7WNCEYX80dfYz5Xy2AvRSan1x2CcncNl8qLuKU/kpxXV83uePHrFw
 urb1F+2zvRz4A9OKMx0pUrcxi5SmXOsApmuKwNfa/9o+OMfxIo4kraZqflWzFB63vJ
 woemjr7m3mxrw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=KcvRUcLK
Subject: [Buildroot] [PATCH] package/qemu: update to 9.1.0
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

See here for changes:
https://wiki.qemu.org/ChangeLog/9.1

The support for the nios2 architecture got removed.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/qemu/Config.in      | 5 -----
 package/qemu/Config.in.host | 1 -
 package/qemu/qemu.hash      | 2 +-
 package/qemu/qemu.mk        | 2 +-
 4 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 608e4d429d..2d15ab1ea9 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -252,11 +252,6 @@ config BR2_PACKAGE_QEMU_TARGET_MIPSN32EL
 	help
 	  MIPS N32 architecture, little-endian.
 
-config BR2_PACKAGE_QEMU_TARGET_NIOS2
-	bool "nios2"
-	help
-	  Nios II architecture.
-
 config BR2_PACKAGE_QEMU_TARGET_OR1K
 	bool "or1k"
 	select BR2_PACKAGE_QEMU_FDT if BR2_PACKAGE_QEMU_SYSTEM
diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 8dd0c7d11b..4db114490a 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -9,7 +9,6 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_microblazebe
 	default y if BR2_mips
 	default y if BR2_mipsel
-	default y if BR2_nios2
 	default y if BR2_or1k
 	default y if BR2_powerpc
 	default y if BR2_powerpc64
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 419dd0d1b3..169fe05068 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  a8c3f596aece96da3b00cafb74baafa0d14515eafb8ed1ee3f7f5c2d0ebf02b6  qemu-9.0.2.tar.xz
+sha256  816b7022a8ba7c2ac30e2e0cf973e826f6bcc8505339603212c5ede8e94d7834  qemu-9.1.0.tar.xz
 sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 16cff13d18..e9f6520d89 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, check whether the list of supported targets
 # needs to be updated.
-QEMU_VERSION = 9.0.2
+QEMU_VERSION = 9.1.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
 QEMU_SELINUX_MODULES = qemu virt
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
