Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DA2C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 12:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A965B8293F;
	Mon,  4 Apr 2022 12:32:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Htj4GsdQ13FY; Mon,  4 Apr 2022 12:32:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DEEB82919;
	Mon,  4 Apr 2022 12:32:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FAF71BF3D1
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19874409B1
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:32:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9hoUJaYcAvDl for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 12:32:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54D1E409A6
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 12:32:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5517A86168; Mon,  4 Apr 2022 12:22:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 14:31:06 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 143097f780ddbe860d0a06e430d7c3253ecd6250
X-Git-Newrev: 0612a2231fa3b7de6356afd22436892d9d620461
X-Patchwork-Hint: ignore
Message-Id: <20220404122247.5517A86168@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libzlib: security
 bump version to 1.2.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=0612a2231fa3b7de6356afd22436892d9d620461
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes CVE-2018-25032.

Release notes:
http://madler.net/pipermail/zlib-announce_madler.net/2022/000012.html

Changelog: https://github.com/madler/zlib/blob/master/ChangeLog

Added upstream patch to fix build error.

Updated license hash due to version bump, reformatted hashes:
https://github.com/madler/zlib/commit/21767c654d31d2dccdde4330529775c6c5fd5389

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a7fa40a9c1e93c063bbc5c5d4cac0c67493087a7)
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
