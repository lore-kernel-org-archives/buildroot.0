From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 17 Oct 2019 19:20:48 +0200
Subject: [Buildroot] [PATCH 1/1] Revert "package/meson: bump to version
 0.52.0"
Message-ID: <20191017172048.12806-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 4c27fee9f7034bee542cb8d192632e6eb13d6c37.

Latest version of meson needs python with lzma support enabled, see
https://github.com/mesonbuild/meson/issues/6012.

From my understanding, there is no way to enforce it currently so revert
this bump until an acceptable solution is found as this bump is
literally blowing up autobuilders: host-libglib2, libmpdclient,
jsoncpp ... do not build anymore

Fixes:
 - http://autobuild.buildroot.org/results/733482c353aea10987b0c81970212974d405ad65

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 26b1fc9bb2..cfe859d2ee 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.52.0/meson-0.52.0.tar.gz.asc
-sha256 d60f75f0dedcc4fd249dbc7519d6f3ce6df490033d276ef1cf27453ef4938d32 meson-0.52.0.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.51.2/meson-0.51.2.tar.gz.asc
+sha256 23688f0fc90be623d98e80e1defeea92bbb7103bf9336a5f5b9865d36e892d76 meson-0.51.2.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 29a192c569..a664c55f55 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.52.0
+MESON_VERSION = 0.51.2
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.23.0
