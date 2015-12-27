From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Dec 2015 17:40:56 +0100
Subject: [Buildroot] [git commit] vboot-utils: add missing dependency on
	host-util-linux
Message-ID: <20151227164328.7EC30818B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=555231fa2d6df3b60235c5401c773f1ab9804d4e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

vboot-utils needs uuid.h and libuuid for the cgpt tool, so we need to
depend on host-util-linux.

Fixes:

  http://autobuild.buildroot.org/results/ee1/ee18202cb6d7751178617e6a3d0bc97e65318aa9/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vboot-utils/Config.in.host | 1 +
 package/vboot-utils/vboot-utils.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/vboot-utils/Config.in.host b/package/vboot-utils/Config.in.host
index 899f6e7..aa0caef 100644
--- a/package/vboot-utils/Config.in.host
+++ b/package/vboot-utils/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_VBOOT_UTILS
 	bool "host vboot utils"
+	select BR2_PACKAGE_HOST_UTIL_LINUX
 	help
 	  Chromium OS verified boot utilities: futility and cgpt.
 
diff --git a/package/vboot-utils/vboot-utils.mk b/package/vboot-utils/vboot-utils.mk
index 75978cb..a7592d6 100644
--- a/package/vboot-utils/vboot-utils.mk
+++ b/package/vboot-utils/vboot-utils.mk
@@ -10,7 +10,7 @@ VBOOT_UTILS_SITE_METHOD = git
 VBOOT_UTILS_LICENSE = BSD-3c
 VBOOT_UTILS_LICENSE_FILES = LICENSE
 
-HOST_VBOOT_UTILS_DEPENDENCIES = host-openssl host-pkgconf
+HOST_VBOOT_UTILS_DEPENDENCIES = host-openssl host-util-linux host-pkgconf
 
 # vboot_reference contains code that goes into bootloaders,
 # utilities intended for the target system, and a bunch of scripts
