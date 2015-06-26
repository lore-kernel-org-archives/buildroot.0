From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 26 Jun 2015 10:13:37 +0200
Subject: [Buildroot] [PATCH 2/2] sunxi-mali: bump version
In-Reply-To: <1435306417-12448-1-git-send-email-francois.perrad@gadz.org>
References: <1435306417-12448-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1435306417-12448-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/sunxi-mali/Config.in     | 1 +
 package/sunxi-mali/sunxi-mali.mk | 4 ++--
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
-- 
2.1.4
