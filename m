From: Luca Ellero <luca.ellero@brickedbrain.com>
Date: Thu, 5 May 2016 16:19:29 +0200
Subject: [Buildroot] Xorg crash
Message-ID: <1274ad69-0abb-26b0-b623-67de78c0274f@brickedbrain.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I'm trying to get a minimal Xorg with Buildroot 2016.02 on Raspberry Pi 
2, but the Xserver crashes as soon I launch dillo web-browser.
I get the same crash if I launch fluxbox (or openbox or matchbox).
I tried even on a iMX6 custom board but the same problem happens.
The strange thing is that if I use only xterm and twm everything works 
correctly.

I configured the system with:

- Modular X.org (but same problem with KDrive/TinyX)
- xf86-input-evdev
- xf86-video-fbdev
- twm
- xterm
- dillo

When I launch X with the following

# X :0 &
# export DISPLAY=:0
# twm &
# xterm &

Xorg, twm and xterm are working fine.

But with this:

# X :0 &
# export DISPLAY=:0
# dillo &

I get:

(EE) Segmentation fault at address 0x0
(EE) Fatal server error:
(EE) Caught signal 11 (Segmentation fault). Server aborting
(EE)
(EE) Please consult the The X.Org Foundation support
	 at http://wiki.x.org for help.
(EE) Please also check the log file at "/var/log/Xorg.0.log" for 
additional information.
(EE)
(EE) Server terminated with error (1). Closing log file.

In attachment you can find the Xorg log and configuration file.
Could someone please explain me what is going wrong.

Thanks
Regards
Luca



-------------- next part --------------
[   458.246] 
X.Org X Server 1.18.0
Release Date: 2015-11-09
[   458.246] X Protocol Version 11, Revision 0
[   458.246] Build Operating System: Linux 3.13.0-37-generic x86_64 
[   458.247] Current Operating System: Linux buildroot 4.1.15-v7 #1 SMP PREEMPT Thu May 5 11:57:52 CEST 2016 armv7l
[   458.247] Kernel command line: dma.dmachans=0x7f35 bcm2708_fb.fbwidth=1280 bcm2708_fb.fbheight=1024 bcm2709.boardrev=0xa01041 bcm2709.serial=0x81f8d998 smsc95xx.macaddr=B8:27:EB:F8:D9:98 bcm2708_fb.fbswap=1 bcm2709.disk_led_gpio=47 bcm2709.disk_led_active_low=0 sdhci-bcm2708.emmc_clock_freq=250000000 vc_mem.mem_base=0x3dc00000 vc_mem.mem_size=0x3f000000  root=/dev/mmcblk0p2 rootwait
[   458.248] Build Date: 05 May 2016  11:34:53AM
[   458.249]  
[   458.249] Current version of pixman: 0.34.0
[   458.249] 	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
[   458.249] Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[   458.251] (==) Log file: "/var/log/Xorg.0.log", Time: Thu Jan  1 00:07:38 1970
[   458.252] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[   458.253] (==) No Layout section.  Using the first Screen section.
[   458.253] (==) No screen section available. Using defaults.
[   458.253] (**) |-->Screen "Default Screen Section" (0)
[   458.253] (**) |   |-->Monitor "<default monitor>"
[   458.255] (==) No monitor specified for screen "Default Screen Section".
	Using a default monitor configuration.
[   458.255] (==) Automatically adding devices
[   458.256] (==) Automatically enabling devices
[   458.256] (==) Automatically adding GPU devices
[   458.256] (==) Max clients allowed: 256, resource mask: 0x1fffff
[   458.256] (WW) The directory "/usr/share/fonts/X11//TTF/" does not exist.
[   458.256] 	Entry deleted from font path.
[   458.256] (WW) The directory "/usr/share/fonts/X11//OTF/" does not exist.
[   458.256] 	Entry deleted from font path.
[   458.256] (WW) The directory "/usr/share/fonts/X11//Type1/" does not exist.
[   458.256] 	Entry deleted from font path.
[   458.256] (WW) `fonts.dir' not found (or not valid) in "/usr/share/fonts/X11//100dpi/".
[   458.257] 	Entry deleted from font path.
[   458.257] 	(Run 'mkfontdir' on "/usr/share/fonts/X11//100dpi/").
[   458.257] (WW) `fonts.dir' not found (or not valid) in "/usr/share/fonts/X11//75dpi/".
[   458.257] 	Entry deleted from font path.
[   458.257] 	(Run 'mkfontdir' on "/usr/share/fonts/X11//75dpi/").
[   458.257] (==) FontPath set to:
	/usr/share/fonts/X11//misc/
[   458.257] (==) ModulePath set to "/usr/lib/xorg/modules"
[   458.257] (II) The server relies on udev to provide the list of input devices.
	If no devices become available, reconfigure udev or disable AutoAddDevices.
[   458.257] (II) Loader magic: 0x18bbc0
[   458.257] (II) Module ABI versions:
[   458.257] 	X.Org ANSI C Emulation: 0.4
[   458.257] 	X.Org Video Driver: 20.0
[   458.258] 	X.Org XInput driver : 22.1
[   458.258] 	X.Org Server Extension : 9.0
[   458.258] (II) no primary bus or device found
[   458.259] (==) Matched modesetting as autoconfigured driver 0
[   458.259] (==) Matched fbdev as autoconfigured driver 1
[   458.259] (==) Assigned the driver to the xf86ConfigLayout
[   458.259] (II) LoadModule: "modesetting"
[   458.260] (II) Loading /usr/lib/xorg/modules/drivers/modesetting_drv.so
[   458.262] (II) Module modesetting: vendor="X.Org Foundation"
[   458.262] 	compiled for 1.18.0, module version = 1.18.0
[   458.262] 	Module class: X.Org Video Driver
[   458.262] 	ABI class: X.Org Video Driver, version 20.0
[   458.263] (II) LoadModule: "fbdev"
[   458.263] (II) Loading /usr/lib/xorg/modules/drivers/fbdev_drv.so
[   458.264] (II) Module fbdev: vendor="X.Org Foundation"
[   458.264] 	compiled for 1.18.0, module version = 0.4.4
[   458.264] 	Module class: X.Org Video Driver
[   458.264] 	ABI class: X.Org Video Driver, version 20.0
[   458.264] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[   458.264] (II) FBDEV: driver for framebuffer: fbdev
[   458.265] (--) using VT number 2

[   458.283] (WW) Falling back to old probe method for modesetting
[   458.284] (EE) open /dev/dri/card0: No such file or directory
[   458.284] (WW) Falling back to old probe method for fbdev
[   458.284] (II) Loading sub module "fbdevhw"
[   458.284] (II) LoadModule: "fbdevhw"
[   458.286] (II) Loading /usr/lib/xorg/modules/libfbdevhw.so
[   458.290] (II) Module fbdevhw: vendor="X.Org Foundation"
[   458.290] 	compiled for 1.18.0, module version = 0.0.2
[   458.290] 	ABI class: X.Org Video Driver, version 20.0
[   458.291] (II) FBDEV(0): using default device
[   458.291] (WW) VGA arbiter: cannot open kernel arbiter, no multi-card support
[   458.291] (II) FBDEV(0): Creating default Display subsection in Screen section
	"Default Screen Section" for depth/fbbpp 16/16
[   458.291] (==) FBDEV(0): Depth 16, (==) framebuffer bpp 16
[   458.291] (==) FBDEV(0): RGB weight 565
[   458.292] (==) FBDEV(0): Default visual is TrueColor
[   458.292] (==) FBDEV(0): Using gamma correction (1.0, 1.0, 1.0)
[   458.292] (II) FBDEV(0): hardware: BCM2708 FB (video memory: 2560kB)
[   458.292] (II) FBDEV(0): checking modes against framebuffer device...
[   458.292] (II) FBDEV(0): checking modes against monitor...
[   458.292] (--) FBDEV(0): Virtual size is 1280x1024 (pitch 1280)
[   458.292] (**) FBDEV(0):  Built-in mode "current"
[   458.292] (==) FBDEV(0): DPI set to (96, 96)
[   458.293] (II) Loading sub module "fb"
[   458.293] (II) LoadModule: "fb"
[   458.294] (II) Loading /usr/lib/xorg/modules/libfb.so
[   458.305] (II) Module fb: vendor="X.Org Foundation"
[   458.305] 	compiled for 1.18.0, module version = 1.0.0
[   458.305] 	ABI class: X.Org ANSI C Emulation, version 0.4
[   458.305] (**) FBDEV(0): using shadow framebuffer
[   458.305] (II) Loading sub module "shadow"
[   458.305] (II) LoadModule: "shadow"
[   458.306] (II) Loading /usr/lib/xorg/modules/libshadow.so
[   458.313] (II) Module shadow: vendor="X.Org Foundation"
[   458.313] 	compiled for 1.18.0, module version = 1.1.0
[   458.313] 	ABI class: X.Org ANSI C Emulation, version 0.4
[   458.313] (II) UnloadModule: "modesetting"
[   458.313] (II) Unloading modesetting
[   458.328] (==) FBDEV(0): Backing store disabled
[   458.333] (==) FBDEV(0): DPMS enabled
[   458.334] (==) RandR enabled
[   458.760] (II) config/udev: Adding input device HID 046a:0001 (/dev/input/event0)
[   458.760] (**) HID 046a:0001: Applying InputClass "evdev keyboard catchall"
[   458.760] (II) LoadModule: "evdev"
[   458.761] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[   458.780] (II) Module evdev: vendor="X.Org Foundation"
[   458.780] 	compiled for 1.18.0, module version = 2.10.1
[   458.780] 	Module class: X.Org XInput Driver
[   458.780] 	ABI class: X.Org XInput driver, version 22.1
[   458.780] (II) Using input driver 'evdev' for 'HID 046a:0001'
[   458.780] (**) HID 046a:0001: always reports core events
[   458.781] (**) evdev: HID 046a:0001: Device: "/dev/input/event0"
[   458.781] (--) evdev: HID 046a:0001: Vendor 0x46a Product 0x1
[   458.782] (--) evdev: HID 046a:0001: Found keys
[   458.782] (II) evdev: HID 046a:0001: Configuring as keyboard
[   458.782] (**) Option "config_info" "udev:/sys/devices/platform/soc/3f980000.usb/usb1/1-1/1-1.3/1-1.3:1.0/0003:046A:0001.0001/input/input0/event0"
[   458.782] (II) XINPUT: Adding extended input device "HID 046a:0001" (type: KEYBOARD, id 6)
[   458.782] (**) Option "xkb_rules" "evdev"
[   458.788] (II) config/udev: Adding input device Microsoft Microsoft 3-Button Mouse with IntelliEye(TM) (/dev/input/event1)
[   458.788] (**) Microsoft Microsoft 3-Button Mouse with IntelliEye(TM): Applying InputClass "evdev pointer catchall"
[   458.788] (II) Using input driver 'evdev' for 'Microsoft Microsoft 3-Button Mouse with IntelliEye(TM)'
[   458.788] (**) Microsoft Microsoft 3-Button Mouse with IntelliEye(TM): always reports core events
[   458.788] (**) evdev: Microsoft Microsoft 3-Button Mouse with IntelliEye(TM): Device: "/dev/input/event1"
[   458.840] (--) evdev: Microsoft Microsoft 3-Button Mouse with IntelliEye(TM): Vendor 0x45e Product 0x40
[   458.840] (--) evdev: Microsoft Microsoft 3-Button Mouse with IntelliEye(TM): Found 3 mouse buttons
[   458.840] (--) evdev: Microsoft Microsoft 3-Button Mouse with IntelliEye(TM): Found scroll wheel(s)
[   458.840] (--) evdev: Microsoft Microsoft 3-Button Mouse with IntelliEye(TM): Found relative axes
[   458.840] (--) evdev: Microsoft Microsoft 3-Button Mouse with IntelliEye(TM): Found x and y relative axes
[   458.841] (II) evdev: Microsoft Microsoft 3-Button Mouse with IntelliEye(TM): Configuring as mouse
[   458.841] (II) evdev: Microsoft Microsoft 3-Button Mouse with IntelliEye(TM): Adding scrollwheel support
[   458.841] (**) evdev: Microsoft Microsoft 3-Button Mouse with IntelliEye(TM): YAxisMapping: buttons 4 and 5
[   458.841] (**) evdev: Microsoft Microsoft 3-Button Mouse with IntelliEye(TM): EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[   458.841] (**) Option "config_info" "udev:/sys/devices/platform/soc/3f980000.usb/usb1/1-1/1-1.5/1-1.5:1.0/0003:045E:0040.0002/input/input1/event1"
[   458.841] (II) XINPUT: Adding extended input device "Microsoft Microsoft 3-Button Mouse with IntelliEye(TM)" (type: MOUSE, id 7)
[   458.842] (II) evdev: Microsoft Microsoft 3-Button Mouse with IntelliEye(TM): initialized for relative axes.
[   458.843] (**) Microsoft Microsoft 3-Button Mouse with IntelliEye(TM): (accel) keeping acceleration scheme 1
[   458.843] (**) Microsoft Microsoft 3-Button Mouse with IntelliEye(TM): (accel) acceleration profile 0
[   458.843] (**) Microsoft Microsoft 3-Button Mouse with IntelliEye(TM): (accel) acceleration factor: 2.000
[   458.843] (**) Microsoft Microsoft 3-Button Mouse with IntelliEye(TM): (accel) acceleration threshold: 4
[   458.846] (II) config/udev: Adding input device Microsoft Microsoft 3-Button Mouse with IntelliEye(TM) (/dev/input/mouse0)
[   458.846] (II) No input driver specified, ignoring this device.
[   458.846] (II) This device may have been added with another device file.
[   526.946] (EE) Segmentation fault at address 0x0
[   526.946] (EE) 
Fatal server error:
[   526.946] (EE) Caught signal 11 (Segmentation fault). Server aborting
[   526.946] (EE) 
[   526.946] (EE) 
Please consult the The X.Org Foundation support 
	 at http://wiki.x.org
 for help. 
[   526.946] (EE) Please also check the log file at "/var/log/Xorg.0.log" for additional information.
[   526.946] (EE) 
[   526.975] (EE) Server terminated with error (1). Closing log file.
-------------- next part --------------
BR2_arm=y
BR2_cortex_a7=y
BR2_ARM_FPU_NEON_VFPV4=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_TARGET_GENERIC_ROOT_PASSWD="root"
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_ROOTFS_USERS_TABLES="board/raspberrypi2/users.table"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi2/post-image.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="d33d0293e245badc4ca6ede3984d8bb8ea63cb1a"
BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
BR2_LINUX_KERNEL_ZIMAGE=y
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2709-rpi-2-b"
BR2_PACKAGE_DEJAVU=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XCB_UTIL_CURSOR=y
BR2_PACKAGE_XCB_UTIL_KEYSYMS=y
BR2_PACKAGE_XCB_UTIL_WM=y
BR2_PACKAGE_XLIB_LIBXTST=y
BR2_PACKAGE_XLIB_LIBXSHMFENCE=y
BR2_PACKAGE_XAPP_TWM=y
BR2_PACKAGE_XAPP_XFONTSEL=y
BR2_PACKAGE_XAPP_XKBUTILS=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBDEV=y
BR2_PACKAGE_DILLO=y
BR2_PACKAGE_XTERM=y
BR2_PACKAGE_RPI_FIRMWARE=y
# BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
BR2_PACKAGE_ELFUTILS=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y
