From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jun 2020 09:27:08 +0200
Subject: [Buildroot] [git commit] linux: rename config option
Message-ID: <20200607072634.2E14284688@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8e3e939694c4777c5287e44e67772f4e5c043aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit a4eef9a3959 (linux: introduce BR2_KERNEL_DTB_KEEP_DIRNAME)
introduced a new config option, but its name was not matching the
naming-scheme of the other config options.

Rename it.

We don't need legacy handling, because that config option was added very
recently and was never part of a release.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/Config.in | 2 +-
 linux/linux.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 61e84f00b4..2af3a00352 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -407,7 +407,7 @@ config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 	  You can provide a list of dts paths to copy and
 	  build, separated by spaces.
 
-config BR2_KERNEL_DTB_KEEP_DIRNAME
+config BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME
 	bool "Keep the directory name of the Device Tree"
 	help
 	  If enabled, the device tree blobs keep their
diff --git a/linux/linux.mk b/linux/linux.mk
index c3859a59d5..b90b032bb9 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -381,7 +381,7 @@ define LINUX_INSTALL_DTB
 	$(foreach dtb,$(LINUX_DTBS), \
 		install -D \
 			$(or $(wildcard $(LINUX_ARCH_PATH)/boot/dts/$(dtb)),$(LINUX_ARCH_PATH)/boot/$(dtb)) \
-			$(1)/$(if $(BR2_KERNEL_DTB_KEEP_DIRNAME),$(dtb),$(notdir $(dtb)))
+			$(1)/$(if $(BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME),$(dtb),$(notdir $(dtb)))
 	)
 endef
 endif # BR2_LINUX_KERNEL_APPENDED_DTB
