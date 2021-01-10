From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jan 2021 11:53:46 +0100
Subject: [Buildroot] [git commit] package/multipath-tools: fix license
Message-ID: <20210110103605.45370868FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc7b7f73c481f348215b0576148703a1c9f9a33f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As stated in README.md, multipath-tools is covered by several licenses
and LGPL-2.0 is "just" the default license:
 - GPL-2.0+ (e.g. libmultipath/alias.c)
 - GPL-3.0+ (e.g. libdmmp/libdmmp.c)
 - LGPL-2.1+ (e.g. libmpathcmd/mpath_cmd.c)

So replace COPYING (which is a symlink to LICENSES/LGPL-2.0) by the
approriate license files in LICENSES directory

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: further split long lines]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/multipath-tools/multipath-tools.hash |  6 +++++-
 package/multipath-tools/multipath-tools.mk   | 15 +++++++++++++--
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
index b6ce6164b6..fc94b3f724 100644
--- a/package/multipath-tools/multipath-tools.hash
+++ b/package/multipath-tools/multipath-tools.hash
@@ -1,3 +1,7 @@
 # Locally computed:
 sha256  0549ebe39fd3950ec49c16304da408c2bfe1b18d386d8e6647b5bcb60363c8aa  multipath-tools-0.8.5.tar.gz
-sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
+sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1
+sha256  afa9db94ff46f8d011251273f547ba958da6a0150a2b797b10fa8c8cfa74bbda  README.md
diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
index 7fe9033a15..877ed672c5 100644
--- a/package/multipath-tools/multipath-tools.mk
+++ b/package/multipath-tools/multipath-tools.mk
@@ -6,8 +6,19 @@
 
 MULTIPATH_TOOLS_VERSION = 0.8.5
 MULTIPATH_TOOLS_SITE = $(call github,opensvc,multipath-tools,$(MULTIPATH_TOOLS_VERSION))
-MULTIPATH_TOOLS_LICENSE = LGPL-2.0
-MULTIPATH_TOOLS_LICENSE_FILES = COPYING
+
+MULTIPATH_TOOLS_LICENSE = \
+	LGPL-2.0 (default), \
+	LGPL-2.1+ (libmpathcmd), \
+	GPL-2.0+ (libmultipath), \
+	GPL-3.0+ (libdmmp)
+MULTIPATH_TOOLS_LICENSE_FILES = \
+	LICENSES/GPL-2.0 \
+	LICENSES/GPL-3.0 \
+	LICENSES/LGPL-2.0 \
+	LICENSES/LGPL-2.1 \
+	README.md
+
 MULTIPATH_TOOLS_DEPENDENCIES = lvm2 json-c readline udev liburcu libaio host-pkgconf
 MULTIPATH_TOOLS_MAKE_OPTS = \
 	LIB="lib" \
