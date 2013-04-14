From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Apr 2013 19:31:30 +0200
Subject: [Buildroot] [git commit] linux: don't use $ in dtb comment as the
	shell tries to expand them
Message-ID: <20130414184110.7B0109B62E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3cab8aaeb77128a9c93815e3db9953f5153e8ea8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 8a73767..2fff2e9 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -197,14 +197,14 @@ define LINUX_BUILD_DTB
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(KERNEL_DTBS)
 endef
 define LINUX_INSTALL_DTB
-	# dtbs moved from arch/$ARCH/boot to arch/$ARCH/boot/dts since 3.8-rc1
+	# dtbs moved from arch/<ARCH>/boot to arch/<ARCH>/boot/dts since 3.8-rc1
 	cp $(addprefix \
 		$(KERNEL_ARCH_PATH)/boot/$(if $(wildcard \
 		$(addprefix $(KERNEL_ARCH_PATH)/boot/dts/,$(KERNEL_DTBS))),dts/),$(KERNEL_DTBS)) \
 		$(BINARIES_DIR)/
 endef
 define LINUX_INSTALL_DTB_TARGET
-	# dtbs moved from arch/$ARCH/boot to arch/$ARCH/boot/dts since 3.8-rc1
+	# dtbs moved from arch/<ARCH>/boot to arch/<ARCH>/boot/dts since 3.8-rc1
 	cp $(addprefix \
 		$(KERNEL_ARCH_PATH)/boot/$(if $(wildcard \
 		$(addprefix $(KERNEL_ARCH_PATH)/boot/dts/,$(KERNEL_DTBS))),dts/),$(KERNEL_DTBS)) \
