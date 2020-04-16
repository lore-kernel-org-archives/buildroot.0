From: Lubomir Rintel <lkundrak@v3.sk>
Date: Thu, 16 Apr 2020 11:37:53 +0200
Subject: [Buildroot] [RESEND PATCH v2 2/3] configs,
 board/olpc: add OLPC XO-1 support
In-Reply-To: <20200413220922.5a8b4d6e@windsurf.home>
References: <20191030123909.443536-1-lkundrak@v3.sk>
 <20191030123909.443536-3-lkundrak@v3.sk>
 <20200413220922.5a8b4d6e@windsurf.home>
Message-ID: <20200416093318.GA363383@furthur.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 13, 2020 at 10:09:22PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 30 Oct 2019 13:39:08 +0100
> Lubomir Rintel <lkundrak@v3.sk> wrote:
> 
> > diff --git a/configs/olpc_xo1_defconfig b/configs/olpc_xo1_defconfig
> > new file mode 100644
> > index 0000000000..dfb42b9cea
> > --- /dev/null
> > +++ b/configs/olpc_xo1_defconfig
> > @@ -0,0 +1,80 @@
> > +BR2_x86_geode=y
> > +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> 
> We want a minimal/basic defconfig, so uClibc-based, which is our
> default;
> 
> > +BR2_KERNEL_HEADERS_5_3=y
> > +BR2_TARGET_GENERIC_HOSTNAME="xo.local"
> > +BR2_INIT_SYSTEMD=y
> 
> Please use the default init system in Buildroot, i.e the Busybox init.
> The point of our defconfigs is to provide a minimal Buildroot systems
> that boots on the selected target hardware.
> 
> > +BR2_SYSTEM_BIN_SH_BASH=y
> 
> Ditto, not bash.
> 
> > +# BR2_TARGET_GENERIC_GETTY is not set
> > +BR2_ROOTFS_POST_BUILD_SCRIPT="board/olpc/post-build.sh"
> > +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/olpc/post-image.sh"
> > +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olpc/genimage.cfg"
> > +BR2_LINUX_KERNEL=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.7"
> > +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> > +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olpc/xo-1/linux.config"
> > +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olpc/linux.config"
> > +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> > +BR2_PACKAGE_E2FSPROGS=y
> > +BR2_PACKAGE_E2FSPROGS_DEBUGFS=y
> > +BR2_PACKAGE_E2FSPROGS_E2IMAGE=y
> > +BR2_PACKAGE_E2FSPROGS_E4DEFRAG=y
> > +BR2_PACKAGE_E2FSPROGS_RESIZE2FS=y
> > +BR2_PACKAGE_LINUX_FIRMWARE=y
> > +BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010=y
> > +BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9170=y
> > +BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271=y
> > +BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8=y
> > +BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V9=y
> > +BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8688=y
> > +BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_USB8388_V9=y
> > +BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_USB8388_OLPC=y
> > +BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_USB_THINFIRM=y
> > +BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8787=y
> > +BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8797=y
> > +BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8887=y
> > +BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8897=y
> > +BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7601U=y
> > +BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX=y
> > +BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=y
> > +BR2_PACKAGE_ZD1211_FIRMWARE=y
> > +BR2_PACKAGE_I2C_TOOLS=y
> > +BR2_PACKAGE_LINUXCONSOLETOOLS=y
> > +BR2_PACKAGE_SPI_TOOLS=y
> > +BR2_PACKAGE_UPOWER=y
> > +BR2_PACKAGE_4TH=y
> > +BR2_PACKAGE_DTC=y
> > +BR2_PACKAGE_DTC_PROGRAMS=y
> > +BR2_PACKAGE_NSS_MDNS=y
> > +BR2_PACKAGE_AVAHI=y
> > +# BR2_PACKAGE_AVAHI_AUTOIPD is not set
> > +BR2_PACKAGE_AVAHI_DAEMON=y
> > +# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
> > +BR2_PACKAGE_IPROUTE2=y
> > +BR2_PACKAGE_IW=y
> > +BR2_PACKAGE_NETWORK_MANAGER=y
> > +BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER=y
> > +BR2_PACKAGE_NETWORK_MANAGER_PPPD=y
> > +BR2_PACKAGE_OPENSSH=y
> > +# BR2_PACKAGE_PPPD_OVERWRITE_RESOLV_CONF is not set
> > +BR2_PACKAGE_WPA_SUPPLICANT=y
> > +BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=y
> > +BR2_PACKAGE_WPA_SUPPLICANT_WIFI_DISPLAY=y
> > +BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING=y
> > +BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=y
> > +BR2_PACKAGE_WPA_SUPPLICANT_EAP=y
> > +BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT=y
> > +BR2_PACKAGE_WPA_SUPPLICANT_WPS=y
> > +BR2_PACKAGE_WPA_SUPPLICANT_DBUS=y
> > +BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION=y
> > +BR2_PACKAGE_FILE=y
> > +BR2_PACKAGE_WHICH=y
> > +BR2_PACKAGE_SYSTEMD_LOGIND=y
> > +# BR2_PACKAGE_SYSTEMD_NETWORKD is not set
> > +BR2_PACKAGE_LESS=y
> 
> Please drop all of those packages, except linux-firmware and
> wpa-supplicant. Again, the principle of our defconfigs is to provide a
> minimal Buildroot system.
> 
> > +BR2_TARGET_ROOTFS_EXT2=y
> > +BR2_TARGET_ROOTFS_EXT2_4=y
> > +BR2_TARGET_ROOTFS_EXT2_LABEL="XO1"
> > +BR2_TARGET_ROOTFS_EXT2_SIZE="96M"
> > +BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O dir_index,^huge_file,^64bit,^extent"
> 
> Why do you need these options? Your bootloader has some limitations?

Yes, precisely -- these options are not supported by the Open Firmware's
ext4 implementation.

I won't be responding to the other points you raised because I
essentially ended up just doing what you've suggested or removed the
bits in question.

I'll be following up with v3 shortly.

Thank you
Lubo

> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
