Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26B1C433F5
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 20:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E6084194C;
	Tue, 29 Mar 2022 20:31:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P-xdWrDPtI1j; Tue, 29 Mar 2022 20:31:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94A0741942;
	Tue, 29 Mar 2022 20:31:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A9F71BF2E3
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 20:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 853C0843A6
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 20:29:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z-cmOOCKSopY for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 20:29:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D56C84397
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 20:29:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1709985F88; Tue, 29 Mar 2022 20:20:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 29 Mar 2022 21:33:39 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e9471cbad4d58eb0d95845c0d4e1e8bd846800c4
X-Git-Newrev: 711534ce860776a9274db04d3f01abfac3f98741
X-Patchwork-Hint: ignore
Message-Id: <20220329202022.1709985F88@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/librtlsdr: switch
 to autotools-package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=711534ce860776a9274db04d3f01abfac3f98741
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Switch to autotools-package to avoid the following static build failure
since commit d661740201405970f65c16c39a79f4148705af30:

[ 56%] Linking C executable rtl_biast
/home/peko/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-musl/10.3.0/../../../../riscv64-buildroot-linux-musl/bin/ld: attempted static link of dynamic object `/home/peko/autobuild/instance-1/output-1/host/riscv64-buildroot-linux-musl/sysroot/lib/libatomic.so'
collect2: error: ld returned 1 exit status

Drop both cmake-related patches

Fixes:
 - http://autobuild.buildroot.org/results/cf84759682848db8ed5610e1abe5a92337d0e957

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 26a16ed9d84cbd934fbad4d6042dfd10dc8063b4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...m-respect-DESTDIR-with-install-udev-rules.patch |  31 +++++
 ...01-disable_shared_library_target_in_build.patch | 130 ---------------------
 ...es-Version.cmake-don-t-use-Git-version-if.patch |  47 --------
 package/librtlsdr/librtlsdr.mk                     |  26 ++---
 4 files changed, 42 insertions(+), 192 deletions(-)

diff --git a/package/librtlsdr/0001-Makefile.am-respect-DESTDIR-with-install-udev-rules.patch b/package/librtlsdr/0001-Makefile.am-respect-DESTDIR-with-install-udev-rules.patch
new file mode 100644
index 0000000000..1aec8166cc
--- /dev/null
+++ b/package/librtlsdr/0001-Makefile.am-respect-DESTDIR-with-install-udev-rules.patch
@@ -0,0 +1,31 @@
+From 082c9e4cb6c8f96aa59dd3d03b0288752518fad7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 19 Feb 2022 22:29:45 +0100
+Subject: [PATCH] Makefile.am: respect $(DESTDIR) with install-udev-rules
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/steve-m/librtlsdr/pull/67]
+---
+ Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 65b2f21..6b8691a 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -14,10 +14,10 @@ dist-hook:
+ 	echo $(VERSION) > $(distdir)/.tarball-version
+ 
+ install-udev-rules:
+-	$(INSTALL_DATA) rtl-sdr.rules /etc/udev/rules.d
++	$(INSTALL_DATA) rtl-sdr.rules $(DESTDIR)/etc/udev/rules.d
+ 
+ uninstall-udev-rules:
+-	rm -rf /etc/udev/rules.d/rtl-sdr.rules
++	rm -rf $(DESTDIR)/etc/udev/rules.d/rtl-sdr.rules
+ 
+ EXTRA_DIST = git-version-gen .version
+ 
+-- 
+2.34.1
+
diff --git a/package/librtlsdr/0001-disable_shared_library_target_in_build.patch b/package/librtlsdr/0001-disable_shared_library_target_in_build.patch
deleted file mode 100644
index 2fb63465de..0000000000
--- a/package/librtlsdr/0001-disable_shared_library_target_in_build.patch
+++ /dev/null
@@ -1,130 +0,0 @@
-From 9a1c2587d4ef18e2026811deabd024eb7577d9ce Mon Sep 17 00:00:00 2001
-From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
-Date: Fri, 15 May 2020 16:14:48 +0200
-Subject: [PATCH] disable shared library target in build
-
-Disable shared library target if BUILD_SHARED_LIBS if OFF.
-
-Patch retrieved from
-https://git.buildroot.net/buildroot/tree/package/librtlsdr/0001-disable_shared_library_target_in_build.patch?h=2020.02.x
-
-Patch has been updated to work with master and to be able to keep current
-behavior of building shared and static version of library if
-BUILD_SHARED_LIBS and BUILD_STATIC_LIBS are both set.
-Moreover, if BUILD_STATIC_LIBS is OFF, only shared version of library
-will be install.
-
-[Upstream status: http://lists.osmocom.org/pipermail/osmocom-sdr/2020-May/002075.html]
-
-Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
-Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
----
- src/CMakeLists.txt | 30 +++++++++++++++++++++---------
- 1 file changed, 21 insertions(+), 9 deletions(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index de93044..13b7b1a 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -18,6 +18,8 @@
- ########################################################################
- # Setup shared library variant
- ########################################################################
-+option(BUILD_SHARED_LIBS "Build shared library" ON)
-+if(BUILD_SHARED_LIBS)
- add_library(rtlsdr SHARED librtlsdr.c
-   tuner_e4k.c tuner_fc0012.c tuner_fc0013.c tuner_fc2580.c tuner_r82xx.c)
- target_link_libraries(rtlsdr PkgConfig::LIBUSB)
-@@ -30,10 +32,14 @@ set_target_properties(rtlsdr PROPERTIES OUTPUT_NAME rtlsdr)
- set_target_properties(rtlsdr PROPERTIES SOVERSION ${MAJOR_VERSION})
- set_target_properties(rtlsdr PROPERTIES VERSION ${LIBVER})
- generate_export_header(rtlsdr)
-+list(APPEND rtlsdr_lib rtlsdr)
-+endif()
- 
- ########################################################################
- # Setup static library variant
- ########################################################################
-+option(BUILD_STATIC_LIBS "Build static library" ON)
-+if(BUILD_STATIC_LIBS)
- add_library(rtlsdr_static STATIC librtlsdr.c
-   tuner_e4k.c tuner_fc0012.c tuner_fc0013.c tuner_fc2580.c tuner_r82xx.c)
- target_link_libraries(rtlsdr_static PkgConfig::LIBUSB)
-@@ -47,6 +53,8 @@ if(NOT WIN32)
- set_target_properties(rtlsdr_static PROPERTIES OUTPUT_NAME rtlsdr)
- endif()
- generate_export_header(rtlsdr_static)
-+list(APPEND rtlsdr_lib rtlsdr_static)
-+endif()
- 
- ########################################################################
- # Set up Windows DLL resource files
-@@ -90,37 +98,37 @@ add_executable(rtl_eeprom rtl_eeprom.c)
- add_executable(rtl_adsb rtl_adsb.c)
- add_executable(rtl_power rtl_power.c)
- add_executable(rtl_biast rtl_biast.c)
--set(INSTALL_TARGETS rtlsdr rtlsdr_static rtl_sdr rtl_tcp rtl_test rtl_fm rtl_eeprom rtl_adsb rtl_power rtl_biast)
-+set(INSTALL_TARGETS ${rtlsdr_lib} rtl_sdr rtl_tcp rtl_test rtl_fm rtl_eeprom rtl_adsb rtl_power rtl_biast)
- 
--target_link_libraries(rtl_sdr rtlsdr convenience_static
-+target_link_libraries(rtl_sdr ${rtlsdr_lib} convenience_static
-     ${LIBUSB_LIBRARIES}
-     ${CMAKE_THREAD_LIBS_INIT}
- )
--target_link_libraries(rtl_tcp rtlsdr convenience_static
-+target_link_libraries(rtl_tcp ${rtlsdr_lib} convenience_static
-     ${LIBUSB_LIBRARIES}
-     ${CMAKE_THREAD_LIBS_INIT}
- )
--target_link_libraries(rtl_test rtlsdr convenience_static
-+target_link_libraries(rtl_test ${rtlsdr_lib} convenience_static
-     ${LIBUSB_LIBRARIES}
-     ${CMAKE_THREAD_LIBS_INIT}
- )
--target_link_libraries(rtl_fm rtlsdr convenience_static
-+target_link_libraries(rtl_fm ${rtlsdr_lib} convenience_static
-     ${LIBUSB_LIBRARIES}
-     ${CMAKE_THREAD_LIBS_INIT}
- )
--target_link_libraries(rtl_eeprom rtlsdr convenience_static
-+target_link_libraries(rtl_eeprom ${rtlsdr_lib} convenience_static
-     ${LIBUSB_LIBRARIES}
-     ${CMAKE_THREAD_LIBS_INIT}
- )
--target_link_libraries(rtl_adsb rtlsdr convenience_static
-+target_link_libraries(rtl_adsb ${rtlsdr_lib} convenience_static
-     ${LIBUSB_LIBRARIES}
-     ${CMAKE_THREAD_LIBS_INIT}
- )
--target_link_libraries(rtl_power rtlsdr convenience_static
-+target_link_libraries(rtl_power ${rtlsdr_lib} convenience_static
-     ${LIBUSB_LIBRARIES}
-     ${CMAKE_THREAD_LIBS_INIT}
- )
--target_link_libraries(rtl_biast rtlsdr convenience_static
-+target_link_libraries(rtl_biast ${rtlsdr_lib} convenience_static
-     ${LIBUSB_LIBRARIES}
-     ${CMAKE_THREAD_LIBS_INIT}
- )
-@@ -156,12 +164,16 @@ endif()
- ########################################################################
- # Install built library files & utilities
- ########################################################################
-+if(BUILD_SHARED_LIBS)
- install(TARGETS rtlsdr EXPORT RTLSDR-export
-   LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} # .so/.dylib file
-   )
-+endif()
-+if(BUILD_STATIC_LIBS)
- install(TARGETS rtlsdr_static EXPORT RTLSDR-export
-   ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR} # .so/.dylib file
-   )
-+endif()
- install(TARGETS rtl_sdr rtl_tcp rtl_test rtl_fm rtl_eeprom rtl_adsb rtl_power rtl_biast
-   DESTINATION ${CMAKE_INSTALL_BINDIR}
-   )
--- 
-2.25.3
-
diff --git a/package/librtlsdr/0002-cmake-Modules-Version.cmake-don-t-use-Git-version-if.patch b/package/librtlsdr/0002-cmake-Modules-Version.cmake-don-t-use-Git-version-if.patch
deleted file mode 100644
index 9c808edd41..0000000000
--- a/package/librtlsdr/0002-cmake-Modules-Version.cmake-don-t-use-Git-version-if.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From feb5d9c6b7bcec788f9b01781c205e31fff260e7 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Tue, 11 Aug 2020 23:07:08 +0200
-Subject: [PATCH] cmake/Modules/Version.cmake: don't use Git version if not in
- a Git repo
-
-If the librtlsdr code comes from a tarball, it doesn't have any .git/
-metadata, and therefore even if Git (as a tool) is found, the logic in
-cmake/Modules/Version.cmake fails finding a version through Git:
-
--- Extracting version information from git describe...
-fatal: Not a git repository (or any of the parent directories): .git
-
-As a consequence, the VERSION variable is empty, which later causes
-cmake to bail out with:
-
-CMake Error at /home/test/autobuild/run/instance-1/output-1/host/share/cmake-3.15/Modules/WriteBasicConfigVersionFile.cmake:43 (message):
-  No VERSION specified for WRITE_BASIC_CONFIG_VERSION_FILE()
-Call Stack (most recent call first):
-  /home/test/autobuild/run/instance-1/output-1/host/share/cmake-3.15/Modules/CMakePackageConfigHelpers.cmake:225 (write_basic_config_version_file)
-  CMakeLists.txt:173 (write_basic_package_version_file)
-
-To avoid this, we only use Git to determine the version if the cmake
-project top-level source directory has a .git/ folder.
-
-Upstream: https://github.com/librtlsdr/librtlsdr/pull/75
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- cmake/Modules/Version.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cmake/Modules/Version.cmake b/cmake/Modules/Version.cmake
-index 2d4e76d..6f67fa4 100644
---- a/cmake/Modules/Version.cmake
-+++ b/cmake/Modules/Version.cmake
-@@ -32,7 +32,7 @@ set(PATCH_VERSION ${VERSION_INFO_PATCH_VERSION})
- ########################################################################
- find_package(Git QUIET)
- 
--if(GIT_FOUND)
-+if(GIT_FOUND AND EXISTS ${CMAKE_SOURCE_DIR}/.git)
-     message(STATUS "Extracting version information from git describe...")
-     execute_process(
-         COMMAND ${GIT_EXECUTABLE} describe --always --abbrev=4 --long
--- 
-2.26.2
-
diff --git a/package/librtlsdr/librtlsdr.mk b/package/librtlsdr/librtlsdr.mk
index 7796d1096a..908be158b1 100644
--- a/package/librtlsdr/librtlsdr.mk
+++ b/package/librtlsdr/librtlsdr.mk
@@ -9,29 +9,25 @@ LIBRTLSDR_SITE = $(call github,steve-m,librtlsdr,$(LIBRTLSDR_VERSION))
 LIBRTLSDR_LICENSE = GPL-2.0+
 LIBRTLSDR_LICENSE_FILES = COPYING
 LIBRTLSDR_INSTALL_STAGING = YES
-LIBRTLSDR_DEPENDENCIES = libusb
-
-# BUILD_SHARED_LIBS is handled in pkg-cmake.mk as it is a generic cmake variable
-ifeq ($(BR2_STATIC_LIBS),y)
-LIBRTLSDR_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
-else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-LIBRTLSDR_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
-else ifeq ($(BR2_SHARED_LIBS),y)
-LIBRTLSDR_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
-endif
+# From git
+LIBRTLSDR_AUTORECONF = YES
+LIBRTLSDR_DEPENDENCIES = host-pkgconf libusb
+LIBRTLSDR_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-LIBRTLSDR_CONF_OPTS += -DINSTALL_UDEV_RULES=ON
+LIBRTLSDR_INSTALL_TARGET_OPTS += install-udev-rules
 endif
 
 ifeq ($(BR2_PACKAGE_LIBRTLSDR_DETACH_DRIVER),y)
-LIBRTLSDR_CONF_OPTS += -DDETACH_KERNEL_DRIVER=1
+LIBRTLSDR_CONF_OPTS += --enable-driver-detach
+else
+LIBRTLSDR_CONF_OPTS += --disable-driver-detach
 endif
 
 ifeq ($(BR2_PACKAGE_LIBRTLSDR_ZEROCOPY),y)
-LIBRTLSDR_CONF_OPTS += -DENABLE_ZEROCOPY=ON
+LIBRTLSDR_CONF_OPTS += --enable-zerocopy
 else
-LIBRTLSDR_CONF_OPTS += -DENABLE_ZEROCOPY=OFF
+LIBRTLSDR_CONF_OPTS += --disable-zerocopy
 endif
 
-$(eval $(cmake-package))
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
