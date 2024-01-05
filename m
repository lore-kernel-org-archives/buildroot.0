Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAAFC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 08:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 251E343649;
	Fri,  5 Jan 2024 08:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 251E343649
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cv1rd9St8qJP; Fri,  5 Jan 2024 08:46:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B4C24367C;
	Fri,  5 Jan 2024 08:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B4C24367C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 191D71BF30D
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 08:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2C6E420A4
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 08:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2C6E420A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tO81IABtCq_a for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 08:45:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46CEB414BF
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 08:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46CEB414BF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2EB0984370; Fri,  5 Jan 2024 08:45:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 09:44:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 045ab73702b8bc09f94ca1f3b8e5bf3acb0b0843
X-Git-Newrev: a608e519a028a8218c5190c8fd417df33173347c
X-Patchwork-Hint: ignore
Message-Id: <20240105084541.2EB0984370@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dahdi-linux: bump to version 3.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4540726823156654388=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4540726823156654388==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a608e519a028a8218c5190c8fd417df33173347c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop all patches except first one (already in version)
- This bump will fix the following build failure with kernel >= 6.6:

/home/autobuild/autobuild/instance-2/output-1/build/dahdi-linux-3.2.0/drivers/dahdi/wct4xxp/base.c: In function ‘free_wc’:
./include/linux/workqueue.h:639:9: error: call to ‘__warn_flushing_systemwide_wq’ declared with attribute warning: Please avoid flushing system-wide workqueues. [-Werror=attribute-warning]
  639 |         __warn_flushing_systemwide_wq();                                \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/autobuild/autobuild/instance-2/output-1/build/dahdi-linux-3.2.0/drivers/dahdi/wct4xxp/base.c:2025:9: note: in expansion of macro ‘flush_scheduled_work’
 2025 |         flush_scheduled_work();
      |         ^~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

https://github.com/asterisk/dahdi-linux/releases/tag/v3.3.0

Fixes:
 - http://autobuild.buildroot.org/results/e9755e1f4814b6b0c151c590b5c34acfd89556ad

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |   4 -
 ...di-Kbuild-fix-HOTPLUG_FIRMWARE-definition.patch |  64 ------------
 ...ch => 0001-fix-build-with-32-bits-kernel.patch} |   1 +
 ...compilation-issues-on-linux-kernel-5-18-0.patch |  58 -----------
 .../0004-next-fix-kernel-6-1-build.patch           |  32 ------
 .../dahdi-linux/0005-Fix-build-on-Linux-6.3.patch  | 116 ---------------------
 .../dahdi-linux/0006-Fix-build-on-Linux-6.4.patch  |  69 ------------
 package/dahdi-linux/dahdi-linux.hash               |   4 +-
 package/dahdi-linux/dahdi-linux.mk                 |   2 +-
 9 files changed, 4 insertions(+), 346 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 9551ed23ae..24780870e5 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -273,10 +273,6 @@ package/curlftpfs/0004-fix-musl-build-off-t.patch Upstream
 package/cutelyst/0001-server-CMakeLists.txt-don-t-override-CMAKE_EXE_LINKE.patch Upstream
 package/cwiid/0001-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch Upstream
 package/cwiid/0002-configure-make-wmgui-build-optional.patch Upstream
-package/dahdi-linux/0001-drivers-dahdi-Kbuild-fix-HOTPLUG_FIRMWARE-definition.patch Upstream
-package/dahdi-linux/0002-fix-build-with-32-bits-kernel.patch Upstream
-package/dahdi-linux/0003-Fixed-compilation-issues-on-linux-kernel-5-18-0.patch Upstream
-package/dahdi-linux/0004-next-fix-kernel-6-1-build.patch Upstream
 package/dahdi-tools/0001-no-build-docs.patch Upstream
 package/dahdi-tools/0002-no-perl-manpages.patch Upstream
 package/dante/0001-fix-sparc-compile.patch Upstream
diff --git a/package/dahdi-linux/0001-drivers-dahdi-Kbuild-fix-HOTPLUG_FIRMWARE-definition.patch b/package/dahdi-linux/0001-drivers-dahdi-Kbuild-fix-HOTPLUG_FIRMWARE-definition.patch
deleted file mode 100644
index 82fd9bdc59..0000000000
--- a/package/dahdi-linux/0001-drivers-dahdi-Kbuild-fix-HOTPLUG_FIRMWARE-definition.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From dc0a646a460e6da10ddbe7bf02794051d76f8751 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 4 Nov 2021 17:30:06 +0100
-Subject: [PATCH] drivers/dahdi/Kbuild: fix HOTPLUG_FIRMWARE definition
-
-HOTPLUG_FIRMWARE is used before being defined resulting in the following
-build failure since version 2.7.0 and
-https://git.asterisk.org/gitweb/?p=dahdi/linux.git;a=commit;h=e2f492595c9191ba6d556ccac1bde4c1bb892938:
-
-  MODPOST /home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/Module.symvers
-ERROR: modpost: "_binary_dahdi_fw_oct6114_032_bin_start" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/wcaxx.ko] undefined!
-ERROR: modpost: "_binary_dahdi_fw_oct6114_032_bin_size" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/wcaxx.ko] undefined!
-ERROR: modpost: "_binary_dahdi_fw_oct6114_128_bin_start" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/wcte43x.ko] undefined!
-ERROR: modpost: "_binary_dahdi_fw_oct6114_064_bin_start" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/wcte43x.ko] undefined!
-ERROR: modpost: "_binary_dahdi_fw_oct6114_128_bin_size" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/wcte43x.ko] undefined!
-ERROR: modpost: "_binary_dahdi_fw_oct6114_064_bin_size" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/wcte43x.ko] undefined!
-ERROR: modpost: "_binary_dahdi_fw_oct6114_032_bin_start" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/wcte13xp.ko] undefined!
-ERROR: modpost: "_binary_dahdi_fw_oct6114_032_bin_size" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/wcte13xp.ko] undefined!
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: sent to "Shaun Ruffell <sruffell@sruffell.net>"]
----
- drivers/dahdi/Kbuild | 18 +++++++++---------
- 1 file changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/drivers/dahdi/Kbuild b/drivers/dahdi/Kbuild
-index 855e5bf..b1a8481 100644
---- a/drivers/dahdi/Kbuild
-+++ b/drivers/dahdi/Kbuild
-@@ -13,6 +13,15 @@ obj-$(DAHDI_BUILD_ALL)$(CONFIG_DAHDI_WCTC4XXP)		+= wctc4xxp/
- obj-$(DAHDI_BUILD_ALL)$(CONFIG_DAHDI_WCTDM24XXP)	+= wctdm24xxp/
- obj-$(DAHDI_BUILD_ALL)$(CONFIG_DAHDI_WCTE13XP)		+= wcte13xp.o
- 
-+ifndef HOTPLUG_FIRMWARE
-+ifneq (,$(filter y m,$(CONFIG_FW_LOADER)))
-+HOTPLUG_FIRMWARE := yes
-+else
-+HOTPLUG_FIRMWARE := no
-+endif
-+export HOTPLUG_FIRMWARE
-+endif
-+
- wcte13xp-objs := wcte13xp-base.o wcxb_spi.o wcxb.o wcxb_flash.o
- CFLAGS_wcte13xp-base.o += -I$(src)/oct612x -I$(src)/oct612x/include -I$(src)/oct612x/octdeviceapi -I$(src)/oct612x/octdeviceapi/oct6100api
- ifeq ($(HOTPLUG_FIRMWARE),yes)
-@@ -61,15 +70,6 @@ endif
- 
- CFLAGS_MODULE += -I$(DAHDI_INCLUDE) -I$(src) -Wno-format-truncation
- 
--ifndef HOTPLUG_FIRMWARE
--ifneq (,$(filter y m,$(CONFIG_FW_LOADER)))
--HOTPLUG_FIRMWARE := yes
--else
--HOTPLUG_FIRMWARE := no
--endif
--export HOTPLUG_FIRMWARE
--endif
--
- # fix typo present in CentOS and RHEL 2.6.9 kernels
- BAD_KERNELS_VERS := 22 34 34.0.1 34.0.2
- BAD_KERNELS := $(foreach ver,$(BAD_KERNELS_VERS),2.6.9-$(ver).EL 2.6.9-$(ver).ELsmp)
--- 
-2.33.0
-
diff --git a/package/dahdi-linux/0002-fix-build-with-32-bits-kernel.patch b/package/dahdi-linux/0001-fix-build-with-32-bits-kernel.patch
similarity index 99%
rename from package/dahdi-linux/0002-fix-build-with-32-bits-kernel.patch
rename to package/dahdi-linux/0001-fix-build-with-32-bits-kernel.patch
index ddaf6b4e7a..df09149679 100644
--- a/package/dahdi-linux/0002-fix-build-with-32-bits-kernel.patch
+++ b/package/dahdi-linux/0001-fix-build-with-32-bits-kernel.patch
@@ -12,6 +12,7 @@ ERROR: modpost: "__moddi3" [/home/fabrice/buildroot/output/build/dahdi-linux-5c8
 ERROR: modpost: "__divdi3" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/xpp/xpp.ko] undefined!
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/asterisk/dahdi-linux/pull/32
 ---
  drivers/dahdi/xpp/xbus-core.c    |  9 ++++++---
  drivers/dahdi/xpp/xbus-pcm.c     |  4 ++--
diff --git a/package/dahdi-linux/0003-Fixed-compilation-issues-on-linux-kernel-5-18-0.patch b/package/dahdi-linux/0003-Fixed-compilation-issues-on-linux-kernel-5-18-0.patch
deleted file mode 100644
index a896def375..0000000000
--- a/package/dahdi-linux/0003-Fixed-compilation-issues-on-linux-kernel-5-18-0.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From dbb43101c2a9205b67223b006bf75c29ebadced9 Mon Sep 17 00:00:00 2001
-From: Pushkar Singh <psingh@sangoma.com>
-Date: Tue, 2 Aug 2022 19:40:00 +0530
-Subject: [PATCH] Fixed compilation issues on linux kernel >= 5.18.0
-
-With kernel 5.18 and higher
-PCI: Remove the deprecated "pci-dma-compat.h" API
-
-The commit will make sure to impplement pci dma related api's
-[Retrieved from:
-https://github.com/asterisk/dahdi-linux/commit/dbb43101c2a9205b67223b006bf75c29ebadced9]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/dahdi/kernel.h | 31 +++++++++++++++++++++++++++++++
- 1 file changed, 31 insertions(+)
-
-diff --git a/include/dahdi/kernel.h b/include/dahdi/kernel.h
-index ed81e9e3..35e93bc4 100644
---- a/include/dahdi/kernel.h
-+++ b/include/dahdi/kernel.h
-@@ -58,6 +58,37 @@
- 
- #include <linux/poll.h>
- 
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 18, 0)
-+#include <linux/pci.h>
-+#include <linux/dma-mapping.h>
-+
-+static inline void *pci_alloc_consistent(struct pci_dev *hwdev, size_t size, dma_addr_t *dma_handle)
-+{
-+    return dma_alloc_coherent(hwdev == NULL ? NULL : &hwdev->dev, size, dma_handle, GFP_ATOMIC);
-+}
-+
-+static inline void pci_free_consistent(struct pci_dev *hwdev, size_t size, void *vaddr, dma_addr_t dma_handle)
-+{
-+    dma_free_coherent(hwdev == NULL ? NULL : &hwdev->dev, size, vaddr, dma_handle);
-+}
-+
-+static inline dma_addr_t pci_map_single(struct pci_dev *hwdev, void *ptr, size_t size, int direction)
-+{
-+    return dma_map_single(&hwdev->dev, ptr, size, (enum dma_data_direction)direction);
-+}
-+
-+static inline void pci_unmap_single(struct pci_dev *hwdev, dma_addr_t dma_addr, size_t size, int direction)
-+{
-+    dma_unmap_single(&hwdev->dev, dma_addr, size, (enum dma_data_direction)direction);
-+}
-+
-+static inline int pci_set_dma_mask(struct pci_dev *dev, u64 mask)
-+{
-+    return dma_set_mask(&dev->dev, mask);
-+}
-+
-+#endif
-+
- #if LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 29)
- #define HAVE_NET_DEVICE_OPS
- #endif
diff --git a/package/dahdi-linux/0004-next-fix-kernel-6-1-build.patch b/package/dahdi-linux/0004-next-fix-kernel-6-1-build.patch
deleted file mode 100644
index b910c4b775..0000000000
--- a/package/dahdi-linux/0004-next-fix-kernel-6-1-build.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a759a578277bde98eba7ef4bf86bdf819a900de9 Mon Sep 17 00:00:00 2001
-From: John Thomson <git@johnthomson.fastmail.com.au>
-Date: Sun, 23 Oct 2022 13:42:52 +1000
-Subject: [PATCH] fix kernel 6.1 build
-
-kernel 6.1 includes b48b89f9c189 ("net: drop the weight argument from netif_napi_add") [0]
-
-[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b48b89f9c189d24eb5e2b4a0ac067da5a24ee86d
-
-Signed-off-by: John Thomson <git@johnthomson.fastmail.com.au>
-[Retrieved from:
-https://github.com/asterisk/dahdi-linux/pull/14/commits/a759a578277bde98eba7ef4bf86bdf819a900de9]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/dahdi/kernel.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/include/dahdi/kernel.h b/include/dahdi/kernel.h
-index 35e93bc4..fd64a15e 100644
---- a/include/dahdi/kernel.h
-+++ b/include/dahdi/kernel.h
-@@ -58,6 +58,10 @@
- 
- #include <linux/poll.h>
- 
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0)
-+#define netif_napi_add netif_napi_add_weight
-+#endif
-+
- #if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 18, 0)
- #include <linux/pci.h>
- #include <linux/dma-mapping.h>
diff --git a/package/dahdi-linux/0005-Fix-build-on-Linux-6.3.patch b/package/dahdi-linux/0005-Fix-build-on-Linux-6.3.patch
deleted file mode 100644
index f2ac4d2dc3..0000000000
--- a/package/dahdi-linux/0005-Fix-build-on-Linux-6.3.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From c4969d756eac041758856b99a1084158c06beb7e Mon Sep 17 00:00:00 2001
-From: Brahmajit Das <brahmajit.xyz@gmail.com>
-Date: Thu, 22 Jun 2023 15:52:18 +0000
-Subject: [PATCH] drivers/dahdi: fix build with clang-16
-
-clang-16 enables -Werror=incompatible-pointer-types (along with buch of
-other warnings) by default, thus resulting in errors such as:
-
-/var/tmp/portage/net-misc/dahdi-3.2.0/work/dahdi-linux-3.2.0/drivers/dahdi/dahdi-sysfs.c:272:20: error: incompatible function
-      pointer types initializing 'int (*)(const struct device *, struct kobj_uevent_env *)' with an expression of type
-      'int (struct device *, struct kobj_uevent_env *)' [-Wincompatible-function-pointer-types]
-        .uevent         = span_uevent,
-                          ^~~~~~~~~~~
-/var/tmp/portage/net-misc/dahdi-3.2.0/work/dahdi-linux-3.2.0/drivers/dahdi/dahdi-sysfs.c:709:20: error: incompatible function
-      pointer types initializing 'int (*)(const struct device *, struct kobj_uevent_env *)' with an expression of type
-      'int (struct device *, struct kobj_uevent_env *)' [-Wincompatible-function-pointer-types]
-        .uevent         = device_uevent,
-                          ^~~~~~~~~~~~~
-2 errors generated.
-
-This is due the change in bus_type strcut made in upstream commit
-https://github.com/torvalds/linux/commit/2a81ada32f0e584fc0c943e0d3a8c9f4fae411d6.
-Where they make uevent take a const *, as the strcut should not be
-modifying the device that is passed into it.
-
-This patch modifes some of the fucntions parameter types, making dahdi
-possible to be built with clang-16.
-
-Bug: https://bugs.gentoo.org/906179
-Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
-
-Upstream: https://github.com/asterisk/dahdi-linux/pull/21
-
-[Bernd: updated patch for compatibility with kernel < 6.3]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- drivers/dahdi/dahdi-sysfs.c    | 12 ++++++++++--
- drivers/dahdi/wctc4xxp/base.c  |  2 +-
- drivers/dahdi/xpp/xbus-sysfs.c |  4 ++++
- 3 files changed, 15 insertions(+), 3 deletions(-)
-
-diff --git a/drivers/dahdi/dahdi-sysfs.c b/drivers/dahdi/dahdi-sysfs.c
-index ca29ddba..38236929 100644
---- a/drivers/dahdi/dahdi-sysfs.c
-+++ b/drivers/dahdi/dahdi-sysfs.c
-@@ -47,7 +47,7 @@ static int span_match(struct device *dev, struct device_driver *driver)
- 	return 1;
- }
- 
--static inline struct dahdi_span *dev_to_span(struct device *dev)
-+static inline struct dahdi_span *dev_to_span(const struct device *dev)
- {
- 	return dev_get_drvdata(dev);
- }
-@@ -68,7 +68,11 @@ static inline struct dahdi_span *dev_to_span(struct device *dev)
- 			return err;				\
- 	} while (0)
- 
-+#if LINUX_VERSION_CODE < KERNEL_VERSION(6, 3, 0)
- static int span_uevent(struct device *dev, struct kobj_uevent_env *kenv)
-+#else
-+static int span_uevent(const struct device *dev, struct kobj_uevent_env *kenv)
-+#endif
- {
- 	struct dahdi_span *span;
- 
-@@ -415,7 +419,7 @@ static struct {
- 	unsigned int clean_chardev:1;
- } should_cleanup;
- 
--static inline struct dahdi_device *to_ddev(struct device *dev)
-+static inline struct dahdi_device *to_ddev(const struct device *dev)
- {
- 	return container_of(dev, struct dahdi_device, dev);
- }
-@@ -438,7 +442,11 @@ static inline struct dahdi_device *to_ddev(struct device *dev)
- 			return err;				\
- 	} while (0)
- 
-+#if LINUX_VERSION_CODE < KERNEL_VERSION(6, 3, 0)
- static int device_uevent(struct device *dev, struct kobj_uevent_env *kenv)
-+#else
-+static int device_uevent(const struct device *dev, struct kobj_uevent_env *kenv)
-+#endif
- {
- 	struct dahdi_device *ddev;
- 
-diff --git a/drivers/dahdi/wctc4xxp/base.c b/drivers/dahdi/wctc4xxp/base.c
-index ec6fc436..db70ea7e 100644
---- a/drivers/dahdi/wctc4xxp/base.c
-+++ b/drivers/dahdi/wctc4xxp/base.c
-@@ -643,7 +643,7 @@ wctc4xxp_net_register(struct wcdte *wc)
- 		return -ENOMEM;
- 	priv = netdev_priv(netdev);
- 	priv->wc = wc;
--	memcpy(netdev->dev_addr, our_mac, sizeof(our_mac));
-+	memcpy((void *)netdev->dev_addr, our_mac, sizeof(our_mac));
- 
- #	ifdef HAVE_NET_DEVICE_OPS
- 	netdev->netdev_ops = &wctc4xxp_netdev_ops;
-diff --git a/drivers/dahdi/xpp/xbus-sysfs.c b/drivers/dahdi/xpp/xbus-sysfs.c
-index d8c11dc3..11b3ed3e 100644
---- a/drivers/dahdi/xpp/xbus-sysfs.c
-+++ b/drivers/dahdi/xpp/xbus-sysfs.c
-@@ -418,7 +418,11 @@ static int astribank_match(struct device *dev, struct device_driver *driver)
- 			return err;				\
- 	} while (0)
- 
-+#if LINUX_VERSION_CODE < KERNEL_VERSION(6, 3, 0)
- static int astribank_uevent(struct device *dev, struct kobj_uevent_env *kenv)
-+#else
-+static int astribank_uevent(const struct device *dev, struct kobj_uevent_env *kenv)
-+#endif
- {
- 	xbus_t *xbus;
- 	extern char *initdir;
diff --git a/package/dahdi-linux/0006-Fix-build-on-Linux-6.4.patch b/package/dahdi-linux/0006-Fix-build-on-Linux-6.4.patch
deleted file mode 100644
index 992cb4d513..0000000000
--- a/package/dahdi-linux/0006-Fix-build-on-Linux-6.4.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From b393e59d7eb2951e2fb279fca1c4756ea165aeee Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sun, 9 Jul 2023 17:14:31 +0200
-Subject: [PATCH] Fix build on Linux 6.4
-
-Needed after upstream changes in kernel 6.4:
-https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/diff/include/linux/device/class.h?id=1aaba11da9aa
-https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=48380368dec14859723b9e3fbd43e042638d9a76
-
-Upstream: https://github.com/asterisk/dahdi-linux/pull/22
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- drivers/dahdi/dahdi-sysfs-chan.c  | 4 ++++
- drivers/dahdi/voicebus/voicebus.c | 4 ++++
- drivers/dahdi/wctdm24xxp/base.c   | 4 ++++
- 3 files changed, 12 insertions(+)
-
-diff --git a/drivers/dahdi/dahdi-sysfs-chan.c b/drivers/dahdi/dahdi-sysfs-chan.c
-index a91e6ed..b18b5f9 100644
---- a/drivers/dahdi/dahdi-sysfs-chan.c
-+++ b/drivers/dahdi/dahdi-sysfs-chan.c
-@@ -482,7 +482,11 @@ int __init dahdi_sysfs_chan_init(const struct file_operations *fops)
- 	}
- 	should_cleanup.channel_driver = 1;
- 
-+#if LINUX_VERSION_CODE < KERNEL_VERSION(6, 4, 0)
- 	dahdi_class = class_create(THIS_MODULE, "dahdi");
-+#else
-+	dahdi_class = class_create("dahdi");
-+#endif
- 	if (IS_ERR(dahdi_class)) {
- 		res = PTR_ERR(dahdi_class);
- 		dahdi_err("%s: class_create(dahi_chan) failed. Error: %d\n",
-diff --git a/drivers/dahdi/voicebus/voicebus.c b/drivers/dahdi/voicebus/voicebus.c
-index 8a1f7a6..d141aaf 100644
---- a/drivers/dahdi/voicebus/voicebus.c
-+++ b/drivers/dahdi/voicebus/voicebus.c
-@@ -1135,7 +1135,11 @@ static void vb_stop_txrx_processors(struct voicebus *vb)
-  */
- void voicebus_stop(struct voicebus *vb)
- {
-+#if LINUX_VERSION_CODE < KERNEL_VERSION(6, 4, 0)
- 	static DEFINE_SEMAPHORE(stop);
-+#else
-+	static DEFINE_SEMAPHORE(stop, 1);
-+#endif
- 
- 	down(&stop);
- 
-diff --git a/drivers/dahdi/wctdm24xxp/base.c b/drivers/dahdi/wctdm24xxp/base.c
-index a28e249..4392b45 100644
---- a/drivers/dahdi/wctdm24xxp/base.c
-+++ b/drivers/dahdi/wctdm24xxp/base.c
-@@ -224,7 +224,11 @@ mod_hooksig(struct wctdm *wc, struct wctdm_module *mod, enum dahdi_rxsig rxsig)
- }
- 
- struct wctdm *ifaces[WC_MAX_IFACES];
-+#if LINUX_VERSION_CODE < KERNEL_VERSION(6, 4, 0)
- DEFINE_SEMAPHORE(ifacelock);
-+#else
-+DEFINE_SEMAPHORE(ifacelock, 1);
-+#endif
- 
- static void wctdm_release(struct wctdm *wc);
- 
--- 
-2.39.2
-
diff --git a/package/dahdi-linux/dahdi-linux.hash b/package/dahdi-linux/dahdi-linux.hash
index 2d3f336777..e250850630 100644
--- a/package/dahdi-linux/dahdi-linux.hash
+++ b/package/dahdi-linux/dahdi-linux.hash
@@ -1,5 +1,5 @@
-# From http://downloads.asterisk.org/pub/telephony/dahdi-linux/releases/dahdi-linux-3.2.0.sha256
-sha256  e2ef9b3f6769f60f432cfa09c39c9a0d7ab5bddff59229f385056915c65f9f13  dahdi-linux-3.2.0.tar.gz
+# From http://downloads.asterisk.org/pub/telephony/dahdi-linux/releases/dahdi-linux-3.3.0.sha256
+sha256  f9528a82b5e88c1d92d737efd65bd571bef2cd1b1b44d43b857a76e38e01a7c0  dahdi-linux-3.3.0.tar.gz
 
 # Firmware files have no upstream hash, so sha56 locally computed
 sha256  3ff26cf80555fd7470b43a87c51d03c1db2a75abcd4561d79f69b6c48298e4a1  dahdi-fwload-vpmadt032-1.25.0.tar.gz
diff --git a/package/dahdi-linux/dahdi-linux.mk b/package/dahdi-linux/dahdi-linux.mk
index 88519b5106..c688d3877c 100644
--- a/package/dahdi-linux/dahdi-linux.mk
+++ b/package/dahdi-linux/dahdi-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAHDI_LINUX_VERSION = 3.2.0
+DAHDI_LINUX_VERSION = 3.3.0
 DAHDI_LINUX_SITE = \
 	http://downloads.asterisk.org/pub/telephony/dahdi-linux/releases
 

--===============4540726823156654388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4540726823156654388==--
