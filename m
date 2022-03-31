Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8504FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 15:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41CE181A8E;
	Thu, 31 Mar 2022 15:54:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xZGEfO1j4h8A; Thu, 31 Mar 2022 15:54:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B2C78186B;
	Thu, 31 Mar 2022 15:54:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 051FB1BF3AE
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 15:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3F4241A1D
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 15:54:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N7QGiWA9cfwu for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 15:54:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D480041907
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 15:54:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7BE8C860C6; Thu, 31 Mar 2022 15:44:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Mar 2022 17:50:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1506ff275b0e53a4ac886d6eed7d4fea9456ae00
X-Git-Newrev: a7fa40a9c1e93c063bbc5c5d4cac0c67493087a7
X-Patchwork-Hint: ignore
Message-Id: <20220331154459.7BE8C860C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libzlib: security bump version to
 1.2.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7fa40a9c1e93c063bbc5c5d4cac0c67493087a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2018-25032.

Release notes:
http://madler.net/pipermail/zlib-announce_madler.net/2022/000012.html

Changelog: https://github.com/madler/zlib/blob/master/ChangeLog

Added upstream patch to fix build error.

Updated license hash due to version bump, reformatted hashes:
https://github.com/madler/zlib/commit/21767c654d31d2dccdde4330529775c6c5fd5389

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...sue-that-discarded-provided-CC-definition.patch | 28 ++++++++++++++++++++++
 package/libzlib/libzlib.hash                       |  4 ++--
 package/libzlib/libzlib.mk                         |  2 +-
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/package/libzlib/0001-Fix-configure-issue-that-discarded-provided-CC-definition.patch b/package/libzlib/0001-Fix-configure-issue-that-discarded-provided-CC-definition.patch
new file mode 100644
index 0000000000..398e1c9481
--- /dev/null
+++ b/package/libzlib/0001-Fix-configure-issue-that-discarded-provided-CC-definition.patch
@@ -0,0 +1,28 @@
+From 05796d3d8d5546cf1b4dfe2cd72ab746afae505d Mon Sep 17 00:00:00 2001
+From: Mark Adler <madler@alumni.caltech.edu>
+Date: Mon, 28 Mar 2022 18:34:10 -0700
+Subject: [PATCH] Fix configure issue that discarded provided CC definition.
+
+Downloaded from upstream commit:
+https://github.com/madler/zlib/commit/05796d3d8d5546cf1b4dfe2cd72ab746afae505d
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/configure b/configure
+index 52ff4a04e..3fa3e8618 100755
+--- a/configure
++++ b/configure
+@@ -174,7 +174,10 @@ if test -z "$CC"; then
+   else
+     cc=${CROSS_PREFIX}cc
+   fi
++else
++  cc=${CC}
+ fi
++
+ cflags=${CFLAGS-"-O3"}
+ # to force the asm version use: CFLAGS="-O3 -DASMV" ./configure
+ case "$cc" in
diff --git a/package/libzlib/libzlib.hash b/package/libzlib/libzlib.hash
index e3736b1011..e6ca974e2f 100644
--- a/package/libzlib/libzlib.hash
+++ b/package/libzlib/libzlib.hash
@@ -1,4 +1,4 @@
 # From http://www.zlib.net/
-sha256 4ff941449631ace0d4d203e3483be9dbc9da454084111f97ea0a2114e19bf066  zlib-1.2.11.tar.xz
+sha256  7db46b8d7726232a621befaab4a1c870f00a90805511c0e0090441dac57def18  zlib-1.2.12.tar.xz
 # License files, locally calculated
-sha256 7960b6b1cc63e619abb77acaea5427159605afee8c8b362664f4effc7d7f7d15  README
+sha256  fc2c3368901700f0acdeb1d8afeaca5923296768ec6824ecdf627aac396001fd  README
diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index a10fc748d1..933732d6ba 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZLIB_VERSION = 1.2.11
+LIBZLIB_VERSION = 1.2.12
 LIBZLIB_SOURCE = zlib-$(LIBZLIB_VERSION).tar.xz
 LIBZLIB_SITE = http://www.zlib.net
 LIBZLIB_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
