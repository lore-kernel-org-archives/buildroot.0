From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Aug 2019 23:40:41 +0200
Subject: [Buildroot] [git commit] package/ofono: bump to version 1.30
Message-ID: <20190903133623.2DF218A5E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a465dd54fc22423b4140441d8f29d55e249d5848
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed included in 1.30, refresh patch.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ofono/0001-uclibc-backtrace.patch          |  4 ++--
 ...uild-Add-check-for-explicit_bzero-support.patch | 28 ----------------------
 package/ofono/ofono.hash                           |  2 +-
 package/ofono/ofono.mk                             |  2 +-
 4 files changed, 4 insertions(+), 32 deletions(-)

diff --git a/package/ofono/0001-uclibc-backtrace.patch b/package/ofono/0001-uclibc-backtrace.patch
index 3ce7bf8cbc..3fa2414978 100644
--- a/package/ofono/0001-uclibc-backtrace.patch
+++ b/package/ofono/0001-uclibc-backtrace.patch
@@ -29,7 +29,7 @@ Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
  static void print_backtrace(unsigned int offset)
  {
  	void *frames[99];
-@@ -309,7 +310,7 @@
+@@ -312,7 +313,7 @@
 	if (detach == FALSE)
 		option |= LOG_PERROR;
  
@@ -38,7 +38,7 @@ Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 	signal_setup(signal_handler);
  #endif
 
-@@ -326,7 +327,7 @@
+@@ -329,7 +330,7 @@
 
 	closelog();
 
diff --git a/package/ofono/0003-build-Add-check-for-explicit_bzero-support.patch b/package/ofono/0003-build-Add-check-for-explicit_bzero-support.patch
deleted file mode 100644
index b2507df3ff..0000000000
--- a/package/ofono/0003-build-Add-check-for-explicit_bzero-support.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From dff595671bf5a46f7c9231966a6cd7d2a0183076 Mon Sep 17 00:00:00 2001
-From: Marcel Holtmann <marcel@holtmann.org>
-Date: Wed, 15 May 2019 09:39:44 +0200
-Subject: [PATCH] build: Add check for explicit_bzero support
-
-Upstream: dff595671bf5a46f7c9231966a6cd7d2a0183076
-
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
----
- configure.ac | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index bacb7ac5..cad35c5d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -54,6 +54,8 @@ AC_ARG_ENABLE(pie, AC_HELP_STRING([--enable-pie],
- 	fi
- ])
- 
-+AC_CHECK_FUNCS(explicit_bzero)
-+
- AC_CHECK_FUNC(signalfd, dummy=yes,
- 			AC_MSG_ERROR(signalfd support is required))
- 
--- 
-2.21.0
-
diff --git a/package/ofono/ofono.hash b/package/ofono/ofono.hash
index 5204bb4fca..e8e972af21 100644
--- a/package/ofono/ofono.hash
+++ b/package/ofono/ofono.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/ofono/sha256sums.asc
-sha256 67f0f8e5740dea5b46309e40667d1e560be39c90ef08dd01ff9e9ce8e61f0679  ofono-1.29.tar.xz
+sha256 8079735efc5d7f33be9e792e791f2f7ff75c31ce67d477b994673e32319eec5c  ofono-1.30.tar.xz
 # Locally computed
 sha256 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4	COPYING
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 176d23ae05..ce05dfcadf 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OFONO_VERSION = 1.29
+OFONO_VERSION = 1.30
 OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_LICENSE = GPL-2.0
