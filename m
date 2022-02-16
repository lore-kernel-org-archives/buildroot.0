Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F3AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 19:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A78DB400A6;
	Wed, 16 Feb 2022 19:55:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DSfmO5f6A83x; Wed, 16 Feb 2022 19:55:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 415364014E;
	Wed, 16 Feb 2022 19:55:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4ADE31BF9BA
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 19:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8781400D6
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 19:53:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PpuIafpQHTfb for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 19:53:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9F67403B9
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 19:53:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 500C48359E; Wed, 16 Feb 2022 19:45:59 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 20:49:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fad0f7a096ce29b3626e4ac41e5dbea0ff3e7ae0
X-Git-Newrev: 16ff948444c3978d63f483344a3d92d994c64312
X-Patchwork-Hint: ignore
Message-Id: <20220216194559.500C48359E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ola: reintroduce
 package at version 0.10.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=16ff948444c3978d63f483344a3d92d994c64312
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The ola package (Open Lighting Architecture) version 0.10.2 was
removed in commit e692e1f2b2285c18057e2c70cc1d9d0cfdb15d5e due to an
incompatibility with the protobuf version 3.2.0 present in Buildroot
at that time.

ola was fixed to support newer protobuf version in:
https://github.com/OpenLightingProject/ola/pull/1630

This commit reintroduce this package at version 0.10.8.
For changelogs since its removal at 0.10.2, see:
- https://github.com/OpenLightingProject/ola/releases/tag/0.10.3
- https://github.com/OpenLightingProject/ola/releases/tag/0.10.4
- https://github.com/OpenLightingProject/ola/releases/tag/0.10.5
- https://github.com/OpenLightingProject/ola/releases/tag/0.10.6
- https://github.com/OpenLightingProject/ola/releases/tag/0.10.7
- https://github.com/OpenLightingProject/ola/releases/tag/0.10.8

This commit is based on the previously removed ola package, with the
following rework:
- Remove the dependency on BR2_HOST_GCC_AT_LEAST_4_5 as host gcc is
  now guaranteed to be at least 4.8.
- Update target gcc dependency to >= 4.8 to reflect protobuf
  requirement.
- Remove the BR2_PACKAGE_OLA_SLP option, which was removed in
  ola 0.9.4.
- Change the "DMX4Linux" plugin option name to "Open DMX" to better
  reflect the ola option (DMX4Linux is a legacy plugin for 2.6
  Kernels).
- Update Python support to version 3.x only
- Remove patches, as they are no longer needed
- Add options for ola plugins: ftdidmx, gpio, karate,
  openpixelcontrol, renard, spi, uartdmx, usbdmx
- Reorder options alphabetically
- Update project URL
- Add license hashes

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS            |   1 +
 package/Config.in     |   1 +
 package/ola/Config.in | 171 ++++++++++++++++++++++++++++++++++++++
 package/ola/ola.hash  |   8 ++
 package/ola/ola.mk    | 223 ++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 404 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ac702d8d0f..91e9060ac5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1610,6 +1610,7 @@ F:	configs/zynq_qmtech_defconfig
 F:	package/fluid-soundfont/
 F:	package/fluidsynth/
 F:	package/glslsandbox-player/
+F:	package/ola/
 F:	package/ptm2human/
 F:	package/python-distro/
 F:	package/python-gnupg/
diff --git a/package/Config.in b/package/Config.in
index 10209d84d7..9a8196efe2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -535,6 +535,7 @@ endmenu
 	source "package/nvidia-modprobe/Config.in"
 	source "package/nvme/Config.in"
 	source "package/ofono/Config.in"
+	source "package/ola/Config.in"
 	source "package/on2-8170-modules/Config.in"
 	source "package/open2300/Config.in"
 	source "package/openfpgaloader/Config.in"
diff --git a/package/ola/Config.in b/package/ola/Config.in
new file mode 100644
index 0000000000..36b175138f
--- /dev/null
+++ b/package/ola/Config.in
@@ -0,0 +1,171 @@
+comment "ola needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+
+menuconfig BR2_PACKAGE_OLA
+	bool "ola (open lighting architecture)"
+	depends on BR2_INSTALL_LIBSTDCPP # protobuf
+	depends on !BR2_STATIC_LIBS # protobuf
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
+	select BR2_PACKAGE_PROTOBUF
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  Open Lighting Architecture provides applications
+	  with a mechanism to send and receive DMX512 & RDM
+	  commands using hardware devices and DMX over IP protocols.
+
+	  https://www.openlighting.org/ola/
+
+if BR2_PACKAGE_OLA
+
+comment "bindings and interface"
+
+config BR2_PACKAGE_OLA_WEB
+	bool "http interface"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt, libmicrohttpd
+	select BR2_PACKAGE_LIBMICROHTTPD
+	help
+	  Build OLA with browser interface.
+
+config BR2_PACKAGE_OLA_PYTHON_BINDINGS
+	bool "python bindings"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_PROTOBUF
+	help
+	  Build OLA with support for the Python language.
+
+comment "tests and examples"
+
+config BR2_PACKAGE_OLA_EXAMPLES
+	bool "examples"
+	select BR2_PACKAGE_NCURSES
+	help
+	  Build OLA examples.
+
+config BR2_PACKAGE_OLA_RDM_TESTS
+	bool "rdm tests"
+	depends on BR2_PACKAGE_OLA_PYTHON_BINDINGS
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	select BR2_PACKAGE_PYTHON_NUMPY
+	help
+	  Build OLA RDM tests.
+
+comment "plugin selections"
+
+config BR2_PACKAGE_OLA_PLUGIN_ARTNET
+	bool "artnet"
+	help
+	  Build Artnet plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_DUMMY
+	bool "dummy"
+	help
+	  Build Dummy plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_E131
+	bool "acn E131"
+	help
+	  Build ACN E131 plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_ESPNET
+	bool "espnet"
+	help
+	  Build EspNet plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_FTDIDMX
+	bool "ftdidmx"
+	select BR2_PACKAGE_LIBFTDI1
+	help
+	  Build FTDI USB DMX plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_GPIO
+	bool "GPIO"
+	help
+	  Build GPIO plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_KARATE
+	bool "karate"
+	help
+	  Build Karate plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_KINET
+	bool "kinet"
+	help
+	  Build KiNet plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_MILINT
+	bool "Milford Instruments"
+	help
+	  Build Milford Instruments 1-463 plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_OPENDMX
+	bool "Enttec Open DMX"
+	help
+	  Build Enttec Open DMX plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_OPENPIXELCONTROL
+	bool "Open Pixel Control"
+	help
+	  Build Open Pixel Control (OPC) plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_OSC
+	bool "osc"
+	select BR2_PACKAGE_LIBLO
+	help
+	  Build Open Sound Control (OSC) plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_PATHPORT
+	bool "pathport"
+	help
+	  Build Pathport plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_RENARD
+	bool "renard"
+	help
+	  Build Renard plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_SANDNET
+	bool "sandnet"
+	help
+	  Build SandNet plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_SHOWNET
+	bool "shownet"
+	help
+	  Build ShowNet plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_SPI
+	bool "spi"
+	help
+	  Build SPI plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_STAGEPROFI
+	bool "stageprofi"
+	select BR2_PACKAGE_LIBUSB
+	help
+	  Build StageProfi plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_UARTDMX
+	bool "uartdmx"
+	help
+	  Build UART Native DMX plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_USBDMX
+	bool "usbdmx"
+	select BR2_PACKAGE_LIBUSB
+	help
+	  Build USB DMX plugin for OLA.
+
+config BR2_PACKAGE_OLA_PLUGIN_USBPRO
+	bool "usbpro"
+	select BR2_PACKAGE_LIBUSB
+	help
+	  Build UsbPro plugin for OLA.
+
+endif
diff --git a/package/ola/ola.hash b/package/ola/ola.hash
new file mode 100644
index 0000000000..7565adabde
--- /dev/null
+++ b/package/ola/ola.hash
@@ -0,0 +1,8 @@
+# Locally calculated
+sha256  102aa3114562a2a71dbf7f77d2a0fb9fc47acc35d6248a70b6e831365ca71b13  ola-0.10.8.tar.gz
+
+# License files (locally computed)
+sha256  e6b95dd336a57abb343e2988ac22b7e21b35c5b86003e6eb9e066ffbeeff9da7  COPYING
+sha256  1480a883c87789075ccdead38b8ad9e2d740d6f7eefaaf183f894b50bebd8a25  GPL
+sha256  e6b95dd336a57abb343e2988ac22b7e21b35c5b86003e6eb9e066ffbeeff9da7  LGPL
+sha256  685ceaf368d37250f69f2861e91a4cbbab069e81af8bf50adce8a498936e02fc  LICENCE
diff --git a/package/ola/ola.mk b/package/ola/ola.mk
new file mode 100644
index 0000000000..5090076175
--- /dev/null
+++ b/package/ola/ola.mk
@@ -0,0 +1,223 @@
+################################################################################
+#
+# ola
+#
+################################################################################
+
+OLA_VERSION = 0.10.8
+OLA_SITE = https://github.com/OpenLightingProject/ola/releases/download/$(OLA_VERSION)
+OLA_LICENSE = LGPL-2.1+ (libola, libolacommon, Python bindings), GPL-2.0+ (libolaserver, olad, Python examples and tests)
+OLA_LICENSE_FILES = COPYING GPL LGPL LICENCE
+OLA_INSTALL_STAGING = YES
+OLA_AUTORECONF = YES
+
+# util-linux provides uuid lib
+OLA_DEPENDENCIES = protobuf util-linux host-bison host-flex host-ola
+
+OLA_CONF_OPTS = \
+	ac_cv_have_pymod_google_protobuf=yes \
+	--disable-fatal-warnings \
+	--disable-gcov \
+	--disable-ja-rule \
+	--disable-java-libs \
+	--disable-root-check \
+	--disable-tcmalloc \
+	--disable-unittests \
+	--with-ola-protoc-plugin=$(HOST_DIR)/usr/bin/ola_protoc_plugin
+
+HOST_OLA_DEPENDENCIES = host-util-linux host-protobuf
+
+# When building the host part, disable as much as possible to speed up
+# the configure step and avoid missing host dependencies.
+HOST_OLA_CONF_OPTS = \
+	--disable-all-plugins \
+	--disable-osc \
+	--disable-uart \
+	--disable-libusb \
+	--disable-libftdi \
+	--disable-http \
+	--disable-examples \
+	--disable-unittests \
+	--disable-doxygen-html \
+	--disable-doxygen-doc \
+	--disable-fatal-warnings
+
+# On the host side, we only need ola_protoc_plugin, so build and install this
+# only.
+HOST_OLA_MAKE_OPTS = protoc/ola_protoc_plugin
+define HOST_OLA_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/protoc/ola_protoc_plugin $(HOST_DIR)/usr/bin/ola_protoc_plugin
+endef
+
+# sets where to find python libs built for target and required by ola
+OLA_CONF_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
+OLA_MAKE_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
+
+## OLA Bindings and Interface selections
+
+ifeq ($(BR2_PACKAGE_OLA_WEB),y)
+OLA_CONF_OPTS += --enable-http
+OLA_DEPENDENCIES += libmicrohttpd
+else
+OLA_CONF_OPTS += --disable-http
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PYTHON_BINDINGS),y)
+OLA_CONF_OPTS += --enable-python-libs
+OLA_DEPENDENCIES += python3 python-protobuf
+else
+OLA_CONF_OPTS += --disable-python-libs
+endif
+
+## OLA Examples and Tests
+
+ifeq ($(BR2_PACKAGE_OLA_EXAMPLES),y)
+OLA_CONF_OPTS += --enable-examples
+OLA_DEPENDENCIES += ncurses
+else
+OLA_CONF_OPTS += --disable-examples
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_RDM_TESTS),y)
+OLA_CONF_OPTS += --enable-rdm-tests
+OLA_DEPENDENCIES += python-numpy
+# needed as numpy builds some shared libraries and ola checks for
+# numpy using a host python test program which fails with 'wrong ELF
+# class'.
+OLA_CONF_ENV += ac_cv_have_pymod_numpy=yes
+else
+OLA_CONF_OPTS += --disable-rdm-tests
+endif
+
+## OLA Plugin selections
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_ARTNET),y)
+OLA_CONF_OPTS += --enable-artnet
+else
+OLA_CONF_OPTS += --disable-artnet
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_DUMMY),y)
+OLA_CONF_OPTS += --enable-dummy
+else
+OLA_CONF_OPTS += --disable-dummy
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_E131),y)
+OLA_CONF_OPTS += --enable-e131
+else
+OLA_CONF_OPTS += --disable-e131
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_ESPNET),y)
+OLA_CONF_OPTS += --enable-espnet
+else
+OLA_CONF_OPTS += --disable-espnet
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_FTDIDMX),y)
+OLA_CONF_OPTS += --enable-ftdidmx
+OLA_DEPENDENCIES += libftdi1
+else
+OLA_CONF_OPTS += --disable-ftdidmx
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_GPIO),y)
+OLA_CONF_OPTS += --enable-gpio
+else
+OLA_CONF_OPTS += --disable-gpio
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_KARATE),y)
+OLA_CONF_OPTS += --enable-karate
+else
+OLA_CONF_OPTS += --disable-karate
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_KINET),y)
+OLA_CONF_OPTS += --enable-kinet
+else
+OLA_CONF_OPTS += --disable-kinet
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_MILINT),y)
+OLA_CONF_OPTS += --enable-milinst
+else
+OLA_CONF_OPTS += --disable-milinst
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_OPENDMX),y)
+OLA_CONF_OPTS += --enable-opendmx
+else
+OLA_CONF_OPTS += --disable-opendmx
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_OPENPIXELCONTROL),y)
+OLA_CONF_OPTS += --enable-openpixelcontrol
+else
+OLA_CONF_OPTS += --disable-openpixelcontrol
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_OSC),y)
+OLA_CONF_OPTS += --enable-osc
+OLA_DEPENDENCIES += liblo
+else
+OLA_CONF_OPTS += --disable-osc
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_PATHPORT),y)
+OLA_CONF_OPTS += --enable-pathport
+else
+OLA_CONF_OPTS += --disable-pathport
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_RENARD),y)
+OLA_CONF_OPTS += --enable-renard
+else
+OLA_CONF_OPTS += --disable-renard
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_SANDNET),y)
+OLA_CONF_OPTS += --enable-sandnet
+else
+OLA_CONF_OPTS += --disable-sandnet
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_SHOWNET),y)
+OLA_CONF_OPTS += --enable-shownet
+else
+OLA_CONF_OPTS += --disable-shownet
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_SPI),y)
+OLA_CONF_OPTS += --enable-spi
+else
+OLA_CONF_OPTS += --disable-spi
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_STAGEPROFI),y)
+OLA_CONF_OPTS += --enable-stageprofi --enable-libusb
+else
+OLA_CONF_OPTS += --disable-stageprofi
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_UARTDMX),y)
+OLA_CONF_OPTS += --enable-uartdmx
+else
+OLA_CONF_OPTS += --disable-uartdmx
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_USBDMX),y)
+OLA_CONF_OPTS += --enable-usbdmx --enable-libusb
+else
+OLA_CONF_OPTS += --disable-usbdmx
+endif
+
+ifeq ($(BR2_PACKAGE_OLA_PLUGIN_USBPRO),y)
+OLA_CONF_OPTS += --enable-usbpro --enable-libusb
+else
+OLA_CONF_OPTS += --disable-usbpro
+endif
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
