From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 May 2018 22:51:26 +0200
Subject: [Buildroot] [git commit] meson: bump version to 0.46.0
Message-ID: <20180501205141.C44748B38E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dacf48e9b198b9645cf9c8c5a80ba3d99ae65a3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump version and drop obsolete patch.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...NotFoundError-when-restorecon-unavailable.patch | 31 ----------------------
 package/meson/meson.hash                           |  4 +--
 package/meson/meson.mk                             |  2 +-
 3 files changed, 3 insertions(+), 34 deletions(-)

diff --git a/package/meson/0001-Fix-FileNotFoundError-when-restorecon-unavailable.patch b/package/meson/0001-Fix-FileNotFoundError-when-restorecon-unavailable.patch
deleted file mode 100644
index 3f1ca68dfc..0000000000
--- a/package/meson/0001-Fix-FileNotFoundError-when-restorecon-unavailable.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 8edc477b7d7b160004eb700a1b7523237333d9ec Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 13 Mar 2018 18:52:36 +0100
-Subject: [PATCH] Fix FileNotFoundError when restorecon unavailable
-
-Fixes:
- - http://autobuild.buildroot.net/results/d5dcdfdfab3503fdc387f99e68267972a38c417d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- mesonbuild/scripts/meson_install.py | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/mesonbuild/scripts/meson_install.py b/mesonbuild/scripts/meson_install.py
-index f895f17d..1414ace2 100644
---- a/mesonbuild/scripts/meson_install.py
-+++ b/mesonbuild/scripts/meson_install.py
-@@ -97,6 +97,10 @@ def restore_selinux_contexts():
-         # is ignored quietly.
-         return
- 
-+    if not shutil.which('restorecon'):
-+        # If we don't have restorecon, failure is ignored quietly.
-+        return
-+
-     with subprocess.Popen(['restorecon', '-F', '-f-', '-0'],
-                           stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE) as proc:
-         out, err = proc.communicate(input=b'\0'.join(os.fsencode(f) for f in selinux_updates) + b'\0')
--- 
-2.14.1
-
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index c460302f00..44785aef29 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.45.0/meson-0.45.0.tar.gz.asc
-sha256	3455abbc30a3fbd9cc8abb6d5fcdc42ce618665b95ac2c3ad7792a4a6ba47ce4	meson-0.45.0.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.46.0/meson-0.46.0.tar.gz.asc
+sha256 b7df91b01a358a8facdbfa33596a47cda38a760435ab55e1985c0bff06a9cbf0  meson-0.46.0.tar.gz
 sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30	COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 2e0db90236..9b5ca0d5b9 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.45.0
+MESON_VERSION = 0.46.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
