Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E120AC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 10:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0A3881124;
	Sun, 28 Jul 2024 10:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 65zQdLtjxzDX; Sun, 28 Jul 2024 10:26:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC955819E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC955819E6;
	Sun, 28 Jul 2024 10:26:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 155931BF5F5
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 10:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E081E4011A
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 10:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id olrgO6WdrRgc for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 10:25:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C43234014D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C43234014D
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 10:25:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE4B08753F; Sun, 28 Jul 2024 10:25:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 12:19:43 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 58781773ecf0984b3d979c4f0d871c7dca2e3fa0
X-Git-Newrev: 4aed83070375bfa0e1e918529e1b7724cf12fd98
X-Patchwork-Hint: ignore
Message-Id: <20240728102559.BE4B08753F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/ncftp: bump to
 version 3.2.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=4aed83070375bfa0e1e918529e1b7724cf12fd98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Change download location as the new version is not available at the
old location.

Remove already upstreamed patch.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0deb8c4c5dcae01e1da772e2e1540aa989e8af8b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                 |  1 -
 package/ncftp/0001-fix-gcc-10.patch | 24 ------------------------
 package/ncftp/ncftp.hash            |  2 +-
 package/ncftp/ncftp.mk              |  8 +++-----
 4 files changed, 4 insertions(+), 31 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 1006b7cfe8..0358361079 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1067,7 +1067,6 @@ package/musl/0001-avoid-kernel-if_ether.h.patch lib_patch.Upstream
 package/musl/0002-package-musl-Make-scheduler-functions-Linux-compatib.patch lib_patch.Upstream
 package/nano/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch lib_patch.Upstream
 package/nanocom/0001-fix-build-with-gcc-10.patch lib_patch.Upstream
-package/ncftp/0001-fix-gcc-10.patch lib_patch.Upstream
 package/ncmpc/0001-meson.build-add-atomic-dependency-for-sparc.patch lib_patch.Upstream
 package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch lib_patch.Upstream
 package/ne10/0002-fix-build-without-C.patch lib_patch.Upstream
diff --git a/package/ncftp/0001-fix-gcc-10.patch b/package/ncftp/0001-fix-gcc-10.patch
deleted file mode 100644
index 8ff9c44c50..0000000000
--- a/package/ncftp/0001-fix-gcc-10.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Fix build with gcc 10
-
-Add missing extern to gBm to fix the following build failure with
--fno-common which is enabled by default with gcc 10:
-
-/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: bookmark.o:(.bss+0x10): multiple definition of `gBm'; gpshare.o:(.bss+0x24): first defined here
-
-Fixes:
- - http://autobuild.buildroot.org/results/78822bc0e0039e8f8949011a256cac022863276f
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-diff -Nura ncftp-3.2.6-orig/sh_util/gpshare.c ncftp-3.2.6/sh_util/gpshare.c
---- ncftp-3.2.6-orig/sh_util/gpshare.c	2020-08-21 10:46:34.173816750 +0200
-+++ ncftp-3.2.6/sh_util/gpshare.c	2020-08-21 10:52:25.407976319 +0200
-@@ -28,7 +28,7 @@
- 
- static int gIsAtty1 = 1, gIsAtty2 = 1;
- extern int gLoadedBm, gBookmarkMatchMode;
--Bookmark gBm;
-+extern Bookmark gBm;
- 
- double
- FileSize(double size, const char **uStr0, double *uMult0)
diff --git a/package/ncftp/ncftp.hash b/package/ncftp/ncftp.hash
index 3ab27df5cc..3e390b1015 100644
--- a/package/ncftp/ncftp.hash
+++ b/package/ncftp/ncftp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  129e5954850290da98af012559e6743de193de0012e972ff939df9b604f81c23  ncftp-3.2.6-src.tar.gz
+sha256  d41c5c4d6614a8eae2ed4e4d7ada6b6d3afcc9fb65a4ed9b8711344bef24f7e8  ncftp-3.2.7-src.tar.xz
 sha256  4fe2f063d25d79c49712a272ebb68e050c703eed9c66c80108427edfe3285580  doc/LICENSE.txt
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index d380ebae02..a3aa3fb194 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-NCFTP_VERSION = 3.2.6
-# use .gz as upstream .xz tarball has changed after the hash was added for
-# 2017.02. Can be changed back to .xz when version is bumped
-NCFTP_SOURCE = ncftp-$(NCFTP_VERSION)-src.tar.gz
-NCFTP_SITE = https://www.ncftp.com/public_ftp/ncftp/older_versions
+NCFTP_VERSION = 3.2.7
+NCFTP_SOURCE = ncftp-$(NCFTP_VERSION)-src.tar.xz
+NCFTP_SITE = https://www.ncftp.com/public_ftp/ncftp
 NCFTP_TARGET_BINS = ncftp
 NCFTP_LICENSE = Clarified Artistic License
 NCFTP_LICENSE_FILES = doc/LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
