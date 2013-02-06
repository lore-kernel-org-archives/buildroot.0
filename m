From: victor.hiairrassary.ml at gmail.com <victor.hiairrassary.ml@gmail.com>
Date: Wed,  6 Feb 2013 10:30:04 +0100
Subject: [Buildroot] [PATCH] boost: bump version to 1.53.0
In-Reply-To: <1360143004-29603-1-git-send-email-victor.hiairrassary.ml@gmail.com>
References: <1360143004-29603-1-git-send-email-victor.hiairrassary.ml@gmail.com>
Message-ID: <1360143004-29603-2-git-send-email-victor.hiairrassary.ml@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Victor Hiairrassary <victor.hiairrassary.ml@gmail.com>


Signed-off-by: Victor Hiairrassary <victor.hiairrassary.ml@gmail.com>
---
 package/boost/Config.in | 3 +++
 package/boost/boost.mk  | 5 +++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 19dcc60..e36e7d3 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -21,6 +21,9 @@ if BR2_PACKAGE_BOOST
 config BR2_PACKAGE_BOOST_CHRONO
 	bool "boost-chrono"
 
+config BR2_PACKAGE_BOOST_CONTEXT
+	bool "boost-context"
+
 config BR2_PACKAGE_BOOST_DATE_TIME
 	bool "boost-date_time"
 
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 5e1bb4e..a056662 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BOOST_VERSION = 1.52.0
+BOOST_VERSION = 1.53.0
 BOOST_FILE_VERSION = $(subst .,_,$(BOOST_VERSION))
 BOOST_SOURCE = boost_$(BOOST_FILE_VERSION).tar.bz2
 BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)
@@ -15,9 +15,10 @@ TARGET_CC_VERSION = $(shell $(TARGET_CC) -dumpversion)
 BOOST_DEPENDENCIES = bzip2 zlib
 
 BOOST_FLAGS =
-BOOST_WITHOUT_FLAGS = python context
+BOOST_WITHOUT_FLAGS = python atomic
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,context)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_DATE_TIME),,date_time)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_EXCEPTION),,exception)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FILESYSTEM),,filesystem)
-- 
1.8.1.2
