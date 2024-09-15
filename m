Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07BFC3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3507848EE;
	Sun, 15 Sep 2024 21:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_7hntETIdNq; Sun, 15 Sep 2024 21:43:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0931584A35
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0931584A35;
	Sun, 15 Sep 2024 21:43:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 108371BF94D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79047608BA
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VbpZ6WWjebsy for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F99660D80
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F99660D80
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9997682285; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 14:55:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ba1e1170cbaeb681e6fbbd5c73df94a17bbf236
X-Git-Newrev: 70519b2d239a3336869c2eb3814f8e124c43a564
X-Patchwork-Hint: ignore
Message-Id: <20240915213641.9997682285@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/memcached: update to 1.6.29
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=70519b2d239a3336869c2eb3814f8e124c43a564
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See the release notes for 1.6.29 here:
https://github.com/memcached/memcached/wiki/ReleaseNotes1629
Older release notes are also available.

Patch 0001 is upstream since commit
aceefca9bc7635eab4893f626aec78e9966db93c.

Patch 0002 is upstream since commit
d9bf02f6331fc0098af8997d2a571fc4525696fc.

Autoreconf of package is no longer needed.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../memcached/0001-logger.c-initialize-rport.patch | 55 -------------------
 .../memcached/0002-fix-build-on-uclibc-ng.patch    | 64 ----------------------
 package/memcached/memcached.hash                   |  6 +-
 package/memcached/memcached.mk                     |  4 +-
 4 files changed, 4 insertions(+), 125 deletions(-)

diff --git a/package/memcached/0001-logger.c-initialize-rport.patch b/package/memcached/0001-logger.c-initialize-rport.patch
deleted file mode 100644
index 002a689601..0000000000
--- a/package/memcached/0001-logger.c-initialize-rport.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From b3431c4fcaf65e66fda80ef89b79ff3da1912b4f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 25 Dec 2021 20:05:29 +0100
-Subject: [PATCH] logger.c: initialize rport
-
-Fix the following build failure raised since version 1.6.11 and
-https://github.com/memcached/memcached/commit/617d7cd64d04698b76fee74882627690017e20ad:
-
-logger.c: In function '_logger_parse_cce':
-logger.c:297:13: error: 'rport' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-  297 |     total = snprintf(scratch, LOGGER_PARSE_SCRATCH,
-      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-  298 |             "ts=%d.%d gid=%llu type=conn_close rip=%s rport=%hu transport=%s reason=%s cfd=%d\n",
-      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-  299 |             (int) e->tv.tv_sec, (int) e->tv.tv_usec, (unsigned long long) e->gid,
-      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-  300 |             rip, rport, transport_map[le->transport],
-      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-  301 |             reason_map[le->reason], le->sfd);
-      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/7a46ac38d10b1859034017e0294961daa8f48dd2
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/memcached/memcached/pull/1077
----
- logger.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/logger.c b/logger.c
-index 667f3c7..394adae 100644
---- a/logger.c
-+++ b/logger.c
-@@ -269,7 +269,7 @@ static int _logger_parse_extw(logentry *e, char *scratch) {
- 
- static int _logger_parse_cne(logentry *e, char *scratch) {
-     int total;
--    unsigned short rport;
-+    unsigned short rport = 0;
-     char rip[64];
-     struct logentry_conn_event *le = (struct logentry_conn_event *) e->data;
-     const char * const transport_map[] = { "local", "tcp", "udp" };
-@@ -286,7 +286,7 @@ static int _logger_parse_cne(logentry *e, char *scratch) {
- 
- static int _logger_parse_cce(logentry *e, char *scratch) {
-     int total;
--    unsigned short rport;
-+    unsigned short rport = 0;
-     char rip[64];
-     struct logentry_conn_event *le = (struct logentry_conn_event *) e->data;
-     const char * const transport_map[] = { "local", "tcp", "udp" };
--- 
-2.33.0
-
diff --git a/package/memcached/0002-fix-build-on-uclibc-ng.patch b/package/memcached/0002-fix-build-on-uclibc-ng.patch
deleted file mode 100644
index a5af7a2adb..0000000000
--- a/package/memcached/0002-fix-build-on-uclibc-ng.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From c84e5e55e0e9e793849f721d30979242ed6a6ee3 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 1 Oct 2023 14:12:38 +0200
-Subject: [PATCH] fix build on uclibc-ng
-
-Fix the following build failure with uclibc-ng raised since version
-1.6.18 and
-https://github.com/memcached/memcached/commit/875371a75cbf1f92350de2d1fa0fae4a35ed572b:
-
-/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: memcached-thread.o: in function `thread_setname':
-thread.c:(.text+0xea2): undefined reference to `pthread_setname_np'
-
-Fixes:
- - http://autobuild.buildroot.org/results/e856d381f5ec7d2727f21c8bd46dacb456984416
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: unsent yet (waiting feedback on first patch)
----
- configure.ac | 1 +
- extstore.c   | 2 +-
- thread.c     | 2 +-
- 3 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index d94f6fb..5ec5088 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -686,6 +686,7 @@ AC_CHECK_FUNCS(clock_gettime)
- AC_CHECK_FUNCS(preadv)
- AC_CHECK_FUNCS(pread)
- AC_CHECK_FUNCS(eventfd)
-+AC_CHECK_FUNCS([pthread_setname_np],[AC_DEFINE(HAVE_PTHREAD_SETNAME_NP, 1, [Define to 1 if support pthread_setname_np])])
- AC_CHECK_FUNCS([accept4], [AC_DEFINE(HAVE_ACCEPT4, 1, [Define to 1 if support accept4])])
- AC_CHECK_FUNCS([getopt_long], [AC_DEFINE(HAVE_GETOPT_LONG, 1, [Define to 1 if support getopt_long])])
- 
-diff --git a/extstore.c b/extstore.c
-index b079465..f6a6180 100644
---- a/extstore.c
-+++ b/extstore.c
-@@ -119,7 +119,7 @@ struct store_engine {
- #define THR_NAME_MAXLEN 16
- static void thread_setname(pthread_t thread, const char *name) {
- assert(strlen(name) < THR_NAME_MAXLEN);
--#if defined(__linux__)
-+#if defined(__linux__) && defined(HAVE_PTHREAD_SETNAME_NP)
- pthread_setname_np(thread, name);
- #endif
- }
-diff --git a/thread.c b/thread.c
-index ee120fa..76651c2 100644
---- a/thread.c
-+++ b/thread.c
-@@ -635,7 +635,7 @@ static void thread_libevent_process(evutil_socket_t fd, short which, void *arg)
- #define THR_NAME_MAXLEN 16
- void thread_setname(pthread_t thread, const char *name) {
- assert(strlen(name) < THR_NAME_MAXLEN);
--#if defined(__linux__)
-+#if defined(__linux__) && defined(HAVE_PTHREAD_SETNAME_NP)
- pthread_setname_np(thread, name);
- #endif
- }
--- 
-2.40.1
-
diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index bd2072df0b..781897b6b7 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,6 +1,6 @@
-# From http://www.memcached.org/files/memcached-1.6.22.tar.gz.sha1
-sha1  7a691f390d59616dbebfc9e2e4942d499c39a338  memcached-1.6.22.tar.gz
+# From http://www.memcached.org/files/memcached-1.6.29.tar.gz.sha1
+sha1  a9699aed111d86b6e37b3ce5e6ef4e7539582d5f  memcached-1.6.29.tar.gz
 
 # Locally computed
-sha256  34783a90a4ccf74c4107085fd92b688749d23b276cfdad9f04e4f725a05d1ca7  memcached-1.6.22.tar.gz
+sha256  269643d518b7ba2033c7a1f66fdfc560d72725a2822194d90c8235408c443a49  memcached-1.6.29.tar.gz
 sha256  bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 05ae69eb32..a01d5aa9d6 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.6.22
+MEMCACHED_VERSION = 1.6.29
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
@@ -13,8 +13,6 @@ MEMCACHED_LICENSE = BSD-3-Clause
 MEMCACHED_LICENSE_FILES = COPYING
 MEMCACHED_CPE_ID_VENDOR = memcached
 MEMCACHED_SELINUX_MODULES = memcached
-# We're patching configure.ac
-MEMCACHED_AUTORECONF = YES
 
 ifeq ($(BR2_ENDIAN),"BIG")
 MEMCACHED_CONF_ENV += ac_cv_c_endian=big
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
