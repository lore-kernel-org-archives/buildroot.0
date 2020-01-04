From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  4 Jan 2020 19:45:13 +0100
Subject: [Buildroot] [PATCH 2/2] package/bustle: bump to version 0.7.5
In-Reply-To: <20200104184513.2369600-1-fontaine.fabrice@gmail.com>
References: <20200104184513.2369600-1-fontaine.fabrice@gmail.com>
Message-ID: <20200104184513.2369600-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Switch homepage to https://gitlab.freedesktop.org/bustle/bustle/
- Switch site to
  https://www.freedesktop.org/software/bustle/$(BUSTLE_VERSION)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bustle/Config.in   | 2 +-
 package/bustle/bustle.hash | 3 ++-
 package/bustle/bustle.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/bustle/Config.in b/package/bustle/Config.in
index b3d321e14b..563b65f2c3 100644
--- a/package/bustle/Config.in
+++ b/package/bustle/Config.in
@@ -18,7 +18,7 @@ config BR2_PACKAGE_BUSTLE
 	  This only installs the command line bustle-pcap tool, not
 	  the graphical viewer.
 
-	  http://www.willthompson.co.uk/bustle/
+	  https://gitlab.freedesktop.org/bustle/bustle/
 
 comment "bustle needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
diff --git a/package/bustle/bustle.hash b/package/bustle/bustle.hash
index 49890f74ff..05281c4f11 100644
--- a/package/bustle/bustle.hash
+++ b/package/bustle/bustle.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 921c2cbbb957dcb02c3aa8fd1eeff3534cb437fa9eeca1c25206ad1e741a3f14  bustle-0.5.4.tar.gz
+sha256 7760a695b25cb264e7342f353dcdc6d2b7faeacdcd85dd14e03c61b18e791664  bustle-0.7.5.tar.gz
+sha256 a6d6109e5b086de8e852e451b91b08b323302f55b6975d506c64c43bb094be38  LICENSE
diff --git a/package/bustle/bustle.mk b/package/bustle/bustle.mk
index ffbfbe40f7..675ffb0529 100644
--- a/package/bustle/bustle.mk
+++ b/package/bustle/bustle.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BUSTLE_VERSION = 0.5.4
-BUSTLE_SITE = http://www.willthompson.co.uk/bustle/releases/$(BUSTLE_VERSION)
+BUSTLE_VERSION = 0.7.5
+BUSTLE_SITE = https://www.freedesktop.org/software/bustle/$(BUSTLE_VERSION)
 BUSTLE_LICENSE = LGPL-2.1+
 BUSTLE_LICENSE_FILES = LICENSE
 BUSTLE_DEPENDENCIES = libglib2 libpcap host-pkgconf
-- 
2.24.0
