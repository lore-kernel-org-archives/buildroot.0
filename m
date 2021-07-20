Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA67C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:16:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D961660230
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D961660230
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFDF183DEC;
	Wed,  4 Aug 2021 00:16:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5tmthwxrarX8; Wed,  4 Aug 2021 00:16:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEA2983D62;
	Wed,  4 Aug 2021 00:16:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D39231BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61C2F40F95
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HJgtI_7gz04q for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31C5440E4E
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7B6D385583; Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 23:36:58 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f6628763eb302f15f861e0ce7bfc44b34b066bea
X-Git-Newrev: f00da714a20a7826dda67d66f2a6b6ef858ef3e3
X-Patchwork-Hint: ignore
Message-Id: <20210803211012.7B6D385583@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mupdf: bump to version
 1.18.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7058017970626560967=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============7058017970626560967==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f00da714a20a7826dda67d66f2a6b6ef858ef3e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

It turns out the patch version of python-pymupdf doesn't have to match
mupdf's version (i.e. python-pymupdf 1.18.14 is compatible with mupdf
1.18.*) so remove the word "exactly" from the comment.

mupdf now has a new dependency: gumbo-parser.

gumbo-parser is included when downloading the sources for mupdf, but
instead we use the version provided by Buildroot.

While at it, take the chance to (based on previous review comments):

- Fix indentation in the hash file (two spaces).
- Switch to using the ".xz" archive.
- Add a conditional on freeglut.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mupdf/Config.in  |  1 +
 package/mupdf/mupdf.hash |  6 +++---
 package/mupdf/mupdf.mk   | 16 ++++++++++------
 3 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/package/mupdf/Config.in b/package/mupdf/Config.in
index dc296b3e8a..ff176f4b99 100644
--- a/package/mupdf/Config.in
+++ b/package/mupdf/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_MUPDF
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # harfbuzz
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_GUMBO_PARSER
 	select BR2_PACKAGE_HARFBUZZ
 	select BR2_PACKAGE_JBIG2DEC
 	select BR2_PACKAGE_JPEG
diff --git a/package/mupdf/mupdf.hash b/package/mupdf/mupdf.hash
index ec4893046d..934836e76a 100644
--- a/package/mupdf/mupdf.hash
+++ b/package/mupdf/mupdf.hash
@@ -1,8 +1,8 @@
 # From https://mupdf.com/downloads/index.html:
-sha1 18f069b7cc125e53f541163ac305c588c94dea97 mupdf-1.16.0-source.tar.gz
+sha1  fc17bd01d5860e49b009f28a5ddb629e94af4510  mupdf-1.18.0-source.tar.xz
 
 # Locally computed:
-sha256 64d537895641b711737cc58fe762481b07ea71d1506e8bd8a13434e093b0068d  mupdf-1.16.0-source.tar.gz
+sha256 592d4f6c0fba41bb954eb1a41616661b62b134d5b383e33bd45a081af5d4a59a  mupdf-1.18.0-source.tar.xz
 
 # Hash for license files:
-sha256 57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  COPYING
+sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  COPYING
diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index 78dacd214c..b481fb1eae 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-# python-pymupdf's version must match exactly mupdf's version
-MUPDF_VERSION = 1.16.0
-MUPDF_SOURCE = mupdf-$(MUPDF_VERSION)-source.tar.gz
+# python-pymupdf's version must match mupdf's version
+MUPDF_VERSION = 1.18.0
+MUPDF_SOURCE = mupdf-$(MUPDF_VERSION)-source.tar.xz
 MUPDF_SITE = https://mupdf.com/downloads/archive
 MUPDF_LICENSE = AGPL-3.0+
 MUPDF_LICENSE_FILES = COPYING
@@ -14,6 +14,7 @@ MUPDF_CPE_ID_VENDOR = artifex
 MUPDF_INSTALL_STAGING = YES
 MUPDF_DEPENDENCIES = \
 	freetype \
+	gumbo-parser \
 	harfbuzz \
 	host-pkgconf \
 	jbig2dec jpeg \
@@ -21,8 +22,10 @@ MUPDF_DEPENDENCIES = \
 	xlib_libX11 \
 	zlib
 
+# The pkg-config name for gumbo-parser is `gumbo`.
 MUPDF_PKG_CONFIG_PACKAGES = \
 	freetype2 \
+	gumbo \
 	harfbuzz \
 	libjpeg \
 	zlib
@@ -43,13 +46,14 @@ MUPDF_MAKE_ENV = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
 	XLIBS="$(MUPDF_LDFLAGS)" \
 	USE_SYSTEM_LIBS=yes
 
-# Modern versions of mupdf depend on OpenGL,
-# we disable it because it may not be available:
+ifeq ($(BR2_PACKAGE_LIBFREEGLUT),y)
+MUPDF_DEPENDENCIES += libfreeglut
+else
 define MUPDF_DISABLE_OPENGL
 	sed -i 's/HAVE_GLUT := yes/HAVE_GLUT := no/g' $(@D)/Makerules
 endef
-
 MUPDF_POST_PATCH_HOOKS = MUPDF_DISABLE_OPENGL
+endif
 
 define MUPDF_BUILD_CMDS
 	$(MUPDF_MAKE_ENV) $(MAKE) -C $(@D) all

--===============7058017970626560967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============7058017970626560967==--
