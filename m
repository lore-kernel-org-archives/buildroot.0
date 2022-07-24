Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE51FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 12:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 849B74163F;
	Sun, 24 Jul 2022 12:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 849B74163F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NajkfLyYTNMN; Sun, 24 Jul 2022 12:25:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7188340186;
	Sun, 24 Jul 2022 12:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7188340186
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C06C1BF344
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA5A784C57
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA5A784C57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8seA8LskJ7VN for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 12:20:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46CB884C4D
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 12:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46CB884C4D
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3F53185C22; Sun, 24 Jul 2022 12:06:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 14:19:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b438c1bead8267a1cbcc64e2a84ea3224b32aed7
X-Git-Newrev: 855ea9c935c26de1e5ef581712e7d432d729d624
X-Patchwork-Hint: ignore
Message-Id: <20220724120647.3F53185C22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pillow: bump to version
 9.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=855ea9c935c26de1e5ef581712e7d432d729d624
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...0001-Search-pkg-config-system-libs-cflags.patch | 33 ----------------------
 package/python-pillow/python-pillow.hash           |  4 +--
 package/python-pillow/python-pillow.mk             |  4 +--
 3 files changed, 4 insertions(+), 37 deletions(-)

diff --git a/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch b/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
deleted file mode 100644
index d0552ce0f4..0000000000
--- a/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 9ea46247048f861f088f09541cd434aeb16e6f9c Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Tue, 15 Mar 2022 23:31:59 -0600
-Subject: [PATCH] Search pkg-config system libs/cflags.
-
-We need to search the system paths as well from pkg-config for
-some packages to be found properly.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-9ea46247048f861f088f09541cd434aeb16e6f9c]
----
- setup.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 9a05e5105..d41aedbd6 100755
---- a/setup.py
-+++ b/setup.py
-@@ -252,8 +252,8 @@ def _cmd_exists(cmd):
- def _pkg_config(name):
-     try:
-         command = os.environ.get("PKG_CONFIG", "pkg-config")
--        command_libs = [command, "--libs-only-L", name]
--        command_cflags = [command, "--cflags-only-I", name]
-+        command_libs = [command, "--libs-only-L", "--keep-system-libs", name]
-+        command_cflags = [command, "--cflags-only-I", "--keep-system-cflags", name]
-         if not DEBUG:
-             command_libs.append("--silence-errors")
-             command_cflags.append("--silence-errors")
--- 
-2.25.1
-
diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index ff23ed6299..0e407bd55c 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  f0d347298e72b403fbc3198677f394bb  Pillow-9.1.1.tar.gz
-sha256  7502539939b53d7565f3d11d87c78e7ec900d3c72945d4ee0e2f250d598309a0  Pillow-9.1.1.tar.gz
+md5  218bdb951f3e59e8b782e329ece3416d  Pillow-9.2.0.tar.gz
+sha256  75e636fd3e0fb872693f23ccb8a5ff2cd578801251f3a4f6854c6a5d437d3c04  Pillow-9.2.0.tar.gz
 
 # Locally computed sha256 checksums
 sha256  a6554cb737ba6c9b47d3301f78de03b4ed0d3f08d6cf9400714f3d4c894f6943  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 0d189ac0ca..7cff54e9ea 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 9.1.1
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/43/6e/59853546226ee6200f9ba6e574d11604b60ad0754d2cbd1c8f3246b70418
+PYTHON_PILLOW_VERSION = 9.2.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/8c/92/2975b464d9926dc667020ed1abfa6276e68c3571dcb77e43347e15ee9eed
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
