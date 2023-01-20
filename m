Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44491C25B4E
	for <buildroot@archiver.kernel.org>; Fri, 20 Jan 2023 07:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D079641C97;
	Fri, 20 Jan 2023 07:45:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D079641C97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yViIIyqzZv7T; Fri, 20 Jan 2023 07:45:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 893C741C9A;
	Fri, 20 Jan 2023 07:45:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 893C741C9A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E2EC61BF973
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 07:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB62441C96
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 07:45:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB62441C96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rMd1VuJvFOkF for <buildroot@lists.busybox.net>;
 Fri, 20 Jan 2023 07:45:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88DC741C93
 for <buildroot@buildroot.org>; Fri, 20 Jan 2023 07:45:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88DC741C93
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 71AF687D5C; Fri, 20 Jan 2023 07:45:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Jan 2023 08:17:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c77c66b7df478f508b8f2affa7a64795504db699
X-Git-Newrev: ed9b0d395435683f2d70175f1354de723e7ad4e4
X-Patchwork-Hint: ignore
Message-Id: <20230120074506.71AF687D5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cog: bump to version 0.16.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed9b0d395435683f2d70175f1354de723e7ad4e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a small bugfix release which solves build issues. The patch
to fix the libdrm dependency is included in this release and can be
removed. Release notes:

  https://wpewebkit.org/release/cog-0.16.1.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...libdrm-dependency-when-protocols-are-used.patch | 36 ----------------------
 package/cog/cog.hash                               |  8 ++---
 package/cog/cog.mk                                 |  2 +-
 3 files changed, 5 insertions(+), 41 deletions(-)

diff --git a/package/cog/0001-wl-Fix-libdrm-dependency-when-protocols-are-used.patch b/package/cog/0001-wl-Fix-libdrm-dependency-when-protocols-are-used.patch
deleted file mode 100644
index 44e555c121..0000000000
--- a/package/cog/0001-wl-Fix-libdrm-dependency-when-protocols-are-used.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9a1982c563e218b7695e6a174c8230d3b063eb27 Mon Sep 17 00:00:00 2001
-From: Gary Bisson <gary.bisson@boundarydevices.com>
-Date: Thu, 6 Oct 2022 09:04:22 +0200
-Subject: [PATCH] wl: Fix libdrm dependency when protocols are used
-
-As the comment says, cog-platform-wl.c needs drm_fourcc.h to build
-properly when wayland_weston_direct_display is enabled.
-
-However, libdrm.pc doesn't specify "include/libdrm" as part of its
-includedir but whether in its cflags. So use the compile_args dep
-instead of includes to fix the build failure.
-
-Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
-(cherry picked from commit 32c1d9533bcdc22cbc01d02bf2e6ac0d4bda2dc2)
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-[Upstream status: https://github.com/Igalia/cog/pull/501]
----
- platform/wayland/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/platform/wayland/meson.build b/platform/wayland/meson.build
-index f1e18ec..31e4460 100644
---- a/platform/wayland/meson.build
-+++ b/platform/wayland/meson.build
-@@ -67,7 +67,7 @@ if wayland_platform_weston_protocols.length() > 0
- 
-     # The code uses definitions from the drm_fourcc.h header, but does not
-     # need to link the library; libdrm here is only a build-time dependency.
--    wayland_platform_dependencies += [dependency('libdrm').partial_dependency(includes: true)]
-+    wayland_platform_dependencies += [dependency('libdrm').partial_dependency(compile_args: true)]
- endif
- 
- 
--- 
-2.38.0
-
diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index a2c55c4b94..2ea3ddee08 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.16.0.tar.xz.sums
-md5  2705472ea4f333290973722c0862b21d  cog-0.16.0.tar.xz
-sha1  ef16e5e3d91d0da056fe5e4f596c211af7453b4e  cog-0.16.0.tar.xz
-sha256  2956f719d36c9a6368f63901a0d1ceaf4d27f529f7df441b3748c36d72906fc6  cog-0.16.0.tar.xz
+# From https://wpewebkit.org/releases/cog-0.16.1.tar.xz.sums
+md5  1489740db6b4ea568578035c30b8b2f4  cog-0.16.1.tar.xz
+sha1  1235203085e7ccd8fc76eab6bdfcdb2e3ae38ea9  cog-0.16.1.tar.xz
+sha256  37c5f14123b8dcf077839f6c60f0d721d2a91bb37829e796f420126e6b0d38b5  cog-0.16.1.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 241c4e309c..da4bfc7ac6 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.16.0
+COG_VERSION = 0.16.1
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
