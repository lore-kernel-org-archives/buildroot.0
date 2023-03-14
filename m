Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8309AC6FD1D
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 22:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FE30403D6;
	Tue, 14 Mar 2023 22:26:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FE30403D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SfjAEssj7-Vk; Tue, 14 Mar 2023 22:26:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3CCB40B67;
	Tue, 14 Mar 2023 22:26:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3CCB40B67
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 905D01BF3A4
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 22:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75A2C813E9
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 22:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75A2C813E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y_4Ox-yG5BKb for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 22:26:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6ACBE813E7
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 22:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ACBE813E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A1DB87348; Tue, 14 Mar 2023 22:26:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 23:23:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7107a9876b29c0a3e6fc8424eca199dfea5ce5b2
X-Git-Newrev: 998f3e17da8658f983dcd8c3d565bfa7e4914f20
X-Patchwork-Hint: ignore
Message-Id: <20230314222613.5A1DB87348@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/git: bump to version 2.40.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3759420713493350632=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3759420713493350632==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=998f3e17da8658f983dcd8c3d565bfa7e4914f20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the package to v2.40.0. The release announcement and
notes are at [1].

While at it, also drop two Buildroot patches as these have been
already applied upstream.

[1]: https://lore.kernel.org/git/xmqqjzzkv8xz.fsf@gitster.g/

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...util-avoid-redefining-system-function-nam.patch | 109 ---------------------
 ...util-undefine-system-names-before-redecla.patch |  55 -----------
 package/git/git.hash                               |   2 +-
 package/git/git.mk                                 |   2 +-
 4 files changed, 2 insertions(+), 166 deletions(-)

diff --git a/package/git/0001-git-compat-util-avoid-redefining-system-function-nam.patch b/package/git/0001-git-compat-util-avoid-redefining-system-function-nam.patch
deleted file mode 100644
index 24100e1f6e..0000000000
--- a/package/git/0001-git-compat-util-avoid-redefining-system-function-nam.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 86aeac96d04ae5381085c0f93acb12d3bfd06969 Mon Sep 17 00:00:00 2001
-From: Jeff King <peff@peff.net>
-Date: Wed, 30 Nov 2022 16:15:14 -0500
-Subject: [PATCH] git-compat-util: avoid redefining system function names
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Our git-compat-util header defines a few noop wrappers for system
-functions if they are not available. This was originally done with a
-macro, but in 15b52a44e0 (compat-util: type-check parameters of no-op
-replacement functions, 2020-08-06) we switched to inline functions,
-because it gives us basic type-checking.
-
-This can cause compilation failures when the system _does_ declare those
-functions but we choose not to use them, since the compiler will
-complain about the redeclaration. This was seen in the real world when
-compiling against certain builds of uclibc, which may leave
-_POSIX_THREAD_SAFE_FUNCTIONS unset, but still declare flockfile() and
-funlockfile().
-
-It can also be seen on any platform that has setitimer() if you choose
-to compile without it (which plausibly could happen if the system
-implementation is buggy). E.g., on Linux:
-
-  $ make NO_SETITIMER=IWouldPreferNotTo git.o
-      CC git.o
-  In file included from builtin.h:4,
-                   from git.c:1:
-  git-compat-util.h:344:19: error: conflicting types for ‘setitimer’; have ‘int(int,  const struct itimerval *, struct itimerval *)’
-    344 | static inline int setitimer(int which UNUSED,
-        |                   ^~~~~~~~~
-  In file included from git-compat-util.h:234:
-  /usr/include/x86_64-linux-gnu/sys/time.h:155:12: note: previous declaration of ‘setitimer’ with type ‘int(__itimer_which_t,  const struct itimerval * restrict,  struct itimerval * restrict)’
-    155 | extern int setitimer (__itimer_which_t __which,
-        |            ^~~~~~~~~
-  make: *** [Makefile:2714: git.o] Error 1
-
-Here I think the compiler is complaining about the lack of "restrict"
-annotations in our version, but even if we matched it completely (and
-there is no way to match all platforms anyway), it would still complain
-about a static declaration following a non-static one. Using macros
-doesn't have this problem, because the C preprocessor rewrites the name
-in our code before we hit this level of compilation.
-
-One way to fix this would just be to revert most of 15b52a44e0. What we
-really cared about there was catching build problems with
-precompose_argv(), which most platforms _don't_ build, and which is our
-custom function. So we could just switch the system wrappers back to
-macros; most people build the real versions anyway, and they don't
-change. So the extra type-checking isn't likely to catch bugs.
-
-But with a little work, we can have our cake and eat it, too. If we
-define the type-checking wrappers with a unique name, and then redirect
-the system names to them with macros, we still get our type checking,
-but without redeclaring the system function names.
-
-Signed-off-by: Jeff King <peff@peff.net>
-Signed-off-by: Junio C Hamano <gitster@pobox.com>
-[Bagas: cherry-picked from e0c08a4f738b3dea7a4e8fe3511c323cf1f41942 on next branch]
-Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
----
- git-compat-util.h | 13 ++++++++-----
- 1 file changed, 8 insertions(+), 5 deletions(-)
-
-diff --git a/git-compat-util.h b/git-compat-util.h
-index af05077560..f6882b9b50 100644
---- a/git-compat-util.h
-+++ b/git-compat-util.h
-@@ -341,11 +341,12 @@ struct itimerval {
- #endif
- 
- #ifdef NO_SETITIMER
--static inline int setitimer(int which UNUSED,
--			    const struct itimerval *value UNUSED,
--			    struct itimerval *newvalue UNUSED) {
-+static inline int git_setitimer(int which,
-+				const struct itimerval *value,
-+				struct itimerval *newvalue) {
- 	return 0; /* pretend success */
- }
-+#define setitimer(which,value,ovalue) git_setitimer(which,value,ovalue)
- #endif
- 
- #ifndef NO_LIBGEN_H
-@@ -1479,14 +1480,16 @@ int open_nofollow(const char *path, int flags);
- #endif
- 
- #ifndef _POSIX_THREAD_SAFE_FUNCTIONS
--static inline void flockfile(FILE *fh UNUSED)
-+static inline void git_flockfile(FILE *fh)
- {
- 	; /* nothing */
- }
--static inline void funlockfile(FILE *fh UNUSED)
-+static inline void git_funlockfile(FILE *fh)
- {
- 	; /* nothing */
- }
-+#define flockfile(fh) git_flockfile(fh)
-+#define funlockfile(fh) git_funlockfile(fh)
- #define getc_unlocked(fh) getc(fh)
- #endif
- 
-
-base-commit: cbf04937d5b9fcf0a76c28f69e6294e9e3ecd7e6
--- 
-An old man doll... just what I always wanted! - Clara
-
diff --git a/package/git/0002-git-compat-util-undefine-system-names-before-redecla.patch b/package/git/0002-git-compat-util-undefine-system-names-before-redecla.patch
deleted file mode 100644
index f6207300ee..0000000000
--- a/package/git/0002-git-compat-util-undefine-system-names-before-redecla.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From d4a11fd215195cd1ca6a43058ef250b688ade1f4 Mon Sep 17 00:00:00 2001
-From: Jeff King <peff@peff.net>
-Date: Fri, 2 Dec 2022 06:05:38 -0500
-Subject: [PATCH] git-compat-util: undefine system names before redeclaring
- them
-
-When we define a macro to point a system function (e.g., flockfile) to
-our custom wrapper, we should make sure that the system did not already
-define it as a macro. This is rarely a problem, but can cause
-compilation failures if both of these are true:
-
-  - we decide to define our own wrapper even though the system provides
-    the function; we know this happens at least with uclibc, which may
-    declare flockfile, etc, without _POSIX_THREAD_SAFE_FUNCTIONS
-
-  - the system version is declared as a macro; we know this happens at
-    least with uclibc's version of getc_unlocked()
-
-So just handling getc_unlocked() would be sufficient to deal with the
-real-world case we've seen. But since it's easy to do, we may as well be
-defensive about the other macro wrappers added in the previous patch.
-
-Signed-off-by: Jeff King <peff@peff.net>
-Signed-off-by: Junio C Hamano <gitster@pobox.com>
-[Bagas: cherry-picked from e1a95b78d8a26762ea04332de8b7c3878da51522 on next branch]
-Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
----
- git-compat-util.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/git-compat-util.h b/git-compat-util.h
-index f6882b9b50..dadb9e55cb 100644
---- a/git-compat-util.h
-+++ b/git-compat-util.h
-@@ -346,6 +346,7 @@ static inline int git_setitimer(int which,
- 				struct itimerval *newvalue) {
- 	return 0; /* pretend success */
- }
-+#undef setitimer
- #define setitimer(which,value,ovalue) git_setitimer(which,value,ovalue)
- #endif
- 
-@@ -1488,6 +1489,9 @@ static inline void git_funlockfile(FILE *fh)
- {
- 	; /* nothing */
- }
-+#undef flockfile
-+#undef funlockfile
-+#undef getc_unlocked
- #define flockfile(fh) git_flockfile(fh)
- #define funlockfile(fh) git_funlockfile(fh)
- #define getc_unlocked(fh) getc(fh)
--- 
-An old man doll... just what I always wanted! - Clara
-
diff --git a/package/git/git.hash b/package/git/git.hash
index b7840cd1eb..edb1595520 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  475f75f1373b2cd4e438706185175966d5c11f68c4db1e48c26257c43ddcf2d6  git-2.39.2.tar.xz
+sha256  b17a598fbf58729ef13b577465eb93b2d484df1201518b708b5044ff623bf46d  git-2.40.0.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 206d06ffe7..46ffc86151 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.39.2
+GIT_VERSION = 2.40.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+

--===============3759420713493350632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3759420713493350632==--
