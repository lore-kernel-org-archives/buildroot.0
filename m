From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 14 Jan 2013 00:15:06 +0100
Subject: [Buildroot] [git commit] Makefile: use
	newly-introducedBUILDROOT_CONFIG breaks build
In-Reply-To: <20130113221602.6AFBD99C29@busybox.osuosl.org>
References: <20130113221602.6AFBD99C29@busybox.osuosl.org>
Message-ID: <9C8E62D5EF05422F9C541B3F67D72768@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

This changes seem to break the build.

Snip ...

rm -rf /home/buildroot12git/output/toolchain/uClibc-0.9.33.2
bzcat /home/johan/dl/uClibc-0.9.33.2.tar.bz2 | tar -C /home/buildroot12git/output/toolchain  -xf -
touch /home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.unpacked
support/scripts/apply-patches.sh /home/buildroot12git/output/toolchain/uClibc-0.9.33.2 toolchain/uClibc/ \
		uClibc-0.9.33.2-\*.patch \
		uClibc-0.9.33.2-\*.patch.arm

Applying uClibc-0.9.33.2-define-MSG_CMSG_CLOEXEC.patch using patch: 
patching file libc/sysdeps/linux/common/bits/socket.h

Applying uClibc-0.9.33.2-dup3.patch using patch: 
patching file include/unistd.h
patching file libc/sysdeps/linux/common/dup3.c
touch /home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.patched
cp -f /home/buildroot12git/board/karo/uClibc-0.9.33.config /home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
/bin/sed -i -e
's,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-",g'
\
		-e 's,# TARGET_arm is not set,TARGET_arm=y,g' \
		-e 's,^TARGET_ARCH=".*",TARGET_ARCH=\"arm\",g' \
		-e 's,^KERNEL_SOURCE=.*,KERNEL_SOURCE=\"/home/buildroot12git/output/toolchain/linux\",g' \
		-e 's,^KERNEL_HEADERS=.*,KERNEL_HEADERS=\"/home/buildroot12git/output/toolchain/linux/include\",g' \
		-e 's,^RUNTIME_PREFIX=.*,RUNTIME_PREFIX=\"/\",g' \
		-e 's,^DEVEL_PREFIX=.*,DEVEL_PREFIX=\"/usr/\",g' \
		-e 's,^SHARED_LIB_LOADER_PREFIX=.*,SHARED_LIB_LOADER_PREFIX=\"/lib\",g' \
		/home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
(/bin/echo "# CONFIG_GENERIC_ARM is not set"; \
	 /bin/echo "# CONFIG_ARM610 is not set"; \
	 /bin/echo "# CONFIG_ARM710 is not set"; \
	 /bin/echo "# CONFIG_ARM7TDMI is not set"; \
	 /bin/echo "# CONFIG_ARM720T is not set"; \
	 /bin/echo "# CONFIG_ARM920T is not set"; \
	 /bin/echo "# CONFIG_ARM922T is not set"; \
	 /bin/echo "# CONFIG_ARM926T is not set"; \
	 /bin/echo "# CONFIG_ARM10T is not set"; \
	 /bin/echo "# CONFIG_ARM1136JF_S is not set"; \
	 /bin/echo "# CONFIG_ARM1176JZ_S is not set"; \
	 /bin/echo "# CONFIG_ARM1176JZF_S is not set"; \
	 /bin/echo "# CONFIG_ARM_SA110 is not set"; \
	 /bin/echo "# CONFIG_ARM_SA1100 is not set"; \
	 /bin/echo "# CONFIG_ARM_XSCALE is not set"; \
	 /bin/echo "# CONFIG_ARM_IWMMXT is not set"; \
	) >> /home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
/bin/sed -i -e 's/^\(CONFIG_[^_]*[_]*ARM[^=]*\)=.*/# \1 is not set/g' \
		 /home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
/bin/sed -i -e 's/^.*CONFIG_ARM_CORTEXA8.*/CONFIG_ARM_CORTEXA8=y/g' /home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
/bin/sed -i -e '/CONFIG_ARM_.ABI/d' /home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
/bin/echo "# CONFIG_ARM_OABI is not set" >> /home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
/bin/echo "CONFIG_ARM_EABI=y" >> /home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
# The above doesn't work for me, so redo
/bin/sed -i -e 's/.*\(ARCH_BIG_ENDIAN\).*/# \1 is not set/g' \
		-e 's/.*\(ARCH_WANTS_BIG_ENDIAN\).*/# \1 is not set/g' \
		-e 's/.*\(ARCH_LITTLE_ENDIAN\).*/\1=y/g' \
		-e 's/.*\(ARCH_WANTS_LITTLE_ENDIAN\).*/\1=y/g' \
		/home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
/bin/sed -i -e 's,.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=y,g' /home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
/bin/sed -i -e 's,^.*UCLIBC_HAS_IPV6.*,UCLIBC_HAS_IPV6=y,g' /home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
/bin/sed -i -e 's,^.*UCLIBC_HAS_RPC.*,UCLIBC_HAS_RPC=y,g' \
		-e 's,^.*UCLIBC_HAS_FULL_RPC.*,UCLIBC_HAS_FULL_RPC=y,g' \
		-e 's,^.*UCLIBC_HAS_REENTRANT_RPC.*,UCLIBC_HAS_REENTRANT_RPC=y,g' \
		/home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
/bin/sed -i -e '/UCLIBC_HAS_FLOATS/d' \
		-e 's,.*UCLIBC_HAS_FPU.*,UCLIBC_HAS_FPU=y\nHAS_FPU=y\nUCLIBC_HAS_FLOATS=y\n,g' \
		/home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
/bin/sed -i -e 's,^.*UCLIBC_HAS_SSP[^_].*,UCLIBC_HAS_SSP=n,g' /home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
/bin/sed -i -e '/UCLIBC_HAS_THREADS/d' /home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
/bin/sed -i -e '/LINUXTHREADS/d' /home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
/bin/sed -i -e '/LINUXTHREADS_OLD/d' /home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
/bin/sed -i -e '/PTHREADS_DEBUG_SUPPORT/d' /home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
/bin/sed -i -e '/UCLIBC_HAS_THREADS_NATIVE/d' /home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
echo "UCLIBC_HAS_THREADS=y" >> /home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
echo "# LINUXTHREADS is not set" >> /home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
echo "# LINUXTHREADS_NEW is not set" >> /home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
echo "# LINUXTHREADS_OLD is not set" >> /home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
echo "UCLIBC_HAS_THREADS_NATIVE=y" >> /home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
echo "PTHREADS_DEBUG_SUPPORT=y" >> /home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
/bin/sed -i -e 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y\n# UCLIBC_BUILD_ALL_LOCALE is not
set\nUCLIBC_BUILD_MINIMAL_LOCALE=y\nUCLIBC_BUILD_MINIMAL_LOCALES="en_US"\nUCLIBC_PREGENERATED_LOCALE_DATA=n\nUCLIBC_DOWNLOAD_PREGENE
RATED_LOCALE_DATA=n\nUCLIBC_HAS_XLOCALE=y\nUCLIBC_HAS_GLIBC_DIGIT_GROUPING=n\n,g'
/home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
/bin/sed -i -e 's,^.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g' /home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig
cp -f /home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.oldconfig /home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.config
mkdir -p /home/buildroot12git/output/toolchain/uClibc_dev/usr/include
mkdir -p /home/buildroot12git/output/toolchain/uClibc_dev/usr/lib
mkdir -p /home/buildroot12git/output/toolchain/uClibc_dev/lib
/usr/bin/make -j1 -C /home/buildroot12git/output/toolchain/uClibc-0.9.33.2 \
		ARCH="arm" \
		PREFIX=/home/buildroot12git/output/toolchain/uClibc_dev/ \
		DEVEL_PREFIX=/usr/ \
		RUNTIME_PREFIX=/home/buildroot12git/output/toolchain/uClibc_dev/ \
		CROSS_COMPILE="/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-" \
		UCLIBC_EXTRA_CFLAGS="" \
		HOSTCC="/usr/bin/gcc" \
		oldconfig
make[1]: Entering directory `/home/buildroot12git/output/toolchain/uClibc-0.9.33.2'
Makefile.in:425: target `output/libm' given more than once in the same rule.
Makefile.in:425: target `output/libubacktrace' given more than once in the same rule.
  MKDIR include/config
  MKDIR extra/config/lxdialog
/bin/sh: line 0: cd: output/extra/config: No such file or directory
  HOSTCC-o extra/config/conf.o
Assembler messages:
Fatal error: can't create output/extra/config/conf.o: No such file or directory
make[2]: *** [output/extra/config/conf.o] Error 1
make[1]: *** [output/extra/config/conf] Error 2
make[1]: Leaving directory `/home/buildroot12git/output/toolchain/uClibc-0.9.33.2'
make: *** [/home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.config] Error 2

Snip...

I attached my configuratiuon file.

Regards johan 

-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Peter Korsgaard
Verzonden: zondag 13 januari 2013 23:14
Aan: buildroot at busybox.net
Onderwerp: [Buildroot] [git commit] Makefile: use newly-introducedBUILDROOT_CONFIG

commit: http://git.buildroot.net/buildroot/commit/?id=dcb79995aaaa6f1aa9a7d782df8bbccbda1ff409
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 5a83251..16b5ef4 100644
--- a/Makefile
+++ b/Makefile
@@ -95,7 +95,7 @@ BUILDROOT_CONFIG=$(CONFIG_DIR)/.config
 
 # Pull in the user's configuration file  ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
--include $(CONFIG_DIR)/.config
+-include $(BUILDROOT_CONFIG)
 endif
 
 # To put more focus on warnings, be less verbose as default @@ -383,7 +383,7 @@ dirs: $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR)
$(TARGET_DIR) \
 
 $(BASE_TARGETS): dirs $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
 
-$(BUILD_DIR)/buildroot-config/auto.conf: $(CONFIG_DIR)/.config
+$(BUILD_DIR)/buildroot-config/auto.conf: $(BUILDROOT_CONFIG)
 	$(MAKE) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
 
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
@@ -557,7 +557,7 @@ legal-info-prepare: $(LEGAL_INFO_DIR)
 	@$(call legal-manifest,buildroot,$(BR2_VERSION_FULL),GPLv2+,COPYING,not saved)
 	@$(call legal-warning,the Buildroot source code has not been saved)
 	@$(call legal-warning,the toolchain has not been saved)
-	@cp $(CONFIG_DIR)/.config $(LEGAL_INFO_DIR)/buildroot.config
+	@cp $(BUILDROOT_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
 
 legal-info: dirs legal-info-clean legal-info-prepare $(REDIST_SOURCES_DIR) \
 		$(TARGETS_LEGAL_INFO)
@@ -590,7 +590,7 @@ COMMON_CONFIG_ENV = \
 	KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 	KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
 	KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
-	BUILDROOT_CONFIG=$(CONFIG_DIR)/.config
+	BUILDROOT_CONFIG=$(BUILDROOT_CONFIG)
 
 xconfig: $(BUILD_DIR)/buildroot-config/qconf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config @@ -630,7 +630,7 @@ allnoconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config > $(CONFIG_DIR)/.config.nopkg
+	@grep -v BR2_PACKAGE_ $(BUILDROOT_CONFIG) > 
+$(CONFIG_DIR)/.config.nopkg
 	@grep '^config BR2_PACKAGE_' Config.in.legacy | \
 		while read config pkg; do \
 		echo "# $$pkg is not set" >> $(CONFIG_DIR)/.config.nopkg; done @@ -641,7 +641,7 @@ randpackageconfig:
$(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config > $(CONFIG_DIR)/.config.nopkg
+	@grep -v BR2_PACKAGE_ $(BUILDROOT_CONFIG) > 
+$(CONFIG_DIR)/.config.nopkg
 	@grep '^config BR2_PACKAGE_' Config.in.legacy | \
 		while read config pkg; do \
 		echo "# $$pkg is not set" >> $(CONFIG_DIR)/.config.nopkg; done @@ -652,7 +652,7 @@ allyespackageconfig:
$(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config > $(CONFIG_DIR)/.config.nopkg
+	@grep -v BR2_PACKAGE_ $(BUILDROOT_CONFIG) > 
+$(CONFIG_DIR)/.config.nopkg
 	@$(COMMON_CONFIG_ENV) \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
 		$< --allnoconfig $(CONFIG_CONFIG_IN)
@@ -706,7 +706,7 @@ endif
 ifeq ($(O),output)
 	rm -rf $(O)
 endif
-	rm -rf $(CONFIG_DIR)/.config $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/.auto.deps
+	rm -rf $(BUILDROOT_CONFIG) $(CONFIG_DIR)/.config.old 
+$(CONFIG_DIR)/.auto.deps
 
 cross: $(BASE_TARGETS)
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
A non-text attachment was scrubbed...
Name: myconfig
Type: application/octet-stream
Size: 38919 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130114/52266c95/attachment-0001.obj>
