Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC94C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F78F4F467;
	Fri, 28 Feb 2025 16:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8sjqIVM1n4rg; Fri, 28 Feb 2025 16:49:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA3864FF08
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA3864FF08;
	Fri, 28 Feb 2025 16:49:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 184391DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D864424F8
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rxEk6Vnii6vJ for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1687424FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1687424FB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD2B587C34; Fri, 28 Feb 2025 16:29:56 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 2 Jan 2025 21:32:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d58574af1cc94f5fb1f61f49d648041f0f405ac5
X-Git-Newrev: b7882d024ae484c52473955fbbcbf3b5f0717c2f
X-Patchwork-Hint: ignore
Message-Id: <20250228162956.AD2B587C34@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bash: bump to version
 5.2.37
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7882d024ae484c52473955fbbcbf3b5f0717c2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log, see:
https://git.savannah.gnu.org/cgit/bash.git/log/?h=c5c97b371044a44b701b6efa35984a3e1956344e

Other changes:
  - Refactor necessary patches
  - Remove upstream patch
    0003-configure-invert-condition-for-strtoimax-builtin.patch

run-tests tests.package.test_bash.TestBash.test_run passed

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[Julien:
  - add change log url in commit log
  - remove .checkpackageignore entry to fix check-package error
  - update gpg signature url in bash.hash
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 ...-fix-compilation-for-non-multibyte-builds.patch |  8 +--
 ...re-invert-condition-for-strtoimax-builtin.patch | 62 ----------------------
 package/bash/bash.hash                             |  4 +-
 package/bash/bash.mk                               |  2 +-
 5 files changed, 7 insertions(+), 70 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4ae853c91f..7e575dc950 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -299,7 +299,6 @@ package/babeld/S50babeld Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch lib_patch.Upstream
 package/bash/0001-input.h-add-missing-include-on-stdio.h.patch lib_patch.Upstream
 package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch lib_patch.Upstream
-package/bash/0003-configure-invert-condition-for-strtoimax-builtin.patch lib_patch.Upstream
 package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch lib_patch.Upstream
 package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch lib_patch.Upstream
 package/bc/0003-dc-fix-exit-code-of-q-command.patch lib_patch.Upstream
diff --git a/package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch b/package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch
index d330de5cd4..378ff0dfd3 100644
--- a/package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch
+++ b/package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch
@@ -22,7 +22,7 @@ diff --git a/parse.y b/parse.y
 index 1d12e639..8f1355c6 100644
 --- a/parse.y
 +++ b/parse.y
-@@ -2625,6 +2625,7 @@ next_alias_char:
+@@ -2640,6 +2640,7 @@ next_alias_char:
        parser_state |= PST_ENDALIAS;
        /* We need to do this to make sure last_shell_getc_is_singlebyte returns
  	 true, since we are returning a single-byte space. */
@@ -30,7 +30,7 @@ index 1d12e639..8f1355c6 100644
        if (shell_input_line_index == shell_input_line_len && last_shell_getc_is_singlebyte == 0)
  	{
  #if 0
-@@ -2638,6 +2639,7 @@ next_alias_char:
+@@ -2653,6 +2654,7 @@ next_alias_char:
  	  shell_input_line_property[shell_input_line_index - 1] = 1;
  #endif
  	}
@@ -42,7 +42,7 @@ diff --git a/y.tab.c b/y.tab.c
 index 50c5845b..799f730f 100644
 --- a/y.tab.c
 +++ b/y.tab.c
-@@ -4936,6 +4936,7 @@ next_alias_char:
+@@ -4955,6 +4955,7 @@ next_alias_char:
        parser_state |= PST_ENDALIAS;
        /* We need to do this to make sure last_shell_getc_is_singlebyte returns
  	 true, since we are returning a single-byte space. */
@@ -50,7 +50,7 @@ index 50c5845b..799f730f 100644
        if (shell_input_line_index == shell_input_line_len && last_shell_getc_is_singlebyte == 0)
  	{
  #if 0
-@@ -4949,6 +4950,7 @@ next_alias_char:
+@@ -4968,6 +4969,7 @@ next_alias_char:
  	  shell_input_line_property[shell_input_line_index - 1] = 1;
  #endif
  	}
diff --git a/package/bash/0003-configure-invert-condition-for-strtoimax-builtin.patch b/package/bash/0003-configure-invert-condition-for-strtoimax-builtin.patch
deleted file mode 100644
index c412dcfce2..0000000000
--- a/package/bash/0003-configure-invert-condition-for-strtoimax-builtin.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 754e0d1edc1c01b18f4890de7c58f7610e589d76 Mon Sep 17 00:00:00 2001
-From: Vincent Fazio <vfazio@gmail.com>
-Date: Tue, 7 Feb 2023 03:55:28 -0600
-Subject: [PATCH] configure: invert condition for strtoimax builtin
-
-Previously, bash would attempt to build a replacement for strtoimax if
-it found that the C library had the function already declared.
-
-This caused build errors when linking against static libraries that did
-not define the function as a weak alias but, in reality, was a logic
-error since bash should only provide it's own implementation if one is
-not provided by the C library.
-
-Now, fix this by inverting the logic.
-
-Upstream:
-  https://git.savannah.gnu.org/cgit/bash.git/commit/?h=devel&id=43e861c2cd840946a81dfd0386966eb4f3a17ce9
-
-Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[yann.morin.1998@free.fr: patch configure after the m file]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- configure       | 6 +++++-
- m4/strtoimax.m4 | 5 ++++-
- 2 files changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/m4/strtoimax.m4 b/m4/strtoimax.m4
-index 30985723..fa43ac7b 100644
---- a/m4/strtoimax.m4
-+++ b/m4/strtoimax.m4
-@@ -29,7 +29,10 @@ AC_CACHE_VAL(bash_cv_func_strtoimax,
-   fi
- ])
- AC_MSG_RESULT($bash_cv_func_strtoimax)
--if test $bash_cv_func_strtoimax = yes; then
-+if test "$ac_cv_have_decl_strtoimax" = "yes" ; then
-+AC_DEFINE([HAVE_DECL_STRTOIMAX], [1])
-+fi
-+if test $bash_cv_func_strtoimax = no; then
- AC_LIBOBJ(strtoimax)
- fi
- ])
-diff --git a/configure b/configure
-index 47313753..6039cee7 100755
---- a/configure
-+++ b/configure
-@@ -20443,7 +20443,11 @@ fi
- 
- { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $bash_cv_func_strtoimax" >&5
- printf "%s\n" "$bash_cv_func_strtoimax" >&6; }
--if test $bash_cv_func_strtoimax = yes; then
-+if test "$ac_cv_have_decl_strtoimax" = "yes" ; then
-+printf "%s\n" "#define HAVE_DECL_STRTOIMAX 1" >>confdefs.h
-+
-+fi
-+if test $bash_cv_func_strtoimax = no; then
- case " $LIBOBJS " in
-   *" strtoimax.$ac_objext "* ) ;;
-   *) LIBOBJS="$LIBOBJS strtoimax.$ac_objext"
--- 
-2.25.1
-
diff --git a/package/bash/bash.hash b/package/bash/bash.hash
index 44c1c5ed50..c2fb1d38d4 100644
--- a/package/bash/bash.hash
+++ b/package/bash/bash.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature from
-# https://ftp.gnu.org/gnu/bash/bash-5.2.21.tar.gz.sig
-sha256  c8e31bdc59b69aaffc5b36509905ba3e5cbb12747091d27b4b977f078560d5b8  bash-5.2.21.tar.gz
+# https://ftp.gnu.org/gnu/bash/bash-5.2.37.tar.gz.sig
+sha256  9599b22ecd1d5787ad7d3b7bf0c59f312b3396d1e281175dd1f8a4014da621ff  bash-5.2.37.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 9d173a5c7c..81f698f166 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BASH_VERSION = 5.2.21
+BASH_VERSION = 5.2.37
 BASH_SITE = $(BR2_GNU_MIRROR)/bash
 BASH_DEPENDENCIES = ncurses readline host-bison
 BASH_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
