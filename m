Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7A4CD37AB
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 19:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A23240850;
	Wed, 12 Nov 2025 19:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxBmzXNCrSiJ; Wed, 12 Nov 2025 19:39:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F88340AF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F88340AF7;
	Wed, 12 Nov 2025 19:39:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A4F924D
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A2444006D
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5aP0C-NjmJnj for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 19:39:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3F6740055
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3F6740055
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:39:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC66184406; Wed, 12 Nov 2025 19:39:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 12 Nov 2025 20:32:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f23b6ea8539f6f013070c7534e49ac6fb2dd586
X-Git-Newrev: d2afa96009857e96736285444afba071d8615986
X-Patchwork-Hint: ignore
Message-Id: <20251112193943.AC66184406@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlite: bump version to 3.51.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d2afa96009857e96736285444afba071d8615986
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://sqlite.org/releaselog/3_51_0.html

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/0001-disable-rpath.patch | 59 ---------------------------------
 package/sqlite/sqlite.hash              |  2 +-
 package/sqlite/sqlite.mk                |  4 +--
 3 files changed, 3 insertions(+), 62 deletions(-)

diff --git a/package/sqlite/0001-disable-rpath.patch b/package/sqlite/0001-disable-rpath.patch
deleted file mode 100644
index 6eb20488b0..0000000000
--- a/package/sqlite/0001-disable-rpath.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-Add the --disable-rpath configure script flag to address
-
-Upstream: https://sqlite.org/src/info/a59d9bb25e
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-
-Index: autosetup/sqlite-config.tcl
-==================================================================
---- a/autosetup/sqlite-config.tcl
-+++ b/autosetup/sqlite-config.tcl
-@@ -334,12 +334,12 @@
-         # canonical build!
-         static-shell=1
-           => {Link the sqlite3 shell app against the DLL instead of embedding sqlite3.c}
-       }
-       {canonical autoconf} {
--        # A potential TODO without a current use case:
--        #rpath=1 => {Disable use of the rpath linker flag}
-+        rpath=1 => {Disable use of the rpath linker flag}
-+
-         # soname: https://sqlite.org/src/forumpost/5a3b44f510df8ded
-         soname:=legacy
-           => {SONAME for libsqlite3.so. "none", or not using this flag, sets no
-               soname. "legacy" sets it to its historical value of
-               libsqlite3.so.0.  A value matching the glob "libsqlite3.*" sets
-@@ -2138,25 +2138,25 @@
- }
- 
- ########################################################################
- # Handle the --enable/disable-rpath flag.
- proc sqlite-handle-rpath {} {
--  proj-check-rpath
-   # autosetup/cc-shared.tcl sets the rpath flag definition in
-   # [get-define SH_LINKRPATH], but it does so on a per-platform basis
-   # rather than as a compiler check. Though we should do a proper
-   # compiler check (as proj-check-rpath does), we may want to consider
-   # adopting its approach of clearing the rpath flags for environments
-   # for which sqlite-env-is-unix-on-windows returns a non-empty
-   # string.
- 
--#  if {[proj-opt-truthy rpath]} {
--#    proj-check-rpath
--#  } else {
--#    msg-result "Disabling use of rpath."
--#    define LDFLAGS_RPATH ""
--#  }
-+  # https://sqlite.org/forum/forumpost/13cac3b56516f849
-+  if {[proj-opt-truthy rpath]} {
-+    proj-check-rpath
-+  } else {
-+    msg-result "Disabling use of rpath."
-+    define LDFLAGS_RPATH ""
-+  }
- }
- 
- ########################################################################
- # If the --dump-defines configure flag is provided then emit a list of
- # all [define] values to config.defines.txt, else do nothing.
-
diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 2ade5afe03..e33c87f34e 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a3db587a1b92ee5ddac2f66b3edb41b26f9c867275782d46c3a088977d6a5b18  sqlite-autoconf-3500400.tar.gz
+sha256  42e26dfdd96aa2e6b1b1be5c88b0887f9959093f650d693cb02eb9c36d146ca5  sqlite-autoconf-3510000.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 667ee8d70e..13ae9d9281 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.50.4
-SQLITE_TAR_VERSION = 3500400
+SQLITE_VERSION = 3.51.0
+SQLITE_TAR_VERSION = 3510000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2025
 SQLITE_LICENSE = blessing
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
