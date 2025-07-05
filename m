Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D582AC8303D
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 09:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DBDD82881;
	Sat,  5 Jul 2025 09:40:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AkLqO1bUZUym; Sat,  5 Jul 2025 09:40:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96ABA82B21
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96ABA82B21;
	Sat,  5 Jul 2025 09:40:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A77A7AB
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 09:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00B4A829FD
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 09:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJkpGMwwf5eT for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 09:40:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10C3F821E2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10C3F821E2
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 09:40:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 014A385EFD; Sat,  5 Jul 2025 09:40:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Jul 2025 11:15:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1072488bd8ad82f1499b3ea6a7702b25f8e991df
X-Git-Newrev: baa81362ef38ca3c7d1f012029c1b95b9abb5649
X-Patchwork-Hint: ignore
Message-Id: <20250705094021.014A385EFD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/readline: Use configure options to
 link with ncurses
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=baa81362ef38ca3c7d1f012029c1b95b9abb5649
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use configure options to link with ncurses available since version 8.2:
https://cgit.git.savannah.gnu.org/cgit/readline.git/tree/NEWS?h=readline-8.3#n100

Removed a 14 year-old patch added with buildroot commit
b864790383b1cb8d51e5202bb750c0a6601b21ab.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                     |  1 -
 package/readline/0001-curses-link.patch | 18 ------------------
 package/readline/readline.mk            |  5 ++++-
 3 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f5b158c450..298d080475 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1014,7 +1014,6 @@ package/rapidxml/0001-ensure-internal-print-operations-are-declared-before.patch
 package/read-edid/0001-Fix-install-file-list.patch lib_patch.Upstream
 package/read-edid/0002-Fix-compiler-check.patch lib_patch.Upstream
 package/read-edid/0003-fix-build-with-gcc-10.patch lib_patch.Upstream
-package/readline/0001-curses-link.patch lib_patch.Upstream
 package/redis/0001-uclibc.patch lib_patch.Upstream
 package/redis/0002-largefile-conditional-define.patch lib_patch.Upstream
 package/redis/0003-redis.conf-adjust-defauts-for-buildroot.patch lib_patch.Upstream
diff --git a/package/readline/0001-curses-link.patch b/package/readline/0001-curses-link.patch
deleted file mode 100644
index 6afc5ba078..0000000000
--- a/package/readline/0001-curses-link.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-link readline directly to ncurses since it needs symbols from it
-
-upstream readline does this on purpose (no direct linking), but
-it doesn't make much sense in a Linux world
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- a/support/shobj-conf
-+++ b/support/shobj-conf
-@@ -42,7 +42,7 @@
- SHOBJ_LIBS=
- 
- SHLIB_XLDFLAGS=
--SHLIB_LIBS=
-+SHLIB_LIBS=-lncurses
- 
- SHLIB_DOT='.'
- SHLIB_LIBPREF='lib'
diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index f46d6783f1..f69cbe45e2 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -11,7 +11,10 @@ READLINE_DEPENDENCIES = ncurses host-autoconf
 HOST_READLINE_DEPENDENCIES = host-ncurses host-autoconf
 READLINE_CONF_ENV = bash_cv_func_sigsetjmp=yes \
 	bash_cv_wcwidth_broken=no
-READLINE_CONF_OPTS = --disable-install-examples
+READLINE_CONF_OPTS = \
+	--disable-install-examples \
+	--with-curses \
+	--with-shared-termcap-library
 READLINE_LICENSE = GPL-3.0+
 READLINE_LICENSE_FILES = COPYING
 READLINE_CPE_ID_VENDOR = gnu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
