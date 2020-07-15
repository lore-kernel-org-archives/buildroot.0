From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 17:28:04 +0200
Subject: [Buildroot] [git commit] package/gvfs: add optional libfuse3
 dependency
Message-ID: <20200715152458.9A4A68700D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4045dcba804c5551fffac8eb16ee2aed86174f41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libfuse3 is an optional dependency since version 1.41.1 and
https://github.com/GNOME/gvfs/commit/7a0a06186b6fef07b8fce2360c04fd075fc84ed1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gvfs/gvfs.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 92a01ef2f6..c5104e8dbf 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -25,7 +25,6 @@ GVFS_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 # Most of these are missing library support
 GVFS_CONF_OPTS = \
 	-Dafc=false \
-	-Dfuse=false \
 	-Dgoa=false \
 	-Dgoogle=false \
 	-Dmtp=false \
@@ -85,6 +84,13 @@ else
 GVFS_CONF_OPTS += -Dcdda=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIBFUSE3),y)
+GVFS_DEPENDENCIES += libfuse3
+GVFS_CONF_OPTS += -Dfuse=true
+else
+GVFS_CONF_OPTS += -Dfuse=false
+endif
+
 # AFP support is anon-only without libgcrypt which isn't very useful
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 GVFS_CONF_OPTS += \
