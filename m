Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195EFEB64D9
	for <buildroot@archiver.kernel.org>; Sun,  2 Jul 2023 11:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C2F06059A;
	Sun,  2 Jul 2023 11:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C2F06059A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bFZR6jHFfLAU; Sun,  2 Jul 2023 11:55:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A75560881;
	Sun,  2 Jul 2023 11:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A75560881
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F0D91BF5E6
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 11:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3884A60881
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 11:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3884A60881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yEir8qRay5FS for <buildroot@lists.busybox.net>;
 Sun,  2 Jul 2023 11:55:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E6F26059A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E6F26059A
 for <buildroot@buildroot.org>; Sun,  2 Jul 2023 11:55:12 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4408113F846;
 Sun,  2 Jul 2023 13:55:08 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  2 Jul 2023 13:54:43 +0200
Message-ID: <20230702115443.585493-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1688298909;
 bh=osqSvR5qAvF9FVlQ3MmKnUEiV3YEXgbtVtXAtk9zj4k=;
 h=From:To:Cc:Subject:Date:From;
 b=kk/ge1bGjoORj9z7E3D4poKUhe5YoDvJ5lERphOCNiAAWRwzWb7J7SwXfcI/apXGc
 RqKF9pwEc5vjXxPZgtG/T2cbOlXZKFjlkUusCTn0hQEzBQPYX+3xj3ydgzx9IeAOzA
 w+lNwaUHgVYZ29B1a16PHBdpcmeZXz+LO5r/lZUlnD5a1G2Ia7r/U0hiIAyiSUemC9
 COEJR0xxefnhygE/ew0y3YOOtvQAvMczd920Ad/DvucIqVtf4EKnArReAY0GXqCp0/
 Wq586wr5kzQAcVims19Fwmg94nyRbmgZbFbL5Otx34Pw3+zf2GUhZVOB6f23mB+QCV
 MVSMyk3Suh0fw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kk/ge1bG
Subject: [Buildroot] [PATCH 1/1] package/xz: bump to version 5.4.3
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
Patch tested on top of branch master at commit b335bd1 with commands:

    utils/docker-run make check-package
    ...
    0 warnings generated

    utils/test-pkg -a -p xz
    ...
    45 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 ...0001-Detect-symver-attribute-support.patch | 70 -------------------
 package/xz/xz.hash                            |  8 +--
 package/xz/xz.mk                              |  2 +-
 3 files changed, 5 insertions(+), 75 deletions(-)
 delete mode 100644 package/xz/0001-Detect-symver-attribute-support.patch

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
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
