From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Jun 2017 16:01:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/iprutils: needs zlib
Message-ID: <20170610140106.28730-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dependency was introduced by
https://sourceforge.net/p/iprdd/iprutils/ci/1f24b814e56939fd09a2319323e604594784fef3/

Fixes
http://autobuild.buildroot.net/results/48e/48e1c7fb920cbc81eee1cf2f43d1551a0a9ce31e/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/iprutils/Config.in   | 1 +
 package/iprutils/iprutils.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/iprutils/Config.in b/package/iprutils/Config.in
index 8e2884a82..0143b53ae 100644
--- a/package/iprutils/Config.in
+++ b/package/iprutils/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_IPRUTILS
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBSYSFS
 	select BR2_PACKAGE_PCIUTILS
+	select BR2_PACKAGE_ZLIB
 	help
 	  System utilities for IBM Power RAID devices
 
diff --git a/package/iprutils/iprutils.mk b/package/iprutils/iprutils.mk
index 8bb80c885..0dc7b4006 100644
--- a/package/iprutils/iprutils.mk
+++ b/package/iprutils/iprutils.mk
@@ -7,7 +7,7 @@
 IPRUTILS_VERSION_MAJOR = 2.4.14
 IPRUTILS_VERSION = $(IPRUTILS_VERSION_MAJOR).1
 IPRUTILS_SITE = https://downloads.sourceforge.net/project/iprdd/iprutils%20for%202.6%20kernels/$(IPRUTILS_VERSION_MAJOR)
-IPRUTILS_DEPENDENCIES = ncurses libsysfs pciutils
+IPRUTILS_DEPENDENCIES = ncurses libsysfs pciutils zlib
 IPRUTILS_LICENSE = Common Public License Version 1.0
 IPRUTILS_LICENSE_FILES = LICENSE
 
-- 
2.11.0
