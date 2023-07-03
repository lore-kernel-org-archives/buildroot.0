Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D3CC001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 20:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8378A60EEF;
	Mon,  3 Jul 2023 20:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8378A60EEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TOeNumJ1MK6H; Mon,  3 Jul 2023 20:36:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 483D260E34;
	Mon,  3 Jul 2023 20:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 483D260E34
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A32821BF357
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C29C40198
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C29C40198
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2DYdg3KtAH9J for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 20:36:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75FC8400D1
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 20:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75FC8400D1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5EC44865AF; Mon,  3 Jul 2023 20:36:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Jul 2023 22:36:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6255ea2f6591ae294d1a354d6a30e8b5b245d3d6
X-Git-Newrev: 6ebb7c37526348fc0ed1359d1c07f12059e416a4
X-Patchwork-Hint: ignore
Message-Id: <20230703203616.5EC44865AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xz: bump to version 5.4.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6ebb7c37526348fc0ed1359d1c07f12059e416a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit changes the version branch from 5.2.x to 5.4.x. This old
stable 5.2.x branch is expected to be end-of-life. The package
site [1] mention:

"""
5.4.3 was released on 2023-05-04. A minor bug fix release 5.2.12 to
the old stable branch was made on 2023-05-04. This is probably the
last release in the 5.2.x series.
"""

For a change log since 5.2.10, see [2].

This commit removes the package patch since the new version includes
alternate workarounds. See comment in [3].

The COPYING licence file hash has changed. A note about
Doxygen-generated HTML was added in [4].

COPYING.GPLv3 license file hash has also changed, as the file was
updated (http links changed by https) in [5].

[1] https://tukaani.org/xz/
[2] https://git.tukaani.org/?p=xz.git;a=blob;f=NEWS;h=7f83c81f61e8e6aa81525e44c072c76205eeb14b;hb=238b4e5458b4bd2cadefb768b8ea7c6b70a191ac
[3] https://github.com/tukaani-project/xz/pull/32#issuecomment-1438396969
[4] https://github.com/tukaani-project/xz/commit/f68f4b27f62f53fdac570885a1f4f23367ce6599
[5] https://github.com/tukaani-project/xz/commit/5a7b930efa7f9849d8da8397e8e5d8638f92be40

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../xz/0001-Detect-symver-attribute-support.patch  | 70 ----------------------
 package/xz/xz.hash                                 |  8 +--
 package/xz/xz.mk                                   |  2 +-
 3 files changed, 5 insertions(+), 75 deletions(-)

diff --git a/package/xz/0001-Detect-symver-attribute-support.patch b/package/xz/0001-Detect-symver-attribute-support.patch
deleted file mode 100644
index 462fa9d86b..0000000000
--- a/package/xz/0001-Detect-symver-attribute-support.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From f0e0e8bd08b4d4e7c89a5a3b7d9a3c083f7e5432 Mon Sep 17 00:00:00 2001
-From: Vincent Fazio <vfazio@gmail.com>
-Date: Wed, 8 Feb 2023 12:58:37 +0000
-Subject: [PATCH] Detect symver attribute support
-
-On Microblaze, builds will fail when trying to add symver information
-because  __attribute__((symver ..)) is not supported even though
-__has_attribute(__symver__) returns true.
-
-Support for symver needs to be detected via a compile test since
-__has_attribute can report false positives [0].
-
-Add a configure compile check for __attribute__((symver ..)) to ensure
-it is supported and define a variable to advertise support.
-
-[0] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766#c1
-
-Upstream: https://github.com/tukaani-project/xz/pull/32
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[Peter: patch configure instead of configure.ac so autoreconf isn't
-triggered at build time]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- configure                   | 15 +++++++++++++++
- src/liblzma/common/common.h |  2 +-
- 2 files changed, 16 insertions(+), 1 deletion(-)
-
-diff --git a/src/liblzma/common/common.h b/src/liblzma/common/common.h
-index 671d3bc..27b56ee 100644
---- a/src/liblzma/common/common.h
-+++ b/src/liblzma/common/common.h
-@@ -76,7 +76,7 @@
- // too (which doesn't support __symver__) so use it to detect if __symver__
- // is available. This should be far more reliable than looking at compiler
- // version macros as nowadays especially __GNUC__ is defined by many compilers.
--#	if lzma_has_attribute(__symver__)
-+#	if defined(HAVE_SYMVER_ATTRIBUTE)
- #		define LZMA_SYMVER_API(extnamever, type, intname) \
- 			extern __attribute__((__symver__(extnamever))) \
- 					LZMA_API(type) intname
-diff --git a/configure b/configure
-index ff0eed5..e685b30 100755
---- a/configure
-+++ b/configure
-@@ -16687,6 +16687,21 @@ printf "%s\n" "" >&6; }
- 
- printf "%s\n" "#define HAVE_SYMBOL_VERSIONS_LINUX $have_symbol_versions_linux" >>confdefs.h
- 
-+			OLD_CFLAGS="$CFLAGS"
-+			CFLAGS="$CFLAGS -Werror"  # we need -Werror to make sure the attribute is not ignored
-+			cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-+/* end confdefs.h.  */
-+__attribute__ ((symver ("test@TEST"))) void foo(void) { }
-+
-+_ACEOF
-+if ac_fn_c_try_compile "$LINENO"
-+then :
-+
-+printf "%s\n" "#define HAVE_SYMVER_ATTRIBUTE 1" >>confdefs.h
-+
-+fi
-+rm -f core conftest.err conftest.$ac_objext conftest.beam conftest.$ac_ext
-+			CFLAGS="$OLD_CFLAGS"
- 			;;
- 		*)
- 			enable_symbol_versions=generic
--- 
-2.34.1
-
diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 1153e02b4d..0a8a13f1eb 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,9 +1,9 @@
 # Locally calculated after checking pgp signature
-# https://tukaani.org/xz/xz-5.2.10.tar.bz2.sig
-sha256  01b71df61521d9da698ce3c33148bff06a131628ff037398c09482f3a26e5408  xz-5.2.10.tar.bz2
+# https://tukaani.org/xz/xz-5.4.3.tar.gz.sig
+sha256  9243a04598d7a70c1f567a0143a255581ac5c64b140fd55fd5cbc1e00b0e6f90  xz-5.4.3.tar.bz2
 
 # Hash for license files
-sha256  bcb02973ef6e87ea73d331b3a80df7748407f17efdb784b61b47e0e610d3bb5c  COPYING
+sha256  72d7ef9c98be319fd34ce88b45203b36d5936f9c49e82bf3198ffee5e0c7d87e  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.GPLv3
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING.GPLv3
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPLv2.1
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 0120d23b85..dcdbe142b6 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.2.10
+XZ_VERSION = 5.4.3
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://tukaani.org/xz
 XZ_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
