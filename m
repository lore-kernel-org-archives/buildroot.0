Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01D5C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B56A84776;
	Fri, 28 Feb 2025 16:42:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w_y2AwmoLVvZ; Fri, 28 Feb 2025 16:42:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D7648477F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D7648477F;
	Fri, 28 Feb 2025 16:42:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DF4C68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C88594277D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t5S-NaJMIyxB for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF50F424F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF50F424F2
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D535784487; Fri, 28 Feb 2025 16:29:43 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 20 Dec 2024 21:08:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6b2e3b2ce548f54db17818c9bac4bcd65b8bc9b5
X-Git-Newrev: d21fdce7715878f2d1b2a44e450328f50c9862cb
X-Patchwork-Hint: ignore
Message-Id: <20250228162943.D535784487@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libnpth: bump to
 version 1.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=d21fdce7715878f2d1b2a44e450328f50c9862cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For the changelog, see:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=npth.git;a=log;h=npth-1.8

Remove merged patches.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...SERT_EXPOSE_RWLOCK_API-for-musl-C-library.patch | 37 ----------------
 ...-npth_rwlock_timedrdlock-is-not-supported.patch | 51 ----------------------
 package/libnpth/0003-Fix-previous-commit.patch     | 39 -----------------
 package/libnpth/libnpth.hash                       |  4 +-
 package/libnpth/libnpth.mk                         |  4 +-
 5 files changed, 3 insertions(+), 132 deletions(-)

diff --git a/package/libnpth/0001-Fix-INSERT_EXPOSE_RWLOCK_API-for-musl-C-library.patch b/package/libnpth/0001-Fix-INSERT_EXPOSE_RWLOCK_API-for-musl-C-library.patch
deleted file mode 100644
index bc5ed70a9c..0000000000
--- a/package/libnpth/0001-Fix-INSERT_EXPOSE_RWLOCK_API-for-musl-C-library.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 417abd56fd7bf45cd4948414050615cb1ad59134 Mon Sep 17 00:00:00 2001
-From: NIIBE Yutaka <gniibe@fsij.org>
-Date: Fri, 1 Mar 2024 13:53:52 +0900
-Subject: [PATCH] Fix INSERT_EXPOSE_RWLOCK_API for musl C library.
-
-* configure.ac: Add a case for musl system.
-
---
-
-GnuPG-bug-id: 5664
-Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
-
-Upstream: https://git.gnupg.org/cgi-bin/gitweb.cgi?p=npth.git;a=commit;h=417abd56fd7bf45cd4948414050615cb1ad59134
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index c1091b1..576a26e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -381,7 +381,10 @@ fi
- AC_SUBST(INSERT_NO_RWLOCK)
- 
- case "${host}" in
--    *-*-linux*|*-*-gnu*)
-+    *-*-linux-musl*)
-+        INSERT_EXPOSE_RWLOCK_API="1"
-+        ;;
-+    *-*-linux-gnu*|*-*-gnu*)
-         INSERT_EXPOSE_RWLOCK_API="defined(__USE_UNIX98) || defined(__USE_XOPEN2K)"
-         ;;
-     *)
--- 
-2.30.2
-
diff --git a/package/libnpth/0002-Return-a-run-time-error-if-npth_rwlock_timedrdlock-is-not-supported.patch b/package/libnpth/0002-Return-a-run-time-error-if-npth_rwlock_timedrdlock-is-not-supported.patch
deleted file mode 100644
index 0d9b38e4ce..0000000000
--- a/package/libnpth/0002-Return-a-run-time-error-if-npth_rwlock_timedrdlock-is-not-supported.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 01f03a91c9bd63910995aeef412beb3ca6dc9a67 Mon Sep 17 00:00:00 2001
-From: NIIBE Yutaka <gniibe@fsij.org>
-Date: Tue, 7 May 2024 13:45:47 +0900
-Subject: [PATCH] Return a run-time error if npth_rwlock_timedrdlock is not
- supported.
-
-* src/npth.c (npth_rwlock_timedrdlock): Return ENOSYS if not
-supported.
-(npth_rwlock_timedwrlock): Use HAVE_PTHREAD_RWLOCK_TRYWRLOCK.
-
---
-
-GnuPG-bug-id: 7109
-Fixed-commit: 363c370bd35dd0bb4e5636b2d4f06ea88c658794
-Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
-
-Upstream: https://git.gnupg.org/cgi-bin/gitweb.cgi?p=npth.git;a=commit;h=01f03a91c9bd63910995aeef412beb3ca6dc9a67
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/npth.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/npth.c b/src/npth.c
-index c0ff8da..f02540c 100644
---- a/src/npth.c
-+++ b/src/npth.c
-@@ -488,9 +488,11 @@ npth_rwlock_timedrdlock (npth_rwlock_t *rwlock, const struct timespec *abstime)
-   ENTER();
- #if HAVE_PTHREAD_RWLOCK_TIMEDRDLOCK
-   err = pthread_rwlock_timedrdlock (rwlock, abstime);
--#else
-+#elif HAVE_PTHREAD_RWLOCK_TRYRDLOCK
-   err = busy_wait_for ((trylock_func_t) pthread_rwlock_tryrdlock, rwlock,
- 		       abstime);
-+#else
-+  err = ENOSYS;
- #endif
-   LEAVE();
-   return err;
-@@ -533,7 +535,7 @@ npth_rwlock_timedwrlock (npth_rwlock_t *rwlock, const struct timespec *abstime)
-   ENTER();
- #if HAVE_PTHREAD_RWLOCK_TIMEDWRLOCK
-   err = pthread_rwlock_timedwrlock (rwlock, abstime);
--#elif HAVE_PTHREAD_RWLOCK_TRYRDLOCK
-+#elif HAVE_PTHREAD_RWLOCK_TRYWRLOCK
-   err = busy_wait_for ((trylock_func_t) pthread_rwlock_trywrlock, rwlock,
- 		       abstime);
- #else
--- 
-2.30.2
-
diff --git a/package/libnpth/0003-Fix-previous-commit.patch b/package/libnpth/0003-Fix-previous-commit.patch
deleted file mode 100644
index 5f3ce06bf6..0000000000
--- a/package/libnpth/0003-Fix-previous-commit.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 75c68399ef3bbb5d024f2a60474a7214fa479016 Mon Sep 17 00:00:00 2001
-From: NIIBE Yutaka <gniibe@fsij.org>
-Date: Mon, 13 May 2024 11:13:23 +0900
-Subject: [PATCH] Fix previous commit.
-
-Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
-
-Upstream: https://git.gnupg.org/cgi-bin/gitweb.cgi?p=npth.git;a=commit;h=75c68399ef3bbb5d024f2a60474a7214fa479016
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/npth.c | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/src/npth.c b/src/npth.c
-index f02540c..8dced17 100644
---- a/src/npth.c
-+++ b/src/npth.c
-@@ -178,6 +178,18 @@ static int initialized_or_any_threads;
- typedef int (*trylock_func_t) (void *);
- 
- #ifndef HAVE_PTHREAD_MUTEX_TIMEDLOCK
-+#define REQUIRE_THE_BUSY_WAIT_FOR_IMPLEMENTATION 1
-+#endif
-+
-+#if !HAVE_PTHREAD_RWLOCK_TIMEDRDLOCK && HAVE_PTHREAD_RWLOCK_TRYRDLOCK
-+#define REQUIRE_THE_BUSY_WAIT_FOR_IMPLEMENTATION 1
-+#endif
-+
-+#if !HAVE_PTHREAD_RWLOCK_TIMEDWRLOCK && HAVE_PTHREAD_RWLOCK_TRYWRLOCK
-+#define REQUIRE_THE_BUSY_WAIT_FOR_IMPLEMENTATION 1
-+#endif
-+
-+#if REQUIRE_THE_BUSY_WAIT_FOR_IMPLEMENTATION
- static int
- busy_wait_for (trylock_func_t trylock, void *lock,
- 	       const struct timespec *abstime)
--- 
-2.30.2
-
diff --git a/package/libnpth/libnpth.hash b/package/libnpth/libnpth.hash
index a140a23f64..ad541111a3 100644
--- a/package/libnpth/libnpth.hash
+++ b/package/libnpth/libnpth.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  a9f7adc1b1f6707071d29bfb3338c28b995ca1ce  npth-1.7.tar.bz2
-sha256  8589f56937b75ce33b28d312fccbf302b3b71ec3f3945fde6aaa74027914ad05  npth-1.7.tar.bz2
+sha1  6f60ce8540453e120d715f269d0c7cfd9e0b0d24  npth-1.8.tar.bz2
+sha256  8bd24b4f23a3065d6e5b26e98aba9ce783ea4fd781069c1b35d149694e90ca3e  npth-1.8.tar.bz2
 
 # Hash for license file:
 sha256  ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING.LIB
diff --git a/package/libnpth/libnpth.mk b/package/libnpth/libnpth.mk
index 634da6ed3a..76abf45fd5 100644
--- a/package/libnpth/libnpth.mk
+++ b/package/libnpth/libnpth.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-LIBNPTH_VERSION = 1.7
+LIBNPTH_VERSION = 1.8
 LIBNPTH_SOURCE = npth-$(LIBNPTH_VERSION).tar.bz2
 LIBNPTH_SITE = https://www.gnupg.org/ftp/gcrypt/npth
 LIBNPTH_LICENSE = LGPL-2.0+
 LIBNPTH_LICENSE_FILES = COPYING.LIB
 LIBNPTH_INSTALL_STAGING = YES
-# 0001-Fix-INSERT_EXPOSE_RWLOCK_API-for-musl-C-library.patch
-LIBNPTH_AUTORECONF = YES
 LIBNPTH_CONF_OPTS = --disable-tests
 HOST_LIBNPTH_CONF_OPTS = --disable-tests
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
