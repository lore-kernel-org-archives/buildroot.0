Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CCDC3ABB2
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 03:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C65861466;
	Tue, 17 Sep 2024 03:32:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K5ZZ_mU_bKSG; Tue, 17 Sep 2024 03:32:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E2526147A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E2526147A;
	Tue, 17 Sep 2024 03:32:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 890D21BF33F
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 03:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 850B8403CA
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 03:32:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DStwInz-KFki for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 03:32:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1EBE6400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EBE6400DA
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EBE6400DA
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 03:32:50 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id C52DB35211BC; Tue, 17 Sep 2024 05:32:48 +0200 (CEST)
Date: Tue, 17 Sep 2024 05:32:48 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zuj4YO+IYp/aFBBj@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1726543968; bh=7xpLCndMosFe+fsdWQBta7IUbPQqO738EoLUz/umVRo=;
 h=Date:From:To:Subject:From;
 b=Y7ZYTNvTFb4WhQT/D4Uenl+8QHgwJynuxCmuKvxSXtEFMlRhvOtuNSTlTKnEXullJ
 Cbe7nQXguqgiziIcGWn1pxyYFkAmk16n07V1kNDLuDTfR4sindGv3czreZnb2yUMax
 E2V2oKk2qICF6jF7eMFvIiByxCt0xg+IUWdtE1Dy4SRnpuqcHoMbhljAxBZfuSLIVl
 8Zr9hK9fmCYDQ/fiEfp4hAdddRATz5gCSqfvCkDU88zi6cEAqXuUvThMhMp5lnNHDW
 MgsNgN5SMB5e8Hg+fyrc8gSqhA/9KzNq1f+kwjO0duw5G04+jsF4Yfn6uoi04UZoPN
 psLMekOxTA2cw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=Y7ZYTNvT
Subject: [Buildroot] [PATCH] package/bind: update to 9.18.29
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

See here for a Changelog:
https://downloads.isc.org/isc/bind9/9.18.29/doc/arm/html/notes.html#notes-for-bind-9-18-29

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index feb3430a73..2d4e247932 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.18.28/bind-9.18.28.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.18.29/bind-9.18.29.tar.xz.asc
 # with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
-sha256  e7cce9a165f7b619eefc4832f0a8dc16b005d29e3890aed6008c506ea286a5e7  bind-9.18.28.tar.xz
+sha256  c39ce5d09a8cb10108116fa533445de9f7fdfe0063e8d7c4c46ba1fd20d7bf6d  bind-9.18.29.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index d594ab5e39..23687ec620 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.18.28
+BIND_VERSION = 9.18.29
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
