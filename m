From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  7 Sep 2018 16:00:30 +0300
Subject: [Buildroot] [PATCH v2 1/1] rtorrent: bump to version 0.9.7
Message-ID: <20180907130030.4730-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for COPYING, and adjust the patch to the new version.

Fixes:
http://autobuild.buildroot.net/results/4017ad58eef26609b6f2141c92a16946a35aa92c
http://autobuild.buildroot.net/results/3f162f5f6d20a523cc931e5491b6fe4fb0a528b0

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

---

v1->v2: add autobuild issues being fixed by this commmit.
---
 package/rtorrent/0001-cross_compile.patch | 17 +++--------------
 package/rtorrent/rtorrent.hash            |  3 ++-
 package/rtorrent/rtorrent.mk              |  2 +-
 3 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/package/rtorrent/0001-cross_compile.patch b/package/rtorrent/0001-cross_compile.patch
index a8ad696e6d..a57131b1ff 100644
--- a/package/rtorrent/0001-cross_compile.patch
+++ b/package/rtorrent/0001-cross_compile.patch
@@ -4,27 +4,16 @@ Date: Mon, 5 Oct 2015 00:52:26 +0100
 Subject: [PATCH] Fix cross compilation, based on OpenWRT patch.
 
 [Vincent: tweak the patch for version 0.9.6]
+[Asaf: adjust for version 0.9.7]
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
 ---
- configure.ac      |    1 -
  scripts/checks.m4 |    2 +-
  scripts/common.m4 |    4 ++--
- 3 files changed, 3 insertions(+), 4 deletions(-)
+ 2 files changed, 3 insertions(+), 3 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index ba5bbf2..0821d4e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4,7 +4,6 @@ AC_DEFINE(API_VERSION, 9, api version)
- 
- AM_INIT_AUTOMAKE
- AC_CONFIG_HEADERS(config.h)
--AM_PATH_CPPUNIT(1.9.6)
- 
- AC_PROG_CXX
- AC_PROG_LIBTOOL
 diff --git a/scripts/checks.m4 b/scripts/checks.m4
 index 598f39b..0e5abe0 100644
 --- a/scripts/checks.m4
diff --git a/package/rtorrent/rtorrent.hash b/package/rtorrent/rtorrent.hash
index 15257acf43..9f5ef2b4fc 100644
--- a/package/rtorrent/rtorrent.hash
+++ b/package/rtorrent/rtorrent.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 1e69c24f1f26f8f07d58d673480dc392bfc4317818c1115265b08a7813ff5b0e  rtorrent-0.9.6.tar.gz
+sha256 5d9842fe48c9582fbea2c7bf9f51412c1ccbba07d059b257039ad53b863fe8bb  rtorrent-0.9.7.tar.gz
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/rtorrent/rtorrent.mk b/package/rtorrent/rtorrent.mk
index 51dc9eecc9..aaf86be647 100644
--- a/package/rtorrent/rtorrent.mk
+++ b/package/rtorrent/rtorrent.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTORRENT_VERSION = 0.9.6
+RTORRENT_VERSION = 0.9.7
 RTORRENT_SITE = http://rtorrent.net/downloads
 RTORRENT_DEPENDENCIES = host-pkgconf libcurl libtorrent ncurses
 RTORRENT_AUTORECONF = YES
-- 
2.17.1
