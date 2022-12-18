Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2A2C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18F5580F53;
	Mon, 20 Feb 2023 23:06:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18F5580F53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PUlnZKuJcTqj; Mon, 20 Feb 2023 23:06:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B99AF82572;
	Mon, 20 Feb 2023 23:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B99AF82572
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 89C191BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAF06612CE
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAF06612CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G9pbcKCzrVbv for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D1D9612B4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D1D9612B4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 664DC81979; Mon, 20 Feb 2023 20:52:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 13:37:42 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 48a3fc3f361f2720007f7fd3851fab0cfa25f092
X-Git-Newrev: a6105112e82e3ca5162a56aa3a47bf6b49af2e0b
X-Patchwork-Hint: ignore
Message-Id: <20230220205211.664DC81979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/git: bump to version
 2.39.0
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
Content-Type: multipart/mixed; boundary="===============6731365634195505717=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6731365634195505717==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a6105112e82e3ca5162a56aa3a47bf6b49af2e0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The git package in Buildroot is quite lagging behind (v2.31.4, released
on July 12, 2022 while the baseline v2.31.0 was released on March 15,
2021). Bump the package to v2.39.0 (released December 12, 2022).

While at it, also replace patch fixing uclibc no threads build with two
patches cherry-picked from upstream next branch, which fixes the same
issue by fixing the handling of flockfile(), funlockfile(), and
getc_unlocked() declarations. These patches missed the release but
planned for next maintenance release (v2.39.1).

The reason for replacing the patch is when original fix patch was
upstreamed [1], Jeff King noted that the build failure root cause
was flockfile() is defined regardless of whether uclibc is configured with
threads support or not [2].

Release notes for v2.39.0 is available on release announcement on Git
mailing list at [3].

[1]: https://lore.kernel.org/git/20221125092339.29433-1-bagasdotme@gmail.com/
[2]: https://lore.kernel.org/git/Y4RAr04vS%2FTOM5uh@coredump.intra.peff.net/
[3]: https://lore.kernel.org/git/xmqqlencspnl.fsf@gitster.g/

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/0001-Fix-build-without-threads.patch   | 100 -------------------
 ...util-avoid-redefining-system-function-nam.patch | 107 +++++++++++++++++++++
 ...util-undefine-system-names-before-redecla.patch |  55 +++++++++++
 package/git/git.hash                               |   2 +-
 package/git/git.mk                                 |   4 +-
 5 files changed, 164 insertions(+), 104 deletions(-)

diff --git a/package/git/0001-Fix-build-without-threads.patch b/package/git/0001-Fix-build-without-threads.patch
deleted file mode 100644
index 7ce85ffaf8..0000000000
--- a/package/git/0001-Fix-build-without-threads.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 07d66af3b0800764087c4151d4f6562d4f8cce05 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 14 Dec 2020 23:00:33 +0100
-Subject: [PATCH] Fix build without threads
-
-Build without threads is broken since version 2.29.0 and
-https://github.com/git/git/commit/15b52a44e0c92a0658e891194a5b0610d1f53afc:
-
-In file included from cache.h:4,
-                 from blame.c:1:
-git-compat-util.h:1238:20: error: static declaration of 'flockfile' follows non-static declaration
- static inline void flockfile(FILE *fh)
-                    ^~~~~~~~~
-In file included from git-compat-util.h:168,
-                 from cache.h:4,
-                 from blame.c:1:
-/nvme/rc-buildroot-test/scripts/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/stdio.h:806:13: note: previous declaration of 'flockfile' was here
- extern void flockfile (FILE *__stream) __THROW;
-             ^~~~~~~~~
-In file included from cache.h:4,
-                 from blame.c:1:
-git-compat-util.h:1242:20: error: static declaration of 'funlockfile' follows non-static declaration
- static inline void funlockfile(FILE *fh)
-                    ^~~~~~~~~~~
-In file included from git-compat-util.h:168,
-                 from cache.h:4,
-                 from blame.c:1:
-/nvme/rc-buildroot-test/scripts/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/stdio.h:813:13: note: previous declaration of 'funlockfile' was here
- extern void funlockfile (FILE *__stream) __THROW;
-             ^~~~~~~~~~~
-
-To avoid this build failure, check if flockfile is available before
-defining flockfile, funlockfile and getc_unlocked
-
-Fixes:
- - http://autobuild.buildroot.org/results/d41638d1ad8e78dd6f654367c905996b838ee649
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Makefile          | 5 +++++
- configure.ac      | 6 ++++++
- git-compat-util.h | 2 +-
- 3 files changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 6fb86c5862..58d0893a12 100644
---- a/Makefile
-+++ b/Makefile
-@@ -232,6 +232,8 @@ all::
- # Define NO_STRUCT_ITIMERVAL if you don't have struct itimerval
- # This also implies NO_SETITIMER
- #
-+# Define NO_FLOCKFILE if you don't have flockfile()
-+#
- # Define NO_FAST_WORKING_DIRECTORY if accessing objects in pack files is
- # generally faster on your platform than accessing the working directory.
- #
-@@ -1638,6 +1640,9 @@ endif
- ifdef NO_SETITIMER
- 	COMPAT_CFLAGS += -DNO_SETITIMER
- endif
-+ifdef NO_FLOCKFILE
-+	COMPAT_CFLAGS += -DNO_FLOCKFILE
-+endif
- ifdef NO_PREAD
- 	COMPAT_CFLAGS += -DNO_PREAD
- 	COMPAT_OBJS += compat/pread.o
-diff --git a/configure.ac b/configure.ac
-index 66aedb9288..d4295b5c69 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1132,6 +1132,12 @@ GIT_CHECK_FUNC(setitimer,
- [NO_SETITIMER=YesPlease])
- GIT_CONF_SUBST([NO_SETITIMER])
- #
-+# Define NO_FLOCKFILE if you don't have flockfile.
-+GIT_CHECK_FUNC(flockfile,
-+[NO_FLOCKFILE=],
-+[NO_FLOCKFILE=YesPlease])
-+GIT_CONF_SUBST([NO_FLOCKFILE])
-+#
- # Define NO_STRCASESTR if you don't have strcasestr.
- GIT_CHECK_FUNC(strcasestr,
- [NO_STRCASESTR=],
-diff --git a/git-compat-util.h b/git-compat-util.h
-index 7d509c5022..279cdd941e 100644
---- a/git-compat-util.h
-+++ b/git-compat-util.h
-@@ -1236,7 +1236,7 @@ int warn_on_fopen_errors(const char *path);
- # define SHELL_PATH "/bin/sh"
- #endif
- 
--#ifndef _POSIX_THREAD_SAFE_FUNCTIONS
-+#if !defined(_POSIX_THREAD_SAFE_FUNCTIONS) && defined(NO_FLOCKFILE)
- static inline void flockfile(FILE *fh)
- {
- 	; /* nothing */
--- 
-2.29.2
-
diff --git a/package/git/0001-git-compat-util-avoid-redefining-system-function-nam.patch b/package/git/0001-git-compat-util-avoid-redefining-system-function-nam.patch
new file mode 100644
index 0000000000..dbde87940a
--- /dev/null
+++ b/package/git/0001-git-compat-util-avoid-redefining-system-function-nam.patch
@@ -0,0 +1,107 @@
+From 385f67eb2254edb1fb4cf523e5e3d5a8f123d72c Mon Sep 17 00:00:00 2001
+From: Jeff King <peff@peff.net>
+Date: Wed, 30 Nov 2022 16:15:14 -0500
+Subject: [PATCH] git-compat-util: avoid redefining system function names
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Our git-compat-util header defines a few noop wrappers for system
+functions if they are not available. This was originally done with a
+macro, but in 15b52a44e0 (compat-util: type-check parameters of no-op
+replacement functions, 2020-08-06) we switched to inline functions,
+because it gives us basic type-checking.
+
+This can cause compilation failures when the system _does_ declare those
+functions but we choose not to use them, since the compiler will
+complain about the redeclaration. This was seen in the real world when
+compiling against certain builds of uclibc, which may leave
+_POSIX_THREAD_SAFE_FUNCTIONS unset, but still declare flockfile() and
+funlockfile().
+
+It can also be seen on any platform that has setitimer() if you choose
+to compile without it (which plausibly could happen if the system
+implementation is buggy). E.g., on Linux:
+
+  $ make NO_SETITIMER=IWouldPreferNotTo git.o
+      CC git.o
+  In file included from builtin.h:4,
+                   from git.c:1:
+  git-compat-util.h:344:19: error: conflicting types for ‘setitimer’; have ‘int(int,  const struct itimerval *, struct itimerval *)’
+    344 | static inline int setitimer(int which UNUSED,
+        |                   ^~~~~~~~~
+  In file included from git-compat-util.h:234:
+  /usr/include/x86_64-linux-gnu/sys/time.h:155:12: note: previous declaration of ‘setitimer’ with type ‘int(__itimer_which_t,  const struct itimerval * restrict,  struct itimerval * restrict)’
+    155 | extern int setitimer (__itimer_which_t __which,
+        |            ^~~~~~~~~
+  make: *** [Makefile:2714: git.o] Error 1
+
+Here I think the compiler is complaining about the lack of "restrict"
+annotations in our version, but even if we matched it completely (and
+there is no way to match all platforms anyway), it would still complain
+about a static declaration following a non-static one. Using macros
+doesn't have this problem, because the C preprocessor rewrites the name
+in our code before we hit this level of compilation.
+
+One way to fix this would just be to revert most of 15b52a44e0. What we
+really cared about there was catching build problems with
+precompose_argv(), which most platforms _don't_ build, and which is our
+custom function. So we could just switch the system wrappers back to
+macros; most people build the real versions anyway, and they don't
+change. So the extra type-checking isn't likely to catch bugs.
+
+But with a little work, we can have our cake and eat it, too. If we
+define the type-checking wrappers with a unique name, and then redirect
+the system names to them with macros, we still get our type checking,
+but without redeclaring the system function names.
+
+Signed-off-by: Jeff King <peff@peff.net>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+[Bagas: cherry-picked from e0c08a4f738b3dea7a4e8fe3511c323cf1f41942 on next branch]
+Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
+---
+ git-compat-util.h | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/git-compat-util.h b/git-compat-util.h
+index a76d0526f7..e3456bdd0d 100644
+--- a/git-compat-util.h
++++ b/git-compat-util.h
+@@ -341,11 +341,12 @@ struct itimerval {
+ #endif
+ 
+ #ifdef NO_SETITIMER
+-static inline int setitimer(int which UNUSED,
+-			    const struct itimerval *value UNUSED,
+-			    struct itimerval *newvalue UNUSED) {
++static inline int git_setitimer(int which,
++				const struct itimerval *value,
++				struct itimerval *newvalue) {
+ 	return 0; /* pretend success */
+ }
++#define setitimer(which,value,ovalue) git_setitimer(which,value,ovalue)
+ #endif
+ 
+ #ifndef NO_LIBGEN_H
+@@ -1471,14 +1472,16 @@ int open_nofollow(const char *path, int flags);
+ #endif
+ 
+ #ifndef _POSIX_THREAD_SAFE_FUNCTIONS
+-static inline void flockfile(FILE *fh UNUSED)
++static inline void git_flockfile(FILE *fh)
+ {
+ 	; /* nothing */
+ }
+-static inline void funlockfile(FILE *fh UNUSED)
++static inline void git_funlockfile(FILE *fh)
+ {
+ 	; /* nothing */
+ }
++#define flockfile(fh) git_flockfile(fh)
++#define funlockfile(fh) git_funlockfile(fh)
+ #define getc_unlocked(fh) getc(fh)
+ #endif
+ 
+-- 
+An old man doll... just what I always wanted! - Clara
+
diff --git a/package/git/0002-git-compat-util-undefine-system-names-before-redecla.patch b/package/git/0002-git-compat-util-undefine-system-names-before-redecla.patch
new file mode 100644
index 0000000000..9e3c9b662c
--- /dev/null
+++ b/package/git/0002-git-compat-util-undefine-system-names-before-redecla.patch
@@ -0,0 +1,55 @@
+From 6d406390b870fdb2cd9d18b12ebfabc12f5096df Mon Sep 17 00:00:00 2001
+From: Jeff King <peff@peff.net>
+Date: Fri, 2 Dec 2022 06:05:38 -0500
+Subject: [PATCH] git-compat-util: undefine system names before redeclaring
+ them
+
+When we define a macro to point a system function (e.g., flockfile) to
+our custom wrapper, we should make sure that the system did not already
+define it as a macro. This is rarely a problem, but can cause
+compilation failures if both of these are true:
+
+  - we decide to define our own wrapper even though the system provides
+    the function; we know this happens at least with uclibc, which may
+    declare flockfile, etc, without _POSIX_THREAD_SAFE_FUNCTIONS
+
+  - the system version is declared as a macro; we know this happens at
+    least with uclibc's version of getc_unlocked()
+
+So just handling getc_unlocked() would be sufficient to deal with the
+real-world case we've seen. But since it's easy to do, we may as well be
+defensive about the other macro wrappers added in the previous patch.
+
+Signed-off-by: Jeff King <peff@peff.net>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+[Bagas: cherry-picked from e1a95b78d8a26762ea04332de8b7c3878da51522 on next branch]
+Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
+---
+ git-compat-util.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/git-compat-util.h b/git-compat-util.h
+index e3456bdd0d..211861da0f 100644
+--- a/git-compat-util.h
++++ b/git-compat-util.h
+@@ -346,6 +346,7 @@ static inline int git_setitimer(int which,
+ 				struct itimerval *newvalue) {
+ 	return 0; /* pretend success */
+ }
++#undef setitimer
+ #define setitimer(which,value,ovalue) git_setitimer(which,value,ovalue)
+ #endif
+ 
+@@ -1480,6 +1481,9 @@ static inline void git_funlockfile(FILE *fh)
+ {
+ 	; /* nothing */
+ }
++#undef flockfile
++#undef funlockfile
++#undef getc_unlocked
+ #define flockfile(fh) git_flockfile(fh)
+ #define funlockfile(fh) git_funlockfile(fh)
+ #define getc_unlocked(fh) getc(fh)
+-- 
+An old man doll... just what I always wanted! - Clara
+
diff --git a/package/git/git.hash b/package/git/git.hash
index af09ea817b..57a77b2810 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  dbc80f88d36fcde2c7acaaa9343cfab0f56effe9aee60e5eb00f3f36b8a619b4  git-2.31.5.tar.xz
+sha256  ba199b13fb5a99ca3dec917b0bd736bc0eb5a9df87737d435eddfdf10d69265b  git-2.39.0.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 653b4f46ad..9918d4c1ef 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.31.5
+GIT_VERSION = 2.39.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
@@ -12,8 +12,6 @@ GIT_LICENSE_FILES = COPYING LGPL-2.1
 GIT_CPE_ID_VENDOR = git-scm
 GIT_SELINUX_MODULES = apache git xdg
 GIT_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
-# We're patching configure.ac
-GIT_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 GIT_DEPENDENCIES += host-pkgconf openssl

--===============6731365634195505717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6731365634195505717==--
