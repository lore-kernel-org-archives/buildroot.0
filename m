From: Adam Duskett <aduskett@gmail.com>
Date: Fri,  3 Feb 2017 15:29:53 -0500
Subject: [Buildroot] [PATCH 05/11] libevent: bump to version 2.1.8
In-Reply-To: <20170203202959.18916-1-aduskett@codeblue.com>
References: <20170203202959.18916-1-aduskett@codeblue.com>
Message-ID: <20170203202959.18916-5-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I also modified the Disable-building-test-programs.patch to work
with the newer Makefile.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/libevent/0001-Disable-building-test-programs.patch | 11 +++++------
 package/libevent/libevent.hash                             |  6 +++---
 package/libevent/libevent.mk                               |  2 +-
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/libevent/0001-Disable-building-test-programs.patch b/package/libevent/0001-Disable-building-test-programs.patch
index eb1acfd..80901de 100644
--- a/package/libevent/0001-Disable-building-test-programs.patch
+++ b/package/libevent/0001-Disable-building-test-programs.patch
@@ -16,12 +16,11 @@ diff --git a/Makefile.am b/Makefile.am
 index 42879a3..dc90359 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -126,7 +126,7 @@ else
- noinst_LTLIBRARIES =  $(LIBEVENT_LIBS_LA)
- endif
- 
--SUBDIRS = . include sample test
-+SUBDIRS = . include sample
+@@ -144,7 +144,6 @@
+ BUILT_SOURCES =
+ include include/include.am
+ include sample/include.am
+-include test/include.am
  
  if BUILD_WIN32
  
diff --git a/package/libevent/libevent.hash b/package/libevent/libevent.hash
index 633cf5b..21381c8 100644
--- a/package/libevent/libevent.hash
+++ b/package/libevent/libevent.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/levent/files/libevent/libevent-2.0/
-md5	c4c56f986aa985677ca1db89630a2e11	libevent-2.0.22-stable.tar.gz
-sha1	a586882bc93a208318c70fc7077ed8fca9862864	libevent-2.0.22-stable.tar.gz
+# locally computed
+md5	f3eeaed018542963b7d2416ef1135ecc	libevent-2.1.8-stable.tar.gz
+sha1	2a1b8bb7a262d3fd0ed6a080a20991a6eed675ec	libevent-2.1.8-stable.tar.gz
diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 820beea..0a5417f 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVENT_VERSION = 2.0.22-stable
+LIBEVENT_VERSION = 2.1.8-stable
 LIBEVENT_SITE = https://github.com/libevent/libevent/releases/download/release-$(LIBEVENT_VERSION)
 LIBEVENT_INSTALL_STAGING = YES
 LIBEVENT_LICENSE = BSD-3c, OpenBSD
-- 
2.9.3
