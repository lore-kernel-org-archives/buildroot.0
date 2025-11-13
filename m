Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35A0CD5BAB
	for <buildroot@archiver.kernel.org>; Thu, 13 Nov 2025 09:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA51E83716;
	Thu, 13 Nov 2025 09:53:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mi6QjrI31_wh; Thu, 13 Nov 2025 09:53:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2B5983753
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2B5983753;
	Thu, 13 Nov 2025 09:53:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E2E4A158
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D506560DF1
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:53:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6-hW6-coGA6 for <buildroot@buildroot.org>;
 Thu, 13 Nov 2025 09:53:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19EA560751
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19EA560751
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:53:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12D9F845F4; Thu, 13 Nov 2025 09:53:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 13 Nov 2025 10:35:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 61271a6c5589baffb0df9c245e4026c281afdf7e
X-Git-Newrev: e6663fba1470211c5d7a2c1994fd609435d4040e
X-Patchwork-Hint: ignore
Message-Id: <20251113095342.12D9F845F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libjwt: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e6663fba1470211c5d7a2c1994fd609435d4040e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 770f9154978c40ce5b7718174108b37c5310869d, libjwt was bumped
from 1.17.2 to 3.2.0, which is a big bump. And the libjwt website
states "Version 3 of LibJWT is a complete overhaul of the code. Please
see documentation for usage."

And indeed, this version bump breaks the build of Asterisk. Therefore
asterisk uses its bundled version of libjwt now and this package can be
removed as no other package depends on it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Peter: slightly reword help text]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy           |  8 ++++++++
 DEVELOPERS                 |  1 -
 package/Config.in          |  1 -
 package/libjwt/Config.in   | 10 ----------
 package/libjwt/libjwt.hash |  3 ---
 package/libjwt/libjwt.mk   | 19 -------------------
 6 files changed, 8 insertions(+), 34 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 26391bec23..dab27d978a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_LIBJWT
+	bool "libjwt has been removed"
+	select BR2_LEGACY
+	help
+	  The only dependee of libjwt, asterisk, is incompatible with
+	  version 3 so the version bundled with asterisk is used and
+	  this package has been removed.
+
 config BR2_PACKAGE_RAMSPEED
 	bool "ramspeed has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index dbd3b1517c..3307ee9918 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3421,7 +3421,6 @@ F:	configs/stm32f746_disco_sd_defconfig
 F:	package/asterisk/
 F:	package/evilwm/
 F:	package/fbv/
-F:	package/libjwt/
 F:	package/libpam-pkcs11/
 F:	package/mksh/
 F:	package/ruby/
diff --git a/package/Config.in b/package/Config.in
index 1152748d8e..c76bc726f7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1927,7 +1927,6 @@ menu "JSON/XML"
 	source "package/jsoncpp/Config.in"
 	source "package/libfastjson/Config.in"
 	source "package/libjson/Config.in"
-	source "package/libjwt/Config.in"
 	source "package/libroxml/Config.in"
 	source "package/libucl/Config.in"
 	source "package/libxml2/Config.in"
diff --git a/package/libjwt/Config.in b/package/libjwt/Config.in
deleted file mode 100644
index 47eb0882a3..0000000000
--- a/package/libjwt/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_LIBJWT
-	bool "libjwt"
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
-	select BR2_PACKAGE_JANSSON
-	help
-	  JSON Web Tokens are an open, industry standard RFC 7519
-	  method for representing claims securely between two parties.
-
-	  https://github.com/benmcollins/libjwt
diff --git a/package/libjwt/libjwt.hash b/package/libjwt/libjwt.hash
deleted file mode 100644
index 8e59d2284b..0000000000
--- a/package/libjwt/libjwt.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  17ee4e25adfbb91003946af967ff04068a5c93d6b51ad7ad892f1441736b71b9  libjwt-3.2.0.tar.xz
-sha256  3f3d9e0024b1921b067d6f7f88deb4a60cbe7a78e76c64e3f1d7fc3b779b9d04  LICENSE
diff --git a/package/libjwt/libjwt.mk b/package/libjwt/libjwt.mk
deleted file mode 100644
index d20067de24..0000000000
--- a/package/libjwt/libjwt.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# libjwt
-#
-################################################################################
-
-LIBJWT_VERSION = 3.2.0
-LIBJWT_SITE = https://github.com/benmcollins/libjwt/releases/download/v$(LIBJWT_VERSION)
-LIBJWT_SOURCE = libjwt-$(LIBJWT_VERSION).tar.xz
-LIBJWT_DEPENDENCIES = host-pkgconf jansson openssl
-LIBJWT_INSTALL_STAGING = YES
-LIBJWT_LICENSE = MPL-2.0
-LIBJWT_LICENSE_FILES = LICENSE
-LIBJWT_CPE_ID_VENDOR = bencollins
-LIBJWT_CPE_ID_PRODUCT = jwt_c_library
-
-LIBJWT_CONF_OPTS += -DWITH_TESTS=OFF -DWITH_GNUTLS=OFF
-
-$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
