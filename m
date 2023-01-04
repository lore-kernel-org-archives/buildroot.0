Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43551C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1D2D45E00;
	Tue, 21 Feb 2023 00:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1D2D45E00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TmU2wuGso-PN; Tue, 21 Feb 2023 00:13:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8285A4EE4C;
	Tue, 21 Feb 2023 00:13:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8285A4EE4C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 52F871BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEDAE6FAC4
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEDAE6FAC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OYv11F0DJLZf for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 111536FAA4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 111536FAA4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F4051828C8; Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 23:11:50 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 11479db32c5ea6bbdd7ce9b77873561a2ca07cfb
X-Git-Newrev: f8a2e1dc08a4de2db903a4a5a41c8541e6abfe81
X-Patchwork-Hint: ignore
Message-Id: <20230220205225.F4051828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] bash: bump version to 5.2.15
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
Content-Type: multipart/mixed; boundary="===============3762728773823871312=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3762728773823871312==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f8a2e1dc08a4de2db903a4a5a41c8541e6abfe81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Martin Hundebøll <martin@geanix.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...typo-local_shiftstates-vs.-locale_shiftst.patch | 72 ----------------------
 ...ix-dequote_pathname-vs.-udequote_pathname.patch | 40 ------------
 package/bash/bash.hash                             |  4 +-
 package/bash/bash.mk                               |  2 +-
 4 files changed, 3 insertions(+), 115 deletions(-)

diff --git a/package/bash/0002-locale-fix-typo-local_shiftstates-vs.-locale_shiftst.patch b/package/bash/0002-locale-fix-typo-local_shiftstates-vs.-locale_shiftst.patch
deleted file mode 100644
index 1636c18036..0000000000
--- a/package/bash/0002-locale-fix-typo-local_shiftstates-vs.-locale_shiftst.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 3d6b9e18506ad9daf4ec7b7d406b38d58ec88009 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Thu, 11 Mar 2021 20:48:36 +0100
-Subject: [PATCH] locale: fix typo local_shiftstates vs. locale_shiftstates
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-
-  locale.c:94:3: error: ‘local_shiftstates’ undeclared (first use in this function); did you mean ‘locale_shiftstates’?
-     94 |   local_shiftstates = 0;
-        |   ^~~~~~~~~~~~~~~~~
-        |   locale_shiftstates
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- locale.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/locale.c b/locale.c
-index 17ccc58..d6dd95a 100644
---- a/locale.c
-+++ b/locale.c
-@@ -91,7 +91,7 @@ set_default_locale ()
- #if defined (HANDLE_MULTIBYTE)
-   locale_shiftstates = mblen ((char *)NULL, 0);
- #else
--  local_shiftstates = 0;
-+  locale_shiftstates = 0;
- #endif
- }
- 
-@@ -117,7 +117,7 @@ set_default_locale_vars ()
- #    if defined (HANDLE_MULTIBYTE)
-       locale_shiftstates = mblen ((char *)NULL, 0);
- #    else
--      local_shiftstates = 0;
-+      locale_shiftstates = 0;
- #    endif
- 
-       u32reset ();
-@@ -226,7 +226,7 @@ set_locale_var (var, value)
- #  if defined (HANDLE_MULTIBYTE)
-       locale_shiftstates = mblen ((char *)NULL, 0);
- #  else
--      local_shiftstates = 0;
-+      locale_shiftstates = 0;
- #  endif
-       u32reset ();
-       return r;
-@@ -250,7 +250,7 @@ set_locale_var (var, value)
- #if defined (HANDLE_MULTIBYTE)
- 	  locale_shiftstates = mblen ((char *)NULL, 0);
- #else
--	  local_shiftstates = 0;
-+	  locale_shiftstates = 0;
- #endif
- 	  u32reset ();
- 	}
-@@ -391,7 +391,7 @@ reset_locale_vars ()
- #  if defined (HANDLE_MULTIBYTE)
-   locale_shiftstates = mblen ((char *)NULL, 0);
- #  else
--  local_shiftstates = 0;
-+  locale_shiftstates = 0;
- #  endif
-   u32reset ();
- #endif
--- 
-2.30.1
-
diff --git a/package/bash/0003-glob-fix-dequote_pathname-vs.-udequote_pathname.patch b/package/bash/0003-glob-fix-dequote_pathname-vs.-udequote_pathname.patch
deleted file mode 100644
index a801f68236..0000000000
--- a/package/bash/0003-glob-fix-dequote_pathname-vs.-udequote_pathname.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From a60ab1e5e88863acf9b0e9bcaa7919bbf093da05 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Thu, 11 Mar 2021 20:55:52 +0100
-Subject: [PATCH] glob: fix dequote_pathname vs. udequote_pathname
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-
-  glob.c:123:28: error: static declaration of ‘udequote_pathname’ follows non-static declaration
-    123 | #  define dequote_pathname udequote_pathname
-        |                            ^~~~~~~~~~~~~~~~~
-  glob.c:125:13: note: in expansion of macro ‘dequote_pathname’
-    125 | static void dequote_pathname PARAMS((char *));
-        |             ^~~~~~~~~~~~~~~~
-  glob.c:118:6: note: previous declaration of ‘udequote_pathname’ was here
-    118 | void udequote_pathname PARAMS((char *));
-        |      ^~~~~~~~~~~~~~~~~
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- lib/glob/glob.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/lib/glob/glob.c b/lib/glob/glob.c
-index eb6277f..c903b15 100644
---- a/lib/glob/glob.c
-+++ b/lib/glob/glob.c
-@@ -117,6 +117,5 @@ static int mbskipname PARAMS((char *, char *, int));
- #else
- #  define dequote_pathname udequote_pathname
- #endif
--static void dequote_pathname PARAMS((char *));
- static int glob_testdir PARAMS((char *, int));
- static char **glob_dir_to_array PARAMS((char *, char **, int));
- 
--- 
-2.30.1
-
diff --git a/package/bash/bash.hash b/package/bash/bash.hash
index 4660e9d38a..e0a1ebac91 100644
--- a/package/bash/bash.hash
+++ b/package/bash/bash.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature from
-# https://ftp.gnu.org/gnu/bash/bash-5.1.16.tar.gz.sig
-sha256  5bac17218d3911834520dad13cd1f85ab944e1c09ae1aba55906be1f8192f558  bash-5.1.16.tar.gz
+# https://ftp.gnu.org/gnu/bash/bash-5.2.15.tar.gz.sig
+sha256  13720965b5f4fc3a0d4b61dd37e7565c741da9a5be24edc2ae00182fc1b3588c  bash-5.2.15.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 3aca22898e..ec5e2d722f 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BASH_VERSION = 5.1.16
+BASH_VERSION = 5.2.15
 BASH_SITE = $(BR2_GNU_MIRROR)/bash
 BASH_DEPENDENCIES = ncurses readline host-bison
 BASH_LICENSE = GPL-3.0+

--===============3762728773823871312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3762728773823871312==--
