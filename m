From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 14 Oct 2012 08:08:25 +0200
Subject: [Buildroot] [PATCH] poco: bump to version 1.4.4
Message-ID: <b432cd22c94ee070400e78a576c8328513dd5a25.1350194864.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...ross-build-config.patch => poco-add-cross-build-config.patch} |    0
 ...ging-search-path.patch => poco-add-staging-search-path.patch} |    6 +++---
 ...t-build-debug-libs.patch => poco-dont-build-debug-libs.patch} |    0
 package/poco/poco.mk                                             |    4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename package/poco/{poco-1.4.2p1-add-cross-build-config.patch => poco-add-cross-build-config.patch} (100%)
 rename package/poco/{poco-1.4.2p1-add-staging-search-path.patch => poco-add-staging-search-path.patch} (68%)
 rename package/poco/{poco-1.4.2p1-dont-build-debug-libs.patch => poco-dont-build-debug-libs.patch} (100%)

diff --git a/package/poco/poco-1.4.2p1-add-cross-build-config.patch b/package/poco/poco-add-cross-build-config.patch
similarity index 100%
rename from package/poco/poco-1.4.2p1-add-cross-build-config.patch
rename to package/poco/poco-add-cross-build-config.patch
diff --git a/package/poco/poco-1.4.2p1-add-staging-search-path.patch b/package/poco/poco-add-staging-search-path.patch
similarity index 68%
rename from package/poco/poco-1.4.2p1-add-staging-search-path.patch
rename to package/poco/poco-add-staging-search-path.patch
index 638ee2a..a9397b4 100644
--- a/package/poco/poco-1.4.2p1-add-staging-search-path.patch
+++ b/package/poco/poco-add-staging-search-path.patch
@@ -8,13 +8,13 @@ must be set from the make command line.
 [Peter: Remove host dirs, add MYSQL_INCDIR]
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 --- 
---- poco-1.4.1p1-all-dist/Data/MySQL/Makefile	2011-02-09 11:13:00.000000000 +0200
-+++ poco-1.4.1p1-all/Data/MySQL/Makefile	2011-08-07 09:03:37.106161274 +0300
+--- poco-1.4.4-all-dist/Data/MySQL/Makefile	2012-09-20 01:30:42.000000000 +0300
++++ poco-1.4.4-all/Data/MySQL/Makefile	2012-10-11 14:36:10.343153420 +0200
 @@ -8,8 +8,8 @@
  
  include $(POCO_BASE)/build/rules/global
  
--SYSLIBS += -L/usr/local/lib/mysql -L/usr/lib/mysql -L/usr/mysql/lib/mysql -L/usr/local/mysql/lib -lmysqlclient
+-SYSLIBS += -L/usr/local/lib$(LIB64SUFFIX)/mysql -L/usr/lib$(LIB64SUFFIX)/mysql -L/usr/mysql/lib$(LIB64SUFFIX)/mysql -L/usr/local/mysql/lib$(LIB64SUFFIX) -lmysqlclient
 -INCLUDE += -I/usr/local/include/mysql/ -I/usr/include/mysql -I/usr/mysql/include/mysql -I/usr/local/mysql/include
 +SYSLIBS += -L$(MYSQL_LIBDIR) -lmysqlclient
 +INCLUDE += -I$(MYSQL_INCDIR)
diff --git a/package/poco/poco-1.4.2p1-dont-build-debug-libs.patch b/package/poco/poco-dont-build-debug-libs.patch
similarity index 100%
rename from package/poco/poco-1.4.2p1-dont-build-debug-libs.patch
rename to package/poco/poco-dont-build-debug-libs.patch
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index eaa93e6..942b9b2 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -3,8 +3,8 @@
 # poco
 #
 #############################################################
-POCO_VERSION_MAJOR = 1.4.3
-POCO_VERSION = $(POCO_VERSION_MAJOR)p1
+POCO_VERSION_MAJOR = 1.4.4
+POCO_VERSION = $(POCO_VERSION_MAJOR)
 POCO_SOURCE = poco-$(POCO_VERSION)-all.tar.gz
 POCO_SITE = http://downloads.sourceforge.net/project/poco/sources/poco-$(POCO_VERSION_MAJOR)
 POCO_LICENSE = Boost-v1.0
-- 
1.7.10.4
