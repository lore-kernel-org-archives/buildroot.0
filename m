From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 14 Apr 2020 10:25:25 -0500
Subject: [Buildroot] [PATCH v3 5/8] package/restorecond: bump version to 3.0
In-Reply-To: <20200414152528.20758-1-matthew.weber@rockwellcollins.com>
References: <20200414152528.20758-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200414152528.20758-6-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@gmail.com>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
Changes v2 -> v3
 - Matt switched over the versioning to use dates
---
 package/restorecond/restorecond.hash | 9 ++++-----
 package/restorecond/restorecond.mk   | 8 +++++---
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/restorecond/restorecond.hash b/package/restorecond/restorecond.hash
index 7a82bda370..2ac12ed1ef 100644
--- a/package/restorecond/restorecond.hash
+++ b/package/restorecond/restorecond.hash
@@ -1,5 +1,4 @@
-# https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 cbf9820583e641ee0462fa7bc89e6024676af281e025703e17b2d019b1a25a4f restorecond-2.9.tar.gz
-
-# Hash for license file
-sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
+# Generated locally as upstream releases in artifact
+# files under a overall YYYYMMDD dated selinux release
+sha256 4cc134210d8cca6c410b7b8c91993e10c6d5b077102ed27e6976bb6d9e483f0d restorecond-20191204.tar.gz
+sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 restorecond/COPYING
diff --git a/package/restorecond/restorecond.mk b/package/restorecond/restorecond.mk
index c519b5de2b..dcf6bf8af6 100644
--- a/package/restorecond/restorecond.mk
+++ b/package/restorecond/restorecond.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-RESTORECOND_VERSION = 2.9
-RESTORECOND_SITE = https://github.com/SELinuxProject/selinux/releases/download/20190315
+RESTORECOND_VERSION = $(LIBSELINUX_VERSION)
+RESTORECOND_SITE = $(LIBSELINUX_SITE)
 RESTORECOND_LICENSE = GPL-2.0
-RESTORECOND_LICENSE_FILES = COPYING
+RESTORECOND_LICENSE_FILES = $(RESTORECOND_NAME)/COPYING
 
 RESTORECOND_DEPENDENCIES = libglib2 libsepol libselinux dbus-glib
 
+RESTORECOND_SUBDIR = $(@D)/$(RESTORECOND_NAME)
+
 # Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
 # large file support.
 # See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
-- 
2.17.1
