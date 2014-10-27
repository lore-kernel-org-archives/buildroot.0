From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon, 27 Oct 2014 09:25:28 +0100
Subject: [Buildroot] [PATCH 1/1] package: indentation cleanup
Message-ID: <1414398328-1646-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/gdb/Config.in                |    2 +-
 package/gpm/gpm.mk                   |    4 +-
 package/gptfdisk/Config.in           |    2 +-
 package/gptfdisk/gptfdisk.mk         |    2 +-
 package/jquery-ui-themes/Config.in   |   48 ++++++++++-----------
 package/libcap/libcap.mk             |    2 +-
 package/libglade/libglade.mk         |    2 +-
 package/libgtk3/Config.in            |    2 +-
 package/libnss/libnss.mk             |   18 ++++----
 package/libplayer/Config.in          |    2 +-
 package/libuv/libuv.mk               |    2 +-
 package/luajit/Config.in             |    2 +-
 package/mplayer/Config.in            |    4 +-
 package/ndisc6/ndisc6.mk             |    6 +--
 package/nss-mdns/nss-mdns.mk         |    2 +-
 package/numactl/Config.in            |    4 +-
 package/pkg-luarocks.mk              |    4 +-
 package/pulseaudio/pulseaudio.mk     |    4 +-
 package/qemu/qemu.mk                 |   78 +++++++++++++++++-----------------
 package/rpi-userland/rpi-userland.mk |    2 +-
 package/spice/spice.mk               |    2 +-
 package/strace/Config.in             |    4 +-
 package/tcl/tcl.mk                   |   26 ++++++------
 package/tinyalsa/tinyalsa.mk         |    6 +--
 package/tvheadend/tvheadend.mk       |   20 ++++-----
 package/tz/tz.mk                     |   18 ++++----
 package/uclibc/uclibc.mk             |    2 +-
 package/upx/upx.mk                   |    4 +-
 package/wayland/wayland.mk           |    6 +--
 package/webkit/webkit.mk             |    2 +-
 package/x11r7/xcb-proto/xcb-proto.mk |    2 +-
 package/xenomai/Config.in            |    2 +-
 32 files changed, 143 insertions(+), 143 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index a96df1e..b211878 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_GDB
 	# target, we don't allow building a separate gdbserver. The
 	# one from the external toolchain should be used.
 	select BR2_PACKAGE_GDB_SERVER if \
-	       (!BR2_PACKAGE_GDB_DEBUGGER && !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)
+		(!BR2_PACKAGE_GDB_DEBUGGER && !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)
 	depends on BR2_TOOLCHAIN_HAS_THREADS && BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	depends on !BR2_nios2
 	help
diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
index 7a44b09..dcf075a 100644
--- a/package/gpm/gpm.mk
+++ b/package/gpm/gpm.mk
@@ -53,8 +53,8 @@ GPM_POST_PATCH_HOOKS += GPM_DISABLE_DOC_INSTALL
 ifeq ($(BR2_PACKAGE_GPM_INSTALL_TEST_TOOLS),)
 define GPM_REMOVE_TEST_TOOLS_FROM_TARGET
 	for tools in mev hltest mouse-test display-buttons \
-			get-versions display-coords; do \
-		rm -f $(TARGET_DIR)/usr/bin/$$tools ; \
+		get-versions display-coords; do \
+			rm -f $(TARGET_DIR)/usr/bin/$$tools ; \
 	done
 endef
 GPM_POST_INSTALL_TARGET_HOOKS += GPM_REMOVE_TEST_TOOLS_FROM_TARGET
diff --git a/package/gptfdisk/Config.in b/package/gptfdisk/Config.in
index ae90fa9..d16781f 100644
--- a/package/gptfdisk/Config.in
+++ b/package/gptfdisk/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_GPTFDISK
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_GPTFDISK_GDISK if \
-	       !(BR2_PACKAGE_GPTFDISK_SGDISK || BR2_PACKAGE_GPTFDISK_CGDISK)
+		!(BR2_PACKAGE_GPTFDISK_SGDISK || BR2_PACKAGE_GPTFDISK_CGDISK)
 	help
 	  GPT fdisk (consisting of the gdisk and sgdisk programs) is a
 	  text-mode partitioning tool that works on Globally Unique Identifier
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index f6e9ecd..9828d4c 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -33,7 +33,7 @@ endef
 
 define GPTFDISK_INSTALL_TARGET_CMDS
 	for i in $(GPTFDISK_TARGETS_y); do \
-	    $(INSTALL) -D -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/sbin/$$i; \
+		$(INSTALL) -D -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/sbin/$$i; \
 	done
 endef
 
diff --git a/package/jquery-ui-themes/Config.in b/package/jquery-ui-themes/Config.in
index 5168f37..bea1a43 100644
--- a/package/jquery-ui-themes/Config.in
+++ b/package/jquery-ui-themes/Config.in
@@ -14,76 +14,76 @@ choice
 	  Specify the jQuery UI theme to install.
 
 	config BR2_PACKAGE_JQUERY_UI_THEME_BLACK_TIE
-	       bool "black-tie"
+		bool "black-tie"
 
 	config BR2_PACKAGE_JQUERY_UI_THEME_BLITZER
-	       bool "blitzer"
+		bool "blitzer"
 
 	config BR2_PACKAGE_JQUERY_UI_THEME_CUPERTINO
-	       bool "cupertino"
+		bool "cupertino"
 
 	config BR2_PACKAGE_JQUERY_UI_THEME_DARK_HIVE
-	       bool "dark-hive"
+		bool "dark-hive"
 
 	config BR2_PACKAGE_JQUERY_UI_THEME_DOT_LUV
-	       bool "dot-luv"
+		bool "dot-luv"
 
 	config BR2_PACKAGE_JQUERY_UI_THEME_EGGPLANT
-	       bool "eggplant"
+		bool "eggplant"
 
 	config BR2_PACKAGE_JQUERY_UI_THEME_EXCITE_BIKE
-	       bool "excite-bike"
+		bool "excite-bike"
 
 	config BR2_PACKAGE_JQUERY_UI_THEME_FLICK
-	       bool "flick"
+		bool "flick"
 
 	config BR2_PACKAGE_JQUERY_UI_THEME_HOT_SNEAKS
-	       bool "hot-sneaks"
+		bool "hot-sneaks"
 
 	config BR2_PACKAGE_JQUERY_UI_THEME_HUMANITY
-	       bool "humanity"
+		bool "humanity"
 
 	config BR2_PACKAGE_JQUERY_UI_THEME_LE_FROG
-	       bool "le-frog"
+		bool "le-frog"
 
 	config BR2_PACKAGE_JQUERY_UI_THEME_MINT_CHOC
-	       bool "mint-choc"
+		bool "mint-choc"
 
 	config BR2_PACKAGE_JQUERY_UI_THEME_OVERCAST
-	       bool "overcast"
+		bool "overcast"
 
 	config BR2_PACKAGE_JQUERY_UI_THEME_PEPPER_GRINDER
-	       bool "pepper-grinder"
+		bool "pepper-grinder"
 
 	config BR2_PACKAGE_JQUERY_UI_THEME_REDMOND
-	       bool "redmond"
+		bool "redmond"
 
 	config BR2_PACKAGE_JQUERY_UI_THEME_SMOOTHNESS
-	       bool "smoothness"
+		bool "smoothness"
 
 	config BR2_PACKAGE_JQUERY_UI_THEME_SOUTH_STREET
-	       bool "south-street"
+		bool "south-street"
 
 	config BR2_PACKAGE_JQUERY_UI_THEME_START
-	       bool "start"
+		bool "start"
 
 	config BR2_PACKAGE_JQUERY_UI_THEME_SUNNY
-	       bool "sunny"
+		bool "sunny"
 
 	config BR2_PACKAGE_JQUERY_UI_THEME_SWANKY_PURSE
-	       bool "swanky-purse"
+		bool "swanky-purse"
 
 	config BR2_PACKAGE_JQUERY_UI_THEME_TRONTASTIC
-	       bool "trontastic"
+		bool "trontastic"
 
 	config BR2_PACKAGE_JQUERY_UI_THEME_UI_DARKNESS
-	       bool "ui-darkness"
+		bool "ui-darkness"
 
 	config BR2_PACKAGE_JQUERY_UI_THEME_UI_LIGHTNESS
-	       bool "ui-lightness"
+		bool "ui-lightness"
 
 	config BR2_PACKAGE_JQUERY_UI_THEME_VADER
-	       bool "vader"
+		bool "vader"
 
 endchoice
 
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 43c3e7e..42bd19a 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -39,7 +39,7 @@ LIBCAP_MAKE_FLAGS = \
 ifeq ($(BR2_PACKAGE_LIBCAP_TOOLS),y)
 define LIBCAP_BUILD_TOOLS_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/progs \
-		 $(LIBCAP_MAKE_FLAGS)
+		$(LIBCAP_MAKE_FLAGS)
 endef
 
 define LIBCAP_INSTALL_TOOLS_CMDS
diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
index 7bec938..a6eea09 100644
--- a/package/libglade/libglade.mk
+++ b/package/libglade/libglade.mk
@@ -15,7 +15,7 @@ LIBGLADE_LICENSE_FILES = COPYING
 
 define LIBGLADE_INSTALL_FIX
 	rm -rf $(TARGET_DIR)/usr/share/xml/libglade \
-	       $(TARGET_DIR)/usr/bin/libglade-convert
+		$(TARGET_DIR)/usr/bin/libglade-convert
 endef
 
 LIBGLADE_POST_INSTALL_TARGET_HOOKS += LIBGLADE_INSTALL_FIX
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 07e44f7..cdc3b2d 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_LIBGTK3
 	select BR2_PACKAGE_GDK_PIXBUF
 	# atleast 1 backend must be enabled
 	select BR2_PACKAGE_LIBGTK3_BROADWAY if \
-	       !(BR2_PACKAGE_LIBGTK3_X11 || BR2_PACKAGE_LIBGTK3_WAYLAND)
+		!(BR2_PACKAGE_LIBGTK3_X11 || BR2_PACKAGE_LIBGTK3_WAYLAND)
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index e7b92e4..4e174f6 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -39,16 +39,16 @@ endif
 
 define LIBNSS_BUILD_CMDS
 	$(MAKE1) -C $(@D)/nss coreconf \
-			SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
-			DIST=$(@D)/$(LIBNSS_DISTDIR) \
-			CHECKLOC= \
-			$(LIBNSS_BUILD_VARS)
+		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
+		DIST=$(@D)/$(LIBNSS_DISTDIR) \
+		CHECKLOC= \
+		$(LIBNSS_BUILD_VARS)
 	$(MAKE1) -C $(@D)/nss lib/dbm all \
-			SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
-			DIST=$(@D)/$(LIBNSS_DISTDIR) \
-			CHECKLOC= \
-			$(LIBNSS_BUILD_VARS) TARGET_OPTIMIZER="$(TARGET_CFLAGS)" \
-			NATIVE_FLAGS="$(HOST_CFLAGS)"
+		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
+		DIST=$(@D)/$(LIBNSS_DISTDIR) \
+		CHECKLOC= \
+		$(LIBNSS_BUILD_VARS) TARGET_OPTIMIZER="$(TARGET_CFLAGS)" \
+		NATIVE_FLAGS="$(HOST_CFLAGS)"
 endef
 
 define LIBNSS_INSTALL_STAGING_CMDS
diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index 703b96d..603bae8 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_LIBPLAYER_MPLAYER
 	bool "mplayer backend"
 	# mplayer
 	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb || \
-		   BR2_microblaze || BR2_aarch64 || BR2_nios2)
+		BR2_microblaze || BR2_aarch64 || BR2_nios2)
 	# mplayer
 	depends on BR2_LARGEFILE
 	# mplayer
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 986acee..2fe8035 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -20,7 +20,7 @@ LIBUV_LICENSE_FILES = LICENSE
 # 1.14, so we need it.
 define LIBUV_FIXUP_AUTOGEN
 	echo "m4_define([UV_EXTRA_AUTOMAKE_FLAGS], [serial-tests])" \
-	        >$(@D)/m4/libuv-extra-automake-flags.m4
+		>$(@D)/m4/libuv-extra-automake-flags.m4
 endef
 LIBUV_POST_PATCH_HOOKS += LIBUV_FIXUP_AUTOGEN
 
diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 57c9e2d..c505f6a 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LUAJIT
 	# Luajit is only available for some target architectures, and
 	# has some complexity wrt 32/64. See luajit.mk for details.
 	depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64') || BR2_powerpc || BR2_arm || BR2_armeb \
-		   || ((BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT)
+		|| ((BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT)
 	# luajit.mk uses the "-m32" compiler option to build 32bit
 	# binaries, so check if that option is supported. See
 	# luajit.mk for details.
diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index 8b5d05e..978eefe 100644
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_MPLAYER
 	bool "mplayer"
 	# Those architectures are not supported by MPlayer
 	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
-			|| BR2_microblaze || BR2_aarch64 || BR2_nios2)
+		|| BR2_microblaze || BR2_aarch64 || BR2_nios2)
 	# Broken support for <ARMv5
 	depends on !(BR2_arm920t || BR2_arm920t || BR2_arm922t || BR2_fa526 \
 		|| BR2_strongarm)
@@ -30,5 +30,5 @@ endif
 
 comment "mplayer needs a toolchain w/ largefile"
 	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
-			|| BR2_microblaze || BR2_aarch64 || BR2_nios2)
+		|| BR2_microblaze || BR2_aarch64 || BR2_nios2)
 	depends on !BR2_LARGEFILE
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index ef48cd2..b0e4caf 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -32,9 +32,9 @@ NDISC6_MAN8_ = $(addsuffix .8,$(NDISC6_SBIN_))
 
 define NDISC6_REMOVE_UNNEEDED
 	rm -rf $(addprefix $(TARGET_DIR)/usr/bin/,$(NDISC6_BIN_)) \
-	       $(addprefix $(TARGET_DIR)/usr/sbin/,$(NDISC6_SBIN_)) \
-	       $(addprefix $(TARGET_DIR)/usr/share/man/man1/,$(NDISC6_MAN1_)) \
-	       $(addprefix $(TARGET_DIR)/usr/share/man/man8/,$(NDISC6_MAN8_))
+		$(addprefix $(TARGET_DIR)/usr/sbin/,$(NDISC6_SBIN_)) \
+		$(addprefix $(TARGET_DIR)/usr/share/man/man1/,$(NDISC6_MAN1_)) \
+		$(addprefix $(TARGET_DIR)/usr/share/man/man8/,$(NDISC6_MAN8_))
 	$(if $(BR2_PACKAGE_NDISC6_RDNSSD),,\
 		rm -rf $(TARGET_DIR)/etc/rdnssd $(TARGET_DIR)/var/run/rdnssd)
 endef
diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
index 8d23f89..67ae0a1 100644
--- a/package/nss-mdns/nss-mdns.mk
+++ b/package/nss-mdns/nss-mdns.mk
@@ -11,7 +11,7 @@ NSS_MDNS_LICENSE_FILES = LICENSE
 
 define NSS_MDNS_INSTALL_CONFIG
 	sed -r -i -e 's/^(hosts:[[:space:]]+).*/\1files mdns4_minimal [NOTFOUND=return] dns mdns4/' \
-	    $(TARGET_DIR)/etc/nsswitch.conf
+		$(TARGET_DIR)/etc/nsswitch.conf
 endef
 
 NSS_MDNS_POST_INSTALL_TARGET_HOOKS += NSS_MDNS_INSTALL_CONFIG
diff --git a/package/numactl/Config.in b/package/numactl/Config.in
index 0976de2..b383f69 100644
--- a/package/numactl/Config.in
+++ b/package/numactl/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_NUMACTL
 	# architectures.
 	depends on BR2_LARGEFILE
 	depends on BR2_i386 || BR2_mips || BR2_mipsel || \
-		   BR2_mips64 || BR2_mips64el || BR2_powerpc || BR2_x86_64
+		BR2_mips64 || BR2_mips64el || BR2_powerpc || BR2_x86_64
 	help
 	  numactl allows you to run your application on specific cpus
 	  and memory nodes. It does this by supplying a NUMA memory
@@ -14,5 +14,5 @@ config BR2_PACKAGE_NUMACTL
 
 comment "numactl needs a toolchain w/ largefile"
 	depends on BR2_i386 || BR2_mips || BR2_mipsel || \
-		   BR2_mips64 || BR2_mips64el || BR2_powerpc || BR2_x86_64
+		BR2_mips64 || BR2_mips64el || BR2_powerpc || BR2_x86_64
 	depends on !BR2_LARGEFILE
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index f0fb73d..83f338e 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -49,7 +49,7 @@ $(2)_DEPENDENCIES	+= host-luarocks luainterpreter
 ifndef $(2)_EXTRACT_CMDS
 define $(2)_EXTRACT_CMDS
 	cd $$($(2)_DIR)/.. && \
-	 $$(LUAROCKS_RUN) unpack --force $$(DL_DIR)/$$($(2)_SOURCE)
+		$$(LUAROCKS_RUN) unpack --force $$(DL_DIR)/$$($(2)_SOURCE)
 endef
 endif
 
@@ -59,7 +59,7 @@ endif
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	cd $$($(2)_SRCDIR) && \
-	 $$(LUAROCKS_RUN) make --keep $$($(2)_ROCKSPEC) $$($(2)_BUILD_OPTS)
+		$$(LUAROCKS_RUN) make --keep $$($(2)_ROCKSPEC) $$($(2)_BUILD_OPTS)
 endef
 endif
 
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index d24dcc8..e68ca68 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -96,9 +96,9 @@ PULSEAUDIO_DEPENDENCIES += libxcb xlib_libSM xlib_libXtst
 ifneq ($(BR2_ENABLE_LOCALE),y)
 define PULSEAUDIO_FIXUP_DESKTOP_FILES
 	cp $(@D)/src/daemon/pulseaudio.desktop.in \
-	   $(@D)/src/daemon/pulseaudio.desktop
+		$(@D)/src/daemon/pulseaudio.desktop
 	cp $(@D)/src/daemon/pulseaudio-kde.desktop.in \
-	   $(@D)/src/daemon/pulseaudio-kde.desktop
+		$(@D)/src/daemon/pulseaudio-kde.desktop
 endef
 PULSEAUDIO_POST_PATCH_HOOKS += PULSEAUDIO_FIXUP_DESKTOP_FILES
 endif
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 2495674..4b8f0f4 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -124,45 +124,45 @@ QEMU_OPTS += --disable-sdl
 endif
 
 define QEMU_CONFIGURE_CMDS
-	( cd $(@D);                                 \
-	    LIBS='$(QEMU_LIBS)'                     \
-	    $(TARGET_CONFIGURE_OPTS)                \
-	    $(TARGET_CONFIGURE_ARGS)                \
-	    $(QEMU_VARS)                            \
-	    ./configure                             \
-	        --prefix=/usr                       \
-	        --cross-prefix=$(TARGET_CROSS)      \
-	        --with-system-pixman                \
-	        --audio-drv-list=                   \
-	        --enable-kvm                        \
-	        --enable-attr                       \
-	        --enable-vhost-net                  \
-	        --disable-bsd-user                  \
-	        --disable-xen                       \
-	        --disable-slirp                     \
-	        --disable-vnc                       \
-	        --disable-virtfs                    \
-	        --disable-brlapi                    \
-	        --disable-curses                    \
-	        --disable-curl                      \
-	        --disable-fdt                       \
-	        --disable-bluez                     \
-	        --disable-guest-base                \
-	        --disable-uuid                      \
-	        --disable-vde                       \
-	        --disable-linux-aio                 \
-	        --disable-cap-ng                    \
-	        --disable-docs                      \
-	        --disable-spice                     \
-	        --disable-rbd                       \
-	        --disable-libiscsi                  \
-	        --disable-usb-redir                 \
-	        --disable-smartcard-nss             \
-	        --disable-strip                     \
-	        --disable-seccomp                   \
-	        --disable-sparse                    \
-	        --disable-tools                     \
-	        $(QEMU_OPTS)                        \
+	( cd $(@D);                                     \
+		LIBS='$(QEMU_LIBS)'                     \
+		$(TARGET_CONFIGURE_OPTS)                \
+		$(TARGET_CONFIGURE_ARGS)                \
+		$(QEMU_VARS)                            \
+		./configure                             \
+			--prefix=/usr                   \
+			--cross-prefix=$(TARGET_CROSS)  \
+			--with-system-pixman            \
+			--audio-drv-list=               \
+			--enable-kvm                    \
+			--enable-attr                   \
+			--enable-vhost-net              \
+			--disable-bsd-user              \
+			--disable-xen                   \
+			--disable-slirp                 \
+			--disable-vnc                   \
+			--disable-virtfs                \
+			--disable-brlapi                \
+			--disable-curses                \
+			--disable-curl                  \
+			--disable-fdt                   \
+			--disable-bluez                 \
+			--disable-guest-base            \
+			--disable-uuid                  \
+			--disable-vde                   \
+			--disable-linux-aio             \
+			--disable-cap-ng                \
+			--disable-docs                  \
+			--disable-spice                 \
+			--disable-rbd                   \
+			--disable-libiscsi              \
+			--disable-usb-redir             \
+			--disable-smartcard-nss         \
+			--disable-strip                 \
+			--disable-seccomp               \
+			--disable-sparse                \
+			--disable-tools                 \
+			$(QEMU_OPTS)                    \
 	)
 endef
 
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index feac277..3f92950 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -17,7 +17,7 @@ RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
 ifeq ($(BR2_PACKAGE_RPI_USERLAND_START_VCFILED),y)
 define RPI_USERLAND_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/rpi-userland/S94vcfiled \
-			$(TARGET_DIR)/etc/init.d/S94vcfiled
+		$(TARGET_DIR)/etc/init.d/S94vcfiled
 endef
 endif
 
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index be46493..a31d78d 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -58,7 +58,7 @@ SPICE_MAKE_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/
 # libjpeg isn't, hence the two-line tweak
 define SPICE_POST_INSTALL_STAGING_FIX_PC
 	$(SED) 's/^\(Requires.private:.*\)$$/\1 zlib/; s/^\(Libs.private:.*\)$$/\1 -ljpeg/;'    \
-	       "$(STAGING_DIR)/usr/lib/pkgconfig/spice-server.pc"
+		"$(STAGING_DIR)/usr/lib/pkgconfig/spice-server.pc"
 endef
 SPICE_POST_INSTALL_STAGING_HOOKS += SPICE_POST_INSTALL_STAGING_FIX_PC
 
diff --git a/package/strace/Config.in b/package/strace/Config.in
index bc521e0..07667ed 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_STRACE
 	bool "strace"
 	depends on !BR2_nios2
 	depends on !((BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) \
-	             && BR2_TOOLCHAIN_USES_UCLIBC)
+		&& BR2_TOOLCHAIN_USES_UCLIBC)
 	depends on BR2_LARGEFILE
 	help
 	  A useful diagnostic, instructional, and debugging tool.
@@ -16,4 +16,4 @@ comment "strace needs a toolchain w/ largefile"
 
 comment "strace is not supported on MIPS using a uClibc toolchain"
 	depends on (BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) && \
-	           BR2_TOOLCHAIN_USES_UCLIBC
+		BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 7ca51c5..a242760 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -33,20 +33,20 @@ HOST_TCL_CONF_OPTS = \
 # or configure without just removing the entire pkg directory.
 define HOST_TCL_REMOVE_PACKAGES
 	rm -fr $(@D)/pkgs/sqlite3.8.0 \
-	       $(@D)/pkgs/tdbc1.0.0 \
-	       $(@D)/pkgs/tdbcmysql1.0.0 \
-	       $(@D)/pkgs/tdbcodbc1.0.0 \
-	       $(@D)/pkgs/tdbcpostgres1.0.0 \
-	       $(@D)/pkgs/tdbcsqlite3-1.0.0
+		$(@D)/pkgs/tdbc1.0.0 \
+		$(@D)/pkgs/tdbcmysql1.0.0 \
+		$(@D)/pkgs/tdbcodbc1.0.0 \
+		$(@D)/pkgs/tdbcpostgres1.0.0 \
+		$(@D)/pkgs/tdbcsqlite3-1.0.0
 endef
 HOST_TCL_PRE_CONFIGURE_HOOKS += HOST_TCL_REMOVE_PACKAGES
 define TCL_REMOVE_PACKAGES
 	rm -fr $(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/sqlite3.8.0) \
-	       $(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbc1.0.0) \
-	       $(@D)/pkgs/tdbcmysql1.0.0 \
-	       $(@D)/pkgs/tdbcodbc1.0.0 \
-	       $(@D)/pkgs/tdbcpostgres1.0.0 \
-	       $(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbcsqlite3-1.0.0)
+		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbc1.0.0) \
+		$(@D)/pkgs/tdbcmysql1.0.0 \
+		$(@D)/pkgs/tdbcodbc1.0.0 \
+		$(@D)/pkgs/tdbcpostgres1.0.0 \
+		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbcsqlite3-1.0.0)
 endef
 TCL_PRE_CONFIGURE_HOOKS += TCL_REMOVE_PACKAGES
 
@@ -75,9 +75,9 @@ endif
 # configured whitelist.
 define TCL_REMOVE_EXTRA
 	rm -fr $(TARGET_DIR)/usr/lib/tclConfig.sh \
-	       $(TARGET_DIR)/usr/lib/tclooConfig.sh \
-	       $(TARGET_DIR)/usr/lib/tcl$(TCL_VERSION_MAJOR)/tclAppInit.c \
-	       $(TARGET_DIR)/usr/lib/tcl$(TCL_VERSION_MAJOR)/msgs
+		$(TARGET_DIR)/usr/lib/tclooConfig.sh \
+		$(TARGET_DIR)/usr/lib/tcl$(TCL_VERSION_MAJOR)/tclAppInit.c \
+		$(TARGET_DIR)/usr/lib/tcl$(TCL_VERSION_MAJOR)/msgs
 endef
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_EXTRA
 
diff --git a/package/tinyalsa/tinyalsa.mk b/package/tinyalsa/tinyalsa.mk
index 48288f1..a3dcc9a 100644
--- a/package/tinyalsa/tinyalsa.mk
+++ b/package/tinyalsa/tinyalsa.mk
@@ -15,14 +15,14 @@ endef
 
 define TINYALSA_INSTALL_STAGING_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/libtinyalsa.so \
-			$(STAGING_DIR)/usr/lib/libtinyalsa.so
+		$(STAGING_DIR)/usr/lib/libtinyalsa.so
 	$(INSTALL) -D -m 0644 $(@D)/include/tinyalsa/asoundlib.h \
-			$(STAGING_DIR)/usr/include/tinyalsa/asoundlib.h
+		$(STAGING_DIR)/usr/include/tinyalsa/asoundlib.h
 endef
 
 define TINYALSA_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/libtinyalsa.so \
-			$(TARGET_DIR)/usr/lib/libtinyalsa.so
+		$(TARGET_DIR)/usr/lib/libtinyalsa.so
 	$(INSTALL) -D -m 0755 $(@D)/tinyplay $(TARGET_DIR)/usr/bin/tinyplay
 	$(INSTALL) -D -m 0755 $(@D)/tinycap $(TARGET_DIR)/usr/bin/tinycap
 	$(INSTALL) -D -m 0755 $(@D)/tinymix $(TARGET_DIR)/usr/bin/tinymix
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 1445838..b26e68b 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -21,15 +21,15 @@ endif
 TVHEADEND_DEPENDENCIES += dtv-scan-tables
 
 define TVHEADEND_CONFIGURE_CMDS
-	(cd $(@D);				\
-	 $(TARGET_CONFIGURE_OPTS)		\
-	 $(TARGET_CONFIGURE_ARGS)		\
-	 ./configure				\
-	 --prefix=/usr				\
-	 --arch="$(ARCH)"			\
-	 --cpu="$(BR2_GCC_TARGET_CPU)"		\
-	 --python="$(HOST_DIR)/usr/bin/python"	\
-	 --disable-dvbscan			\
+	(cd $(@D);						\
+		$(TARGET_CONFIGURE_OPTS)			\
+		$(TARGET_CONFIGURE_ARGS)			\
+		./configure					\
+			--prefix=/usr				\
+			--arch="$(ARCH)"			\
+			--cpu="$(BR2_GCC_TARGET_CPU)"		\
+			--python="$(HOST_DIR)/usr/bin/python"	\
+			--disable-dvbscan			\
 	)
 endef
 
@@ -48,7 +48,7 @@ endef
 #  - a non-root user to run as
 define TVHEADEND_INSTALL_DB
 	$(INSTALL) -D -m 0600 package/tvheadend/accesscontrol.1     \
-	              $(TARGET_DIR)/home/tvheadend/.hts/tvheadend/accesscontrol/1
+		$(TARGET_DIR)/home/tvheadend/.hts/tvheadend/accesscontrol/1
 	chmod -R go-rwx $(TARGET_DIR)/home/tvheadend
 endef
 TVHEADEND_POST_INSTALL_TARGET_HOOKS = TVHEADEND_INSTALL_DB
diff --git a/package/tz/tz.mk b/package/tz/tz.mk
index 770cc46..349d73f 100644
--- a/package/tz/tz.mk
+++ b/package/tz/tz.mk
@@ -21,19 +21,19 @@ endef
 
 define TZ_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0644 $(HOST_DIR)/usr/share/zoneinfo/zone.tab \
-			      $(TARGET_DIR)/usr/share/zoneinfo/zone.tab
+		$(TARGET_DIR)/usr/share/zoneinfo/zone.tab
 	$(INSTALL) -D -m 0644 $(HOST_DIR)/usr/share/zoneinfo/iso3166.tab \
-			      $(TARGET_DIR)/usr/share/zoneinfo/iso3166.tab
+		$(TARGET_DIR)/usr/share/zoneinfo/iso3166.tab
 	mkdir -p $(TARGET_DIR)/usr/share/zoneinfo/uclibc
 	cp -a $(@D)/output/* $(TARGET_DIR)/usr/share/zoneinfo/uclibc
 	if [ -n "$(TZ_LOCALTIME)" ]; then                               \
-	    if [ ! -f $(TARGET_DIR)/usr/share/zoneinfo/uclibc/$(TZDATA_LOCALTIME) ]; then \
-	        printf "Error: '%s' is not a valid timezone, check your BR2_TARGET_LOCALTIME setting\n" \
-	               "$(TZDATA_LOCALTIME)";                           \
-	        exit 1;                                                 \
-	    fi;                                                         \
-	    cd $(TARGET_DIR)/etc;                                       \
-	    ln -sf ../usr/share/zoneinfo/uclibc/$(TZDATA_LOCALTIME) TZ; \
+		if [ ! -f $(TARGET_DIR)/usr/share/zoneinfo/uclibc/$(TZDATA_LOCALTIME) ]; then \
+			printf "Error: '%s' is not a valid timezone, check your BR2_TARGET_LOCALTIME setting\n" \
+			"$(TZDATA_LOCALTIME)";                              \
+			exit 1;                                             \
+		fi;                                                         \
+		cd $(TARGET_DIR)/etc;                                       \
+		ln -sf ../usr/share/zoneinfo/uclibc/$(TZDATA_LOCALTIME) TZ; \
 	fi
 endef
 
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index b2ecce3..f2042dd 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -121,7 +121,7 @@ ifeq ($(UCLIBC_TARGET_ARCH),sparc)
 UCLIBC_SPARC_TYPE = CONFIG_SPARC_$(call qstrip,$(BR2_UCLIBC_SPARC_TYPE))
 define UCLIBC_SPARC_TYPE_CONFIG
 	$(SED) 's/^\(CONFIG_[^_]*[_]*SPARC[^=]*\)=.*/# \1 is not set/g' \
-		 $(@D)/.config
+		$(@D)/.config
 	$(call KCONFIG_ENABLE_OPT,$(UCLIBC_SPARC_TYPE),$(@D)/.config)
 endef
 endif # sparc
diff --git a/package/upx/upx.mk b/package/upx/upx.mk
index 878d145..30bb03b 100644
--- a/package/upx/upx.mk
+++ b/package/upx/upx.mk
@@ -16,8 +16,8 @@ HOST_UPX_DEPENDENCIES = host-ucl
 # stating to "please choose a target for 'make'"... :-(
 define HOST_UPX_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) CPPFLAGS="$(HOST_CPPFLAGS)" \
-	    LDFLAGS="$(HOST_LDFLAGS)" UPX_UCLDIR=$(HOST_DIR)/usr \
-	    -C $(@D) all
+		LDFLAGS="$(HOST_LDFLAGS)" UPX_UCLDIR=$(HOST_DIR)/usr \
+		-C $(@D) all
 endef
 
 # UPX has no install procedure, so install it manually.
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 5869110..740faed 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -20,10 +20,10 @@ WAYLAND_CONF_OPTS = --disable-scanner
 # which we vampirise and adapt from the host-wayland copy
 define WAYLAND_SCANNER_PC
 	$(INSTALL) -m 0644 -D $(HOST_DIR)/usr/lib/pkgconfig/wayland-scanner.pc \
-	              $(STAGING_DIR)/usr/lib/pkgconfig/wayland-scanner.pc
+		$(STAGING_DIR)/usr/lib/pkgconfig/wayland-scanner.pc
 	$(SED) 's:^prefix=.*:prefix=/usr:' \
-	    -e 's:^wayland_scanner=.*:wayland_scanner=$(HOST_DIR)/usr/bin/wayland-scanner:' \
-	    $(STAGING_DIR)/usr/lib/pkgconfig/wayland-scanner.pc
+		-e 's:^wayland_scanner=.*:wayland_scanner=$(HOST_DIR)/usr/bin/wayland-scanner:' \
+		$(STAGING_DIR)/usr/lib/pkgconfig/wayland-scanner.pc
 endef
 WAYLAND_POST_INSTALL_STAGING_HOOKS += WAYLAND_SCANNER_PC
 
diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 77b533a..fae2e7e 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -27,7 +27,7 @@ WEBKIT_INSTALL_TARGET_OPTS = -j1 DESTDIR=$(TARGET_DIR) install
 # in newer releases
 define DISABLE_INDEXED_DATABASE
 	$(SED) '/ENABLE_INDEXED_DATABASE/s:1:0:' \
-			$(@D)/Source/WebCore/GNUmakefile.features.am
+		$(@D)/Source/WebCore/GNUmakefile.features.am
 endef
 
 WEBKIT_PRE_CONFIGURE_HOOKS += DISABLE_INDEXED_DATABASE
diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index 3cd1b18..931573a 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -18,7 +18,7 @@ XCB_PROTO_DEPENDENCIES = host-python
 # xml / python files, so ensure these expand to their full (host) paths
 define XCB_PROTO_FIXUP_PC_FILE
 	$(SED) 's|^\(xcbincludedir=\)|\1$(STAGING_DIR)|' \
-	    -e 's|^\(pythondir=\)|\1$(STAGING_DIR)|' \
+		-e 's|^\(pythondir=\)|\1$(STAGING_DIR)|' \
 		$(STAGING_DIR)/usr/lib/pkgconfig/xcb-proto.pc
 endef
 
diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 02b6d0f..46322a0 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_XENOMAI
 	bool "Xenomai Userspace"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || \
-		   BR2_bfin || BR2_powerpc || BR2_sh4
+		BR2_bfin || BR2_powerpc || BR2_sh4
 	help
 	  Real-Time Framework for Linux
 	  http://www.xenomai.org
-- 
1.7.9.5
