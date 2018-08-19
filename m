From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Aug 2018 12:47:16 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libtorrent: bump version to
 0.13.7
Message-ID: <20180819104716.4306-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libtorrent/0001-cross_compile.patch | 14 ++------------
 package/libtorrent/libtorrent.hash          |  3 ++-
 package/libtorrent/libtorrent.mk            |  2 +-
 3 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/package/libtorrent/0001-cross_compile.patch b/package/libtorrent/0001-cross_compile.patch
index abb243820c..9febfa7f3c 100644
--- a/package/libtorrent/0001-cross_compile.patch
+++ b/package/libtorrent/0001-cross_compile.patch
@@ -4,27 +4,17 @@ Date: Mon, 5 Oct 2015 00:40:25 +0100
 Subject: [PATCH] Fix cross compilation, based on OpenWRT patch.
 
 [Vincent: tweak the patch for version 0.13.6]
+[Bernd: tweak the patch for version 0.13.7]
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  configure.ac      |    1 -
  scripts/checks.m4 |    2 +-
  scripts/common.m4 |    4 ++--
  3 files changed, 3 insertions(+), 4 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index ba994ee..7696466 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -19,7 +19,6 @@ AC_SUBST(LIBTORRENT_INTERFACE_VERSION_NO)
- 
- AM_INIT_AUTOMAKE
- AC_CONFIG_HEADERS(config.h)
--AM_PATH_CPPUNIT(1.9.6)
- 
- AC_PROG_CXX
- 
 diff --git a/scripts/checks.m4 b/scripts/checks.m4
 index 598f39b..0e5abe0 100644
 --- a/scripts/checks.m4
diff --git a/package/libtorrent/libtorrent.hash b/package/libtorrent/libtorrent.hash
index 73753e94ce..8e0bc1caa4 100644
--- a/package/libtorrent/libtorrent.hash
+++ b/package/libtorrent/libtorrent.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 2838a08c96edfd936aff8fbf99ecbb930c2bfca3337dd1482eb5fccdb80d5a04  libtorrent-0.13.6.tar.gz
+sha256 c738f60f4d7b6879cd2745fb4310bf24c9287219c1fd619706a9d5499ca7ecc1  libtorrent-0.13.7.tar.gz
+sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/libtorrent/libtorrent.mk b/package/libtorrent/libtorrent.mk
index fbd332e379..8d74addaf7 100644
--- a/package/libtorrent/libtorrent.mk
+++ b/package/libtorrent/libtorrent.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTORRENT_VERSION = 0.13.6
+LIBTORRENT_VERSION = 0.13.7
 LIBTORRENT_SITE = http://rtorrent.net/downloads
 LIBTORRENT_DEPENDENCIES = host-pkgconf zlib \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl)
-- 
2.18.0
