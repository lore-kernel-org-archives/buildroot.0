Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4948CCA476
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 19:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BF946083B;
	Tue,  7 Oct 2025 19:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UN4fDw1ofV06; Tue,  7 Oct 2025 19:43:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8692160A95
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8692160A95;
	Tue,  7 Oct 2025 19:43:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CB7519DA
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD27440868
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZL8Fg3mW7wma for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 19:43:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 900CF406E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 900CF406E5
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:43:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F30586A52; Tue,  7 Oct 2025 19:43:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Oct 2025 21:41:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9e5cf6ac2cb7ba62d23c842899b3f7816eca14c
X-Git-Newrev: 5e769b87ecfb5d61c6f32fac3f8cdf2fb24e91a6
X-Patchwork-Hint: ignore
Message-Id: <20251007194349.7F30586A52@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtheora: bump version to 1.2.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5e769b87ecfb5d61c6f32fac3f8cdf2fb24e91a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://xiph.org/press/2025/theora-release-1.2/
https://gitlab.xiph.org/xiph/theora/-/blob/v1.2.0/CHANGES?ref_type=tags

Removed patch 0001 which is not needed anymore due to upstream commit:
https://gitlab.xiph.org/xiph/theora/-/commit/14045376ee6897f20f6bb9815f246172da748e50

Removed patch 0002 which is included in this release.

Updated license hash due to upstream commit:
https://gitlab.xiph.org/xiph/theora/-/commit/b68e2e53b30365f52204521d00b5db3d1cc439d5

Disabled assembly code on arm following Debian:
https://sources.debian.org/src/libtheora/1.2.0%2Bdfsg-6/debian/rules#L14

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: append --disable-asm in _CONF_OPTS instead of override,
  to also fix check-package error
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                            |  1 -
 package/libtheora/0001-link-libtheoradec.patch | 21 ------------
 package/libtheora/0002-fix-autoreconf.patch    | 46 --------------------------
 package/libtheora/libtheora.hash               |  4 +--
 package/libtheora/libtheora.mk                 |  8 ++++-
 5 files changed, 9 insertions(+), 71 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 1c3bca481f..127e20ca0f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -629,7 +629,6 @@ package/libsvg/0001-fix-expat-static-declaration.patch lib_patch.Upstream
 package/libsvg/0002-Fix-undefined-symbol-png_set_gray_1_2_4_to_8.patch lib_patch.Upstream
 package/libtalloc/0001-buildtools-wafsamba-add-disable-stack-protector-opti.patch lib_patch.Upstream
 package/libtelnet/0001-fix-compilation-without-zlib.patch lib_patch.Upstream
-package/libtheora/0001-link-libtheoradec.patch lib_patch.Upstream
 package/libtomcrypt/0001-fix-CVE-2019-17362.patch lib_patch.Upstream
 package/libtommath/0001-Build-test-bn_mp_set_double-c-on-more-platforms.patch lib_patch.Upstream
 package/libtorrent/0001-libtorrent.pc.in-add-Libs.Private.patch lib_patch.Upstream
diff --git a/package/libtheora/0001-link-libtheoradec.patch b/package/libtheora/0001-link-libtheoradec.patch
deleted file mode 100644
index c38d32bbbc..0000000000
--- a/package/libtheora/0001-link-libtheoradec.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-libtheoraenc.so needs to be linked to libtheoradec.so in order to avoid
-
-symbol 'th_comment_query_count': can't resolve symbol in lib '/usr/lib/libtheoraenc.so.1'
-
-when starting Freeswitch.
-
-Patch downloaded from
-http://www.sisyphus.ru/en/srpm/Sisyphus/libtheora/patches/0
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
---- libtheora/lib/Makefile.am
-+++ libtheora/lib/Makefile.am
-@@ -153,6 +153,7 @@ libtheoraenc_la_SOURCES = \
- libtheoraenc_la_LDFLAGS = \
-   -version-info @THENC_LIB_CURRENT@:@THENC_LIB_REVISION@:@THENC_LIB_AGE@ \
-   @THEORAENC_LDFLAGS@ $(OGG_LIBS)
-+libtheoraenc_la_LIBADD = libtheoradec.la
- 
- libtheora_la_SOURCES = \
- 	$(decoder_sources) \
diff --git a/package/libtheora/0002-fix-autoreconf.patch b/package/libtheora/0002-fix-autoreconf.patch
deleted file mode 100644
index 27fc379ad4..0000000000
--- a/package/libtheora/0002-fix-autoreconf.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Fix broken autoreconf
-
-Upstream: https://git.xiph.org/?p=theora.git;a=commitdiff;h=28cc6dbd9b2a141df94f60993256a5fca368fa54
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-
-
-From: Tim Terriberry <tterribe@xiph.org>
-Date: Fri, 20 May 2011 20:41:50 +0000 (+0000)
-Subject: Make autoreconf -i -f work.
-X-Git-Url: https://git.xiph.org/?p=theora.git;a=commitdiff_plain;h=28cc6dbd9b2a141df94f60993256a5fca368fa54
-
-Make autoreconf -i -f work.
-
-Patch from David Schleef.
-
-svn path=/trunk/theora/; revision=17990
----
-
-diff --git a/Makefile.am b/Makefile.am
-index 89fd753..1783857 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -2,5 +2,7 @@
- AUTOMAKE_OPTIONS = foreign 1.6 dist-zip dist-bzip2
- 
-+ACLOCAL_AMFLAGS=-I m4
-+
- if THEORA_ENABLE_EXAMPLES
- EXAMPLES_DIR = examples
- else
-diff --git a/configure.ac b/configure.ac
-index 1cbec1a..456b603 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -61,7 +61,7 @@ AC_LIBTOOL_WIN32_DLL
- AM_PROG_LIBTOOL
- 
- dnl Add parameters for aclocal
--AC_SUBST(ACLOCAL_AMFLAGS, "-I m4")
-+AC_CONFIG_MACRO_DIR([m4])
- 
- dnl Check for doxygen
- AC_CHECK_PROG(HAVE_DOXYGEN, doxygen, true, false)
diff --git a/package/libtheora/libtheora.hash b/package/libtheora/libtheora.hash
index 42ffa05045..c2d0ea002e 100644
--- a/package/libtheora/libtheora.hash
+++ b/package/libtheora/libtheora.hash
@@ -1,6 +1,6 @@
 # From http://downloads.xiph.org/releases/theora/SHA256SUMS
-sha256  f36da409947aa2b3dcc6af0a8c2e3144bc19db2ed547d64e9171c59c66561c61  libtheora-1.1.1.tar.xz
+sha256  ebdf77a8f5c0a8f7a9e42323844fa09502b34eb1d1fece7b5f54da41fe2122ec  libtheora-1.2.0.tar.xz
 
 # Locally calculated
 sha256  8417fad7da775735564e209484a2e011e0fa201e94f01fdbee6e4977e478e6fc  COPYING
-sha256  654a0238f789f4435c4818f50005b141d013c5a09a31d861efc1d0d67ba975a4  LICENSE
+sha256  2c902950c73a63cd285dc0c36573de9c5fefe66d49312949c51d941f33e92932  LICENSE
diff --git a/package/libtheora/libtheora.mk b/package/libtheora/libtheora.mk
index f408e6cce6..2cf62e5623 100644
--- a/package/libtheora/libtheora.mk
+++ b/package/libtheora/libtheora.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTHEORA_VERSION = 1.1.1
+LIBTHEORA_VERSION = 1.2.0
 LIBTHEORA_SOURCE = libtheora-$(LIBTHEORA_VERSION).tar.xz
 LIBTHEORA_SITE = http://downloads.xiph.org/releases/theora
 LIBTHEORA_INSTALL_STAGING = YES
@@ -20,6 +20,12 @@ LIBTHEORA_CONF_OPTS = \
 	--disable-examples \
 	--disable-spec
 
+# assembly code on arm is broken:
+# https://gitlab.xiph.org/xiph/theora/-/merge_requests/53
+ifeq ($(BR2_arm),y)
+LIBTHEORA_CONF_OPTS += --disable-asm
+endif
+
 LIBTHEORA_DEPENDENCIES = libogg libvorbis host-pkgconf
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
