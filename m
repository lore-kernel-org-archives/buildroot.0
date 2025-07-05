Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C438C8303C
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 09:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DCAB839E4;
	Sat,  5 Jul 2025 09:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MmQ4S1jzjKLL; Sat,  5 Jul 2025 09:40:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB78F8399B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB78F8399B;
	Sat,  5 Jul 2025 09:40:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 252B6B0A
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 09:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B53E40726
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 09:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RUnO74fEQe2P for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 09:40:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 100F3406FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 100F3406FE
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 09:40:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC26F85EFC; Sat,  5 Jul 2025 09:40:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Jul 2025 11:15:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7d94f8f3492a1ce9ee1e907eeb58a5ba98bcba3
X-Git-Newrev: 1072488bd8ad82f1499b3ea6a7702b25f8e991df
X-Patchwork-Hint: ignore
Message-Id: <20250705094020.EC26F85EFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/readline: bump version to 8.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1674015788683720514=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1674015788683720514==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1072488bd8ad82f1499b3ea6a7702b25f8e991df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://cgit.git.savannah.gnu.org/cgit/readline.git/tree/NEWS?h=readline-8.3

Removed patch which is included in this release.

Added patch to fix build with non-wchar toolchains.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Fix-build-with-non-wchar-toolchains.patch | 42 ++++++++++++++++++++++
 ...2-patch-1-fix-crash-when-readline-is-star.patch | 41 ---------------------
 package/readline/readline.hash                     |  4 +--
 package/readline/readline.mk                       |  2 +-
 4 files changed, 45 insertions(+), 44 deletions(-)

diff --git a/package/readline/0001-Fix-build-with-non-wchar-toolchains.patch b/package/readline/0001-Fix-build-with-non-wchar-toolchains.patch
new file mode 100644
index 0000000000..2ec8c9c6a1
--- /dev/null
+++ b/package/readline/0001-Fix-build-with-non-wchar-toolchains.patch
@@ -0,0 +1,42 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 5 Jul 2025 07:48:20 +0200
+Subject: [PATCH] Fix build with non-wchar toolchains
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Commit a7f5650e6549e1b5c4e2e1fa30eee19de6bcbe7a added two functions to
+mbutil.c but forgot to add defines for HANDLE_MULTIBYTE causing build
+errors with toolchains without wchar support:
+
+../mbutil.c: In function ‘_rl_mb_strcaseeqn’:
+../mbutil.c:594:3: error: unknown type name ‘mbstate_t’
+
+Upstream: https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00002.html
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ mbutil.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/mbutil.c b/mbutil.c
+index 5243fd7..c15f3aa 100644
+--- a/mbutil.c
++++ b/mbutil.c
+@@ -584,6 +584,7 @@ _rl_find_prev_mbchar (const char *string, int seed, int flags)
+ #endif
+ }
+ 
++#if defined (HANDLE_MULTIBYTE)
+ /* Compare the first N characters of S1 and S2 without regard to case. If
+    FLAGS&1, apply the mapping specified by completion-map-case and make
+    `-' and `_' equivalent. Returns 1 if the strings are equal. */
+@@ -658,3 +659,4 @@ _rl_mb_charcasecmp (const char *s1, mbstate_t *ps1, const char *s2, mbstate_t *p
+     return 1;
+   return (wc1 == wc2);
+ }
++#endif /* HANDLE_MULTIBYTE */
+-- 
+2.39.5
+
diff --git a/package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch b/package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch
deleted file mode 100644
index c2c2d81260..0000000000
--- a/package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From b8d91eab12603fa88e095248855f5f772d182d05 Mon Sep 17 00:00:00 2001
-From: Chet Ramey <chet.ramey@case.edu>
-Date: Wed, 5 Oct 2022 10:41:16 -0400
-Subject: [PATCH] Readline-8.2 patch 1: fix crash when readline is started with
- an invalid locale specification
-
-Upstream: https://git.savannah.gnu.org/cgit/readline.git/patch/?id=7274faabe97ce53d6b464272d7e6ab6c1392837b
-[peter: stripped unrelated ._.gitignore change]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- nls.c      | 4 ++++
- patchlevel | 2 +-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/nls.c b/nls.c
-index 5c6a13b..8c027d6 100644
---- a/nls.c
-+++ b/nls.c
-@@ -141,6 +141,10 @@ _rl_init_locale (void)
-   if (lspec == 0)
-     lspec = "";
-   ret = setlocale (LC_CTYPE, lspec);	/* ok, since it does not change locale */
-+  if (ret == 0 || *ret == 0)
-+    ret = setlocale (LC_CTYPE, (char *)NULL);
-+  if (ret == 0 || *ret == 0)
-+    ret = RL_DEFAULT_LOCALE;
- #else
-   ret = (lspec == 0 || *lspec == 0) ? RL_DEFAULT_LOCALE : lspec;
- #endif
-diff --git a/patchlevel b/patchlevel
-index d8c9df7..fdf4740 100644
---- a/patchlevel
-+++ b/patchlevel
-@@ -1,3 +1,3 @@
- # Do not edit -- exists only for use by patch
- 
--0
-+1
--- 
-2.39.2
-
diff --git a/package/readline/readline.hash b/package/readline/readline.hash
index 627746d821..961ef77a0d 100644
--- a/package/readline/readline.hash
+++ b/package/readline/readline.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature from
-# https://ftp.gnu.org/gnu/readline/readline-8.2.tar.gz.sig
-sha256  3feb7171f16a84ee82ca18a36d7b9be109a52c04f492a053331d7d1095007c35  readline-8.2.tar.gz
+# https://ftp.gnu.org/gnu/readline/readline-8.3.tar.gz.sig
+sha256  fe5383204467828cd495ee8d1d3c037a7eba1389c22bc6a041f627976f9061cc  readline-8.3.tar.gz
 
 # Hash for license file
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index 66812dee77..f46d6783f1 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-READLINE_VERSION = 8.2
+READLINE_VERSION = 8.3
 READLINE_SITE = $(BR2_GNU_MIRROR)/readline
 READLINE_INSTALL_STAGING = YES
 READLINE_DEPENDENCIES = ncurses host-autoconf

--===============1674015788683720514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1674015788683720514==--
