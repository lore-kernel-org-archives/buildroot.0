Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E40EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 18:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72EC34015E;
	Tue, 18 Jul 2023 18:33:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72EC34015E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W-WwcrRFvQvh; Tue, 18 Jul 2023 18:33:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42A8E4023F;
	Tue, 18 Jul 2023 18:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42A8E4023F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BBDB61BF333
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 18:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95D6740491
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 18:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95D6740491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IkxQVqbKs09v for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 18:33:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A2E940328
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A2E940328
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 18:33:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CEA08A4C0FEB;
 Tue, 18 Jul 2023 20:32:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42438)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qLpV0-0004TJ-2A;
 Tue, 18 Jul 2023 20:32:38 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 20:32:37 +0200
Message-Id: <20230718183238.688311-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718183238.688311-1-bernd@kuhls.net>
References: <20230718183238.688311-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689705159;
 bh=lGCRQF2uJJGeDs7s4NSlXKk4NdXlUXdHu+1h6z6p+JE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NEaBDtBSa5+lzWLDFZlTuxQHPePM1Q+eabKfSJnIjq74ix88KOSw2TyMUOILbB8q2
 4sunyQ8nHqNIakRoxcCUPwG2Wmex70Sg1YisvmBVN/vyUbEB22RVe3ldhAToL36KuA
 i8AF5tleB7IKBORPlwQGcKRgPFouqR8RjSq98wNovmQ/6UjgnCyiCUvv658ws5i2yl
 BKDdPJwQoQxdQXFjDnrinhUUHilv1pvwtiq70W8vr1VnLnS+uG3HBPTQDXsKpJ9Sg7
 wouZ0A+3x+7u8jPtglOCVOGBx5X4h7xaQCarr3zxZiXYACKzJKTOMYHAm+KZE4I8bQ
 xtu4Qmbp/CzsQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=NEaBDtBS
Subject: [Buildroot] [PATCH v2 3/4] package/webkitgtk: bump version to 2.40.3
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes

 package/webkitgtk/webkitgtk.hash | 7 +++----
 package/webkitgtk/webkitgtk.mk   | 5 +++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 3bc521e445..756ac13ec2 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,6 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.38.6.tar.xz.sums
-md5  a50290fdc80842b1ae8be1e1147b5679  webkitgtk-2.38.6.tar.xz
-sha1  4dfb3d96f621fc633ff347e083e429893551fb26  webkitgtk-2.38.6.tar.xz
-sha256  1c614c9589389db1a79ea9ba4293bbe8ac3ab0a2234cac700935fae0724ad48b  webkitgtk-2.38.6.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.40.3.tar.xz.sums
+sha1  74ee7241f2add46897019e22bd4f8e19e09027bb  webkitgtk-2.40.3.tar.xz
+sha256  cc0aa83f40dbc64c1c6ae42ec6b85af4be2a9dbf524cfcb95f89a367fb5098dd  webkitgtk-2.40.3.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index dd17b46e67..56277a0a0a 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.38.6
+WEBKITGTK_VERSION = 2.40.3
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
@@ -13,7 +13,7 @@ WEBKITGTK_LICENSE_FILES = \
 	Source/WebCore/LICENSE-APPLE \
 	Source/WebCore/LICENSE-LGPL-2.1
 WEBKITGTK_CPE_ID_VENDOR = webkitgtk
-WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf \
+WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf host-unifdef \
 	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup \
 	libtasn1 libxml2 libxslt openjpeg sqlite webp woff2
 WEBKITGTK_CONF_OPTS = \
@@ -24,6 +24,7 @@ WEBKITGTK_CONF_OPTS = \
 	-DENABLE_SPELLCHECK=ON \
 	-DENABLE_WEB_RTC=OFF \
 	-DPORT=GTK \
+	-DUSE_AVIF=OFF \
 	-DUSE_LIBHYPHEN=OFF \
 	-DUSE_OPENJPEG=ON \
 	-DUSE_SOUP2=ON \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
