From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 23:30:18 +0200
Subject: [Buildroot] [git commit] package/cog: bump to version 0.4.0
Message-ID: <20190928212515.8B741826E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f91b7d1a50502f6ceb412004635468a70820d6bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a new major release, to be used along with WPE WebKit 2.26.0
as per the compatibility matrix:

  https://wpewebkit.org/release/schedule/#compatible-components

The release includes experimental support for DRM/KMS output, which is
explicitly disabled at the moment. The complete release notes are
available at:

  https://wpewebkit.org/release/cog-0.4.0.html

Starting with the 0.4.x series, Cog is available directly from the
main WPE WebKit site, and this COG_SITE is changd accordingly.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cog/cog.hash | 8 ++++----
 package/cog/cog.mk   | 5 +++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index 18b53e4ee4..2e37928fc6 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://github.com/Igalia/cog/releases/tag/v0.3.1
-md5 65bb078aad576b8402f973234e86cc82 cog-0.3.1.tar.xz
-sha1 d73b060618f342accb12db71a7578940c2243d4c cog-0.3.1.tar.xz
-sha256 ca7eae333cc02b947ec3d657a2090f01a9b08f9fabb855a585472edafbd9e7eb cog-0.3.1.tar.xz
+# From https://wpewebkit.org/releases/cog-0.4.0.tar.xz.sums
+md5 75a0838ee6c81bb8df1b254f525440a6 cog-0.4.0.tar.xz
+sha1 284d2a641e6269b296057918602c8c94eb831527 cog-0.4.0.tar.xz
+sha256 e9c13a51232434b7340a419b1e6f59c40c582cd80c8e60bd9ec7de16c904fc03 cog-0.4.0.tar.xz
 
 # Hashes for license files:
 sha256 e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 615d6664df..d0e5b79c38 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-COG_VERSION = 0.3.1
-COG_SITE = https://github.com/Igalia/cog/releases/download/v$(COG_VERSION)
+COG_VERSION = 0.4.0
+COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
 COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo
@@ -14,6 +14,7 @@ COG_LICENSE_FILES = COPYING
 COG_CONF_OPTS = \
 	-DCOG_BUILD_PROGRAMS=ON \
 	-DCOG_PLATFORM_FDO=ON \
+	-DCOG_PLATFORM_DRM=OFF \
 	-DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))'
 
 $(eval $(cmake-package))
