From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 14 Apr 2020 10:25:24 -0500
Subject: [Buildroot] [PATCH v3 4/8] package/policycoreutils: bump version to
 3.0
In-Reply-To: <20200414152528.20758-1-matthew.weber@rockwellcollins.com>
References: <20200414152528.20758-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200414152528.20758-5-matthew.weber@rockwellcollins.com>
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
 ...TDIR-to-all-paths-that-use-an-absolute-path.patch |  6 +++---
 .../0002-Add-PREFIX-to-host-paths.patch              | 12 ++++++------
 package/policycoreutils/policycoreutils.hash         |  7 ++++---
 package/policycoreutils/policycoreutils.mk           |  8 +++++---
 4 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch b/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
index 57833d8176..71bf020e54 100644
--- a/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
+++ b/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
@@ -19,10 +19,10 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
  setfiles/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/setfiles/Makefile b/setfiles/Makefile
+diff --git a/policycoreutils/setfiles/Makefile b/policycoreutils/setfiles/Makefile
 index c08e2dd..36c0638 100644
---- a/setfiles/Makefile
-+++ b/setfiles/Makefile
+--- a/policycoreutils/setfiles/Makefile
++++ b/policycoreutils/setfiles/Makefile
 @@ -3,7 +3,7 @@ PREFIX ?= $(DESTDIR)/usr
  PREFIX ?= /usr
  SBINDIR ?= /sbin
diff --git a/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch b/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch
index ffe5fcbd44..df5b63bd8b 100644
--- a/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch
+++ b/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch
@@ -19,10 +19,10 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
  run_init/Makefile    | 6 +++---
  3 files changed, 7 insertions(+), 7 deletions(-)
 
-diff --git a/newrole/Makefile b/newrole/Makefile
+diff --git a/policycoreutils/newrole/Makefile b/policycoreutils/newrole/Makefile
 index 196af92..896708f 100644
---- a/newrole/Makefile
-+++ b/newrole/Makefile
+--- a/policycoreutils/newrole/Makefile
++++ b/policycoreutils/newrole/Makefile
 @@ -3,9 +3,9 @@ PREFIX ?= $(DESTDIR)/usr
  BINDIR ?= $(PREFIX)/bin
  MANDIR ?= $(PREFIX)/share/man
@@ -35,10 +35,10 @@ index 196af92..896708f 100644
  # Enable capabilities to permit newrole to generate audit records.
  # This will make newrole a setuid root program.
  # The capabilities used are: CAP_AUDIT_WRITE.
-diff --git a/run_init/Makefile b/run_init/Makefile
+diff --git a/policycoreutils/run_init/Makefile b/policycoreutils/run_init/Makefile
 index 921f0b0..e1566fc 100644
---- a/run_init/Makefile
-+++ b/run_init/Makefile
+--- a/policycoreutils/run_init/Makefile
++++ b/policycoreutils/run_init/Makefile
 @@ -4,9 +4,9 @@ PREFIX ?= $(DESTDIR)/usr
  SBINDIR ?= $(PREFIX)/sbin
  MANDIR ?= $(PREFIX)/share/man
diff --git a/package/policycoreutils/policycoreutils.hash b/package/policycoreutils/policycoreutils.hash
index c601c7818b..ee011faba5 100644
--- a/package/policycoreutils/policycoreutils.hash
+++ b/package/policycoreutils/policycoreutils.hash
@@ -1,3 +1,4 @@
-# https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 c53c344f28007b3c0742bd958751e9b5d2385898adeb8aec6281ae57342f0f7b policycoreutils-2.9.tar.gz
-sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
+# Generated locally as upstream releases in artifact
+# files under a overall YYYYMMDD dated selinux release
+sha256 4cc134210d8cca6c410b7b8c91993e10c6d5b077102ed27e6976bb6d9e483f0d policycoreutils-20191204.tar.gz
+sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 policycoreutils/COPYING
diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 6cd5a019c5..029ddd8d1e 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -4,14 +4,16 @@
 #
 ################################################################################
 
-POLICYCOREUTILS_VERSION = 2.9
-POLICYCOREUTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/20190315
+POLICYCOREUTILS_VERSION = $(LIBSELINUX_VERSION)
+POLICYCOREUTILS_SITE = $(LIBSELINUX_SITE)
 POLICYCOREUTILS_LICENSE = GPL-2.0
-POLICYCOREUTILS_LICENSE_FILES = COPYING
+POLICYCOREUTILS_LICENSE_FILES = policycoreutils/COPYING
 
 POLICYCOREUTILS_DEPENDENCIES = libsemanage libcap-ng $(TARGET_NLS_DEPENDENCIES)
 POLICYCOREUTILS_MAKE_OPTS = LDLIBS=$(TARGET_NLS_LIBS)
 
+POLICYCOREUTILS_SUBDIR = $(@D)/$(POLICYCOREUTILS_NAME)
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 POLICYCOREUTILS_DEPENDENCIES += linux-pam
 POLICYCOREUTILS_MAKE_OPTS += NAMESPACE_PRIV=y
-- 
2.17.1
