From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 15:23:31 +0200
Subject: [Buildroot] [git commit] sunxi-mali: bump version
Message-ID: <20150628132436.06D598072B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8906f272ab41e0373f392cc7a04cc97320dd8382
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sunxi-mali/Config.in     |    1 +
 package/sunxi-mali/sunxi-mali.mk |    4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-mali/Config.in b/package/sunxi-mali/Config.in
index 95f91ab..f0c1b35 100644
--- a/package/sunxi-mali/Config.in
+++ b/package/sunxi-mali/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_SUNXI_MALI
 	bool "sunxi-mali"
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_LIBUMP
 	# The egl/gles mali libraries are provided as a git submodule of the
 	# sunxi-mali repo and are downloaded by the sunxi-mali-prop package.
 	select BR2_PACKAGE_SUNXI_MALI_PROP
diff --git a/package/sunxi-mali/sunxi-mali.mk b/package/sunxi-mali/sunxi-mali.mk
index c6900c8..3e5443b 100644
--- a/package/sunxi-mali/sunxi-mali.mk
+++ b/package/sunxi-mali/sunxi-mali.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-SUNXI_MALI_VERSION = c2491fe952354ba44538064e534ed7c731cedb1e
+SUNXI_MALI_VERSION = d343311efc8db166d8371b28494f0f27b6a58724
 SUNXI_MALI_SITE = $(call github,linux-sunxi,sunxi-mali,$(SUNXI_MALI_VERSION))
 
 SUNXI_MALI_INSTALL_STAGING = YES
-SUNXI_MALI_DEPENDENCIES = sunxi-mali-prop
+SUNXI_MALI_DEPENDENCIES = libump sunxi-mali-prop
 SUNXI_MALI_PROVIDES = libegl libgles
 
 # The options below must be provided in the environment.  Providing these
