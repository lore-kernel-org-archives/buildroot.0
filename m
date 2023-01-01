Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B952BC4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 14:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63E0B4055E;
	Sun,  1 Jan 2023 14:36:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63E0B4055E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZvEK-gOGqtk4; Sun,  1 Jan 2023 14:36:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9785940598;
	Sun,  1 Jan 2023 14:36:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9785940598
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A0C961BF33C
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 14:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C64D40673
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 14:36:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C64D40673
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7goyfXGX-R3t for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 14:36:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 691F4405A6
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 14:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 691F4405A6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 568FC86D20; Sun,  1 Jan 2023 14:36:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Jan 2023 15:34:27 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 4da09740c69e406bcc1b3b5519d43e44109a52bf
X-Git-Newrev: c0a1f344c1be178589166739cb6ce1e6c5f0ee4f
X-Patchwork-Hint: ignore
Message-Id: <20230101143640.568FC86D20@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/tiff: security
 bump to version 4.5.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c0a1f344c1be178589166739cb6ce1e6c5f0ee4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fix CVE-2022-2056, CVE-2022-2057, CVE-2022-2058, CVE-2022-2519,
CVE-2022-2520, CVE-2022-2521, CVE-2022-2953, CVE-2022-34526,
CVE-2022-3570, CVE-2022-3597, CVE-2022-3598, CVE-2022-3599,
CVE-2022-3626, CVE-2022-3627 and CVE-2022-3970

- COPYRIGHT renamed to LICENSE.md and year updated with
  https://gitlab.com/libtiff/libtiff/-/commit/fa1d6d787fc67a1eeb3abccb790b5bee969d424b
- Use new --{en,dis}able options added by
  https://gitlab.com/libtiff/libtiff/-/commit/1ab0e2696a368a556b793a0941b5365e4d9f56ef

http://www.simplesystems.org/libtiff/releases/v4.5.0.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5b62ea01369b11f5a4320bb2c909168b21c2642c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tiff/tiff.hash |  4 ++--
 package/tiff/tiff.mk   | 16 +++++++++-------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
index 6bd28a0f59..73732892a5 100644
--- a/package/tiff/tiff.hash
+++ b/package/tiff/tiff.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  917223b37538959aca3b790d2d73aa6e626b688e02dcda272aec24c2f498abed  tiff-4.4.0.tar.gz
-sha256  fbd6fed7938541d2c809c0826225fc85e551fdbfa8732b10f0c87e0847acafd7  COPYRIGHT
+sha256  c7a1d9296649233979fa3eacffef3fa024d73d05d589cb622727b5b08c423464  tiff-4.5.0.tar.gz
+sha256  0780558a8bfba0af1160ec1ff11ade4f41c0d7deafd6ecfc796b492a788e380d  LICENSE.md
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 525712c9e9..7981bdf2c9 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -4,16 +4,18 @@
 #
 ################################################################################
 
-TIFF_VERSION = 4.4.0
+TIFF_VERSION = 4.5.0
 TIFF_SITE = http://download.osgeo.org/libtiff
 TIFF_LICENSE = tiff license
-TIFF_LICENSE_FILES = COPYRIGHT
+TIFF_LICENSE_FILES = LICENSE.md
 TIFF_CPE_ID_VENDOR = libtiff
 TIFF_CPE_ID_PRODUCT = libtiff
 TIFF_INSTALL_STAGING = YES
 
 TIFF_CONF_OPTS = \
+	--disable-contrib \
 	--disable-cxx \
+	--disable-tests \
 	--without-x
 
 TIFF_DEPENDENCIES = host-pkgconf
@@ -23,7 +25,8 @@ HOST_TIFF_CONF_OPTS = \
 	--without-x \
 	--disable-zlib \
 	--disable-lzma \
-	--disable-jpeg
+	--disable-jpeg \
+	--disable-tests
 HOST_TIFF_DEPENDENCIES = host-pkgconf
 
 ifneq ($(BR2_PACKAGE_TIFF_CCITT),y)
@@ -84,12 +87,11 @@ ifneq ($(BR2_PACKAGE_TIFF_JBIG),y)
 TIFF_CONF_OPTS += --disable-jbig
 endif
 
-TIFF_SUBDIRS = port libtiff
 ifeq ($(BR2_PACKAGE_TIFF_UTILITIES),y)
-TIFF_SUBDIRS += tools
+TIFF_CONF_OPTS += --enable-tools
+else
+TIFF_CONF_OPTS += --disable-tools
 endif
 
-TIFF_MAKE = $(MAKE) SUBDIRS="$(TIFF_SUBDIRS)"
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
