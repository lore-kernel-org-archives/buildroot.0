From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 10 Feb 2015 11:43:21 +0100
Subject: [Buildroot] getting X running
Message-ID: <C860A811EEF34E4793E67D45FD390387@JohanW7>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

 
Hi

Not sure if X11 can run with uclibc, I enabled everything but when I try te run X and inspect the log.
I found : [2048840.110] (EE) systemd-logind: failed to get session: The name org.freedesktop.login1 was not provided by any .service
files

If systemd is required, then I am at a dead end with uclibc, since systemd requires (e)glibc.

So if was wondering if I have to stop trying X running with uclibc, or if this indeed could work.
My final target is running a webkit based app. showing some html5 pages.

Johan

# 
# gtk-demo [J
# export DISPLAY=0.0[J
# X&[J
# cat /var/log/Xorg.0.log[J
# X[J
# X -configure[J
(EE) 
Fatal server error:
(EE) Server is already active for display 0
	If this server is no longer running, remove /tmp/.X0-lock
	and start again.
(EE) 
(EE) 
Please consult the The X.Org Foundation support 
	 at http://wiki.x.org
 for help. 
(EE) 
# 
# X -configure[J
# gtk-demo [J
# export DISPLAY=0.0[J
# X&[J
# cat /var/log/Xorg.0.log[J
[2048840.049] 
X.Org X Server 1.16.3
Release Date: 2014-12-20
[2048840.049] X Protocol Version 11, Revision 0
[2048840.049] Build Operating System: Linux 2.6.32-5-686 i686 
[2048840.049] Current Operating System: Linux apex_systems 3.16.0 #1 SMP PREEMPT Tue Feb 10 05:36:20 CET 2015 armv7l
[2048840.049] Kernel command line: init=/linuxrc console=ttymxc0,115200 rw root=/dev/nfs nfsroot=192.168.1.110:/home/johan/srcmain
mtdparts=gpmi-nand:1m at 128k(u-boot),384k(env),5m(linux),122112k(rootfs),1664k(logo.bmp),128k at 127m(dtb),512k at 130560k(bbt)ro
video=ET0700 ip=dhcp
[2048840.056] Build Date: 10 February 2015  05:27:13AM
[2048840.056]  
[2048840.057] Current version of pixman: 0.32.6
[2048840.057] 	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
[2048840.057] Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[2048840.058] (==) Log file: "/var/log/Xorg.0.log", Time: Mon Jan  3 16:20:45 2000
[2048840.073] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[2048840.074] (==) No Layout section.  Using the first Screen section.
[2048840.074] (==) No screen section available. Using defaults.
[2048840.074] (**) |-->Screen "Default Screen Section" (0)
[2048840.074] (**) |   |-->Monitor "<default monitor>"
[2048840.076] (==) No monitor specified for screen "Default Screen Section".
	Using a default monitor configuration.
[2048840.077] (==) Automatically adding devices
[2048840.077] (==) Automatically enabling devices
[2048840.077] (==) Automatically adding GPU devices
[2048840.098] (==) FontPath set to:
	/usr/share/fonts/X11//misc/,
	/usr/share/fonts/X11//TTF/,
	/usr/share/fonts/X11//OTF/,
	/usr/share/fonts/X11//Type1/,
	/usr/share/fonts/X11//100dpi/,
	/usr/share/fonts/X11//75dpi/
[2048840.098] (==) ModulePath set to "/usr/lib/xorg/modules"
[2048840.098] (II) The server relies on udev to provide the list of input devices.
	If no devices become available, reconfigure udev or disable AutoAddDevices.
[2048840.098] (II) Loader magic: 0x196960
[2048840.098] (II) Module ABI versions:
[2048840.098] 	X.Org ANSI C Emulation: 0.4
[2048840.098] 	X.Org Video Driver: 18.0
[2048840.098] 	X.Org XInput driver : 21.0
[2048840.099] 	X.Org Server Extension : 8.0
[2048840.110] (EE) systemd-logind: failed to get session: The name org.freedesktop.login1 was not provided by any .service files
[2048840.111] (II) xfree86: Adding drm device (/dev/dri/card0)
[2048840.112] (II) no primary bus or device found
[2048840.112] 	falling back to /sys/devices/platform/Vivante GCCore/drm/card0
[2048840.112] (II) Open APM successful
[2048840.112] (==) Matched modesetting as autoconfigured driver 0
[2048840.112] (==) Matched fbdev as autoconfigured driver 1
[2048840.112] (==) Assigned the driver to the xf86ConfigLayout
[2048840.112] (II) LoadModule: "modesetting"
[2048840.149] (WW) Warning, couldn't open module modesetting
[2048840.149] (II) UnloadModule: "modesetting"
[2048840.149] (II) Unloading modesetting
[2048840.149] (EE) Failed to load module "modesetting" (module does not exist, 0)
[2048840.149] (II) LoadModule: "fbdev"
[2048840.188] (II) Loading /usr/lib/xorg/modules/drivers/fbdev_drv.so
[2048840.229] (II) Module fbdev: vendor="X.Org Foundation"
[2048840.229] 	compiled for 1.16.3, module version = 0.4.4
[2048840.229] 	Module class: X.Org Video Driver
[2048840.229] 	ABI class: X.Org Video Driver, version 18.0
[2048840.229] (II) FBDEV: driver for framebuffer: fbdev
[2048840.229] (--) using VT number 2

[2048840.236] (WW) Falling back to old probe method for fbdev
[2048840.236] (II) Loading sub module "fbdevhw"
[2048840.236] (II) LoadModule: "fbdevhw"
[2048840.258] (II) Loading /usr/lib/xorg/modules/libfbdevhw.so
[2048840.379] (II) Module fbdevhw: vendor="X.Org Foundation"
[2048840.379] 	compiled for 1.16.3, module version = 0.0.2
[2048840.379] 	ABI class: X.Org Video Driver, version 18.0
[2048840.379] (II) FBDEV(0): using default device
[2048840.379] (WW) VGA arbiter: cannot open kernel arbiter, no multi-card support
[2048840.380] (II) FBDEV(0): Creating default Display subsection in Screen section
	"Default Screen Section" for depth/fbbpp 24/32
[2048840.380] (==) FBDEV(0): Depth 24, (==) framebuffer bpp 32
[2048840.380] (==) FBDEV(0): RGB weight 888
[2048840.380] (==) FBDEV(0): Default visual is TrueColor
[2048840.380] (==) FBDEV(0): Using gamma correction (1.0, 1.0, 1.0)
[2048840.380] (II) FBDEV(0): hardware: DISP3 BG (video memory: 1500kB)
[2048840.380] (II) FBDEV(0): checking modes against framebuffer device...
[2048840.380] (II) FBDEV(0): checking modes against monitor...
[2048840.380] (--) FBDEV(0): Virtual size is 800x480 (pitch 800)
[2048840.380] (**) FBDEV(0):  Built-in mode "current": 33.3 MHz, 31.5 kHz, 60.0 Hz
[2048840.380] (II) FBDEV(0): Modeline "current"x0.0   33.26  800 840 968 1056  480 490 492 525 -hsync -vsync -csync (31.5 kHz b)
[2048840.381] (==) FBDEV(0): DPI set to (96, 96)
[2048840.381] (II) Loading sub module "fb"
[2048840.381] (II) LoadModule: "fb"
[2048840.418] (II) Loading /usr/lib/xorg/modules/libfb.so
[2048840.641] (II) Module fb: vendor="X.Org Foundation"
[2048840.641] 	compiled for 1.16.3, module version = 1.0.0
[2048840.641] 	ABI class: X.Org ANSI C Emulation, version 0.4
[2048840.641] (**) FBDEV(0): using shadow framebuffer
[2048840.641] (II) Loading sub module "shadow"
[2048840.641] (II) LoadModule: "shadow"
[2048840.679] (II) Loading /usr/lib/xorg/modules/libshadow.so
[2048840.789] (II) Module shadow: vendor="X.Org Foundation"
[2048840.789] 	compiled for 1.16.3, module version = 1.1.0
[2048840.789] 	ABI class: X.Org ANSI C Emulation, version 0.4
[2048840.789] (==) Depth 24 pixmap format is 32 bpp
[2048840.797] (==) FBDEV(0): Backing store disabled
[2048840.798] (==) FBDEV(0): DPMS enabled
[2048840.798] (==) RandR enabled
[2048842.690] (II) config/udev: Adding input device gpio-keys (/dev/input/event1)
[2048842.690] (**) gpio-keys: Applying InputClass "evdev keyboard catchall"
[2048842.690] (II) LoadModule: "evdev"
[2048842.718] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[2048842.969] (II) Module evdev: vendor="X.Org Foundation"
[2048842.969] 	compiled for 1.16.3, module version = 2.8.2
[2048842.969] 	Module class: X.Org XInput Driver
[2048842.969] 	ABI class: X.Org XInput driver, version 21.0
[2048842.969] (II) Using input driver 'evdev' for 'gpio-keys'
[2048842.969] (**) gpio-keys: always reports core events
[2048842.969] (**) evdev: gpio-keys: Device: "/dev/input/event1"
[2048842.970] (--) evdev: gpio-keys: Vendor 0x1 Product 0x1
[2048842.970] (--) evdev: gpio-keys: Found keys
[2048842.970] (II) evdev: gpio-keys: Configuring as keyboard
[2048842.970] (**) Option "config_info" "udev:/sys/devices/soc0/gpio-keys/input/input1/event1"
[2048842.970] (II) XINPUT: Adding extended input device "gpio-keys" (type: KEYBOARD, id 6)
[2048842.970] (**) Option "xkb_rules" "evdev"
[2048842.970] (**) Option "xkb_model" "pc104"
[2048842.970] (**) Option "xkb_layout" "us"
[2048843.670] (II) config/udev: Adding input device EP0700M06 (/dev/input/event0)
[2048843.670] (**) EP0700M06: Applying InputClass "evdev touchscreen catchall"
[2048843.670] (II) Using input driver 'evdev' for 'EP0700M06'
[2048843.671] (**) EP0700M06: always reports core events
[2048843.671] (**) evdev: EP0700M06: Device: "/dev/input/event0"
[2048843.671] (II) evdev: EP0700M06: Using mtdev for this device
[2048843.671] (--) evdev: EP0700M06: Vendor 0 Product 0
[2048843.671] (--) evdev: EP0700M06: Found absolute axes
[2048843.671] (--) evdev: EP0700M06: Found absolute multitouch axes
[2048843.671] (II) evdev: EP0700M06: No buttons found, faking one.
[2048843.672] (--) evdev: EP0700M06: Found x and y absolute axes
[2048843.672] (--) evdev: EP0700M06: Found absolute touchscreen
[2048843.672] (II) evdev: EP0700M06: Configuring as touchscreen
[2048843.672] (**) evdev: EP0700M06: YAxisMapping: buttons 4 and 5
[2048843.672] (**) evdev: EP0700M06: EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[2048843.672] (**) Option "config_info" "udev:/sys/devices/soc0/soc/2100000.aips-bus/21a8000.i2c/i2c-2/2-0038/input/input0/event0"
[2048843.672] (II) XINPUT: Adding extended input device "EP0700M06" (type: TOUCHSCREEN, id 7)
[2048843.672] (II) evdev: EP0700M06: initialized for absolute axes.
[2048843.679] (**) EP0700M06: (accel) keeping acceleration scheme 1
[2048843.679] (**) EP0700M06: (accel) acceleration profile 0
[2048843.679] (**) EP0700M06: (accel) acceleration factor: 2.000
[2048843.679] (**) EP0700M06: (accel) acceleration threshold: 4
# 
# 
# cat /var/log/Xorg.0.log[J
[2048840.049] 
X.Org X Server 1.16.3
Release Date: 2014-12-20
[2048840.049] X Protocol Version 11, Revision 0
[2048840.049] Build Operating System: Linux 2.6.32-5-686 i686 
[2048840.049] Current Operating System: Linux apex_systems 3.16.0 #1 SMP PREEMPT Tue Feb 10 05:36:20 CET 2015 armv7l
[2048840.049] Kernel command line: init=/linuxrc console=ttymxc0,115200 rw root=/dev/nfs nfsroot=192.168.1.110:/home/johan/srcmain
mtdparts=gpmi-nand:1m at 128k(u-boot),384k(env),5m(linux),122112k(rootfs),1664k(logo.bmp),128k at 127m(dtb),512k at 130560k(bbt)ro
video=ET0700 ip=dhcp
[2048840.056] Build Date: 10 February 2015  05:27:13AM
[2048840.056]  
[2048840.057] Current version of pixman: 0.32.6
[2048840.057] 	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
[2048840.057] Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[2048840.058] (==) Log file: "/var/log/Xorg.0.log", Time: Mon Jan  3 16:20:45 2000
[2048840.073] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[2048840.074] (==) No Layout section.  Using the first Screen section.
[2048840.074] (==) No screen section available. Using defaults.
[2048840.074] (**) |-->Screen "Default Screen Section" (0)
[2048840.074] (**) |   |-->Monitor "<default monitor>"
[2048840.076] (==) No monitor specified for screen "Default Screen Section".
	Using a default monitor configuration.
[2048840.077] (==) Automatically adding devices
[2048840.077] (==) Automatically enabling devices
[2048840.077] (==) Automatically adding GPU devices
[2048840.098] (==) FontPath set to:
	/usr/share/fonts/X11//misc/,
	/usr/share/fonts/X11//TTF/,
	/usr/share/fonts/X11//OTF/,
	/usr/share/fonts/X11//Type1/,
	/usr/share/fonts/X11//100dpi/,
	/usr/share/fonts/X11//75dpi/
[2048840.098] (==) ModulePath set to "/usr/lib/xorg/modules"
[2048840.098] (II) The server relies on udev to provide the list of input devices.
	If no devices become available, reconfigure udev or disable AutoAddDevices.
[2048840.098] (II) Loader magic: 0x196960
[2048840.098] (II) Module ABI versions:
[2048840.098] 	X.Org ANSI C Emulation: 0.4
[2048840.098] 	X.Org Video Driver: 18.0
[2048840.098] 	X.Org XInput driver : 21.0
[2048840.099] 	X.Org Server Extension : 8.0
[2048840.110] (EE) systemd-logind: failed to get session: The name org.freedesktop.login1 was not provided by any .service files
[2048840.111] (II) xfree86: Adding drm device (/dev/dri/card0)
[2048840.112] (II) no primary bus or device found
[2048840.112] 	falling back to /sys/devices/platform/Vivante GCCore/drm/card0
[2048840.112] (II) Open APM successful
[2048840.112] (==) Matched modesetting as autoconfigured driver 0
[2048840.112] (==) Matched fbdev as autoconfigured driver 1
[2048840.112] (==) Assigned the driver to the xf86ConfigLayout
[2048840.112] (II) LoadModule: "modesetting"
[2048840.149] (WW) Warning, couldn't open module modesetting
[2048840.149] (II) UnloadModule: "modesetting"
[2048840.149] (II) Unloading modesetting
[2048840.149] (EE) Failed to load module "modesetting" (module does not exist, 0)
[2048840.149] (II) LoadModule: "fbdev"
[2048840.188] (II) Loading /usr/lib/xorg/modules/drivers/fbdev_drv.so
[2048840.229] (II) Module fbdev: vendor="X.Org Foundation"
[2048840.229] 	compiled for 1.16.3, module version = 0.4.4
[2048840.229] 	Module class: X.Org Video Driver
[2048840.229] 	ABI class: X.Org Video Driver, version 18.0
[2048840.229] (II) FBDEV: driver for framebuffer: fbdev
[2048840.229] (--) using VT number 2

[2048840.236] (WW) Falling back to old probe method for fbdev
[2048840.236] (II) Loading sub module "fbdevhw"
[2048840.236] (II) LoadModule: "fbdevhw"
[2048840.258] (II) Loading /usr/lib/xorg/modules/libfbdevhw.so
[2048840.379] (II) Module fbdevhw: vendor="X.Org Foundation"
[2048840.379] 	compiled for 1.16.3, module version = 0.0.2
[2048840.379] 	ABI class: X.Org Video Driver, version 18.0
[2048840.379] (II) FBDEV(0): using default device
[2048840.379] (WW) VGA arbiter: cannot open kernel arbiter, no multi-card support
[2048840.380] (II) FBDEV(0): Creating default Display subsection in Screen section
	"Default Screen Section" for depth/fbbpp 24/32
[2048840.380] (==) FBDEV(0): Depth 24, (==) framebuffer bpp 32
[2048840.380] (==) FBDEV(0): RGB weight 888
[2048840.380] (==) FBDEV(0): Default visual is TrueColor
[2048840.380] (==) FBDEV(0): Using gamma correction (1.0, 1.0, 1.0)
[2048840.380] (II) FBDEV(0): hardware: DISP3 BG (video memory: 1500kB)
[2048840.380] (II) FBDEV(0): checking modes against framebuffer device...
[2048840.380] (II) FBDEV(0): checking modes against monitor...
[2048840.380] (--) FBDEV(0): Virtual size is 800x480 (pitch 800)
[2048840.380] (**) FBDEV(0):  Built-in mode "current": 33.3 MHz, 31.5 kHz, 60.0 Hz
[2048840.380] (II) FBDEV(0): Modeline "current"x0.0   33.26  800 840 968 1056  480 490 492 525 -hsync -vsync -csync (31.5 kHz b)
[2048840.381] (==) FBDEV(0): DPI set to (96, 96)
[2048840.381] (II) Loading sub module "fb"
[2048840.381] (II) LoadModule: "fb"
[2048840.418] (II) Loading /usr/lib/xorg/modules/libfb.so
[2048840.641] (II) Module fb: vendor="X.Org Foundation"
[2048840.641] 	compiled for 1.16.3, module version = 1.0.0
[2048840.641] 	ABI class: X.Org ANSI C Emulation, version 0.4
[2048840.641] (**) FBDEV(0): using shadow framebuffer
[2048840.641] (II) Loading sub module "shadow"
[2048840.641] (II) LoadModule: "shadow"
[2048840.679] (II) Loading /usr/lib/xorg/modules/libshadow.so
[2048840.789] (II) Module shadow: vendor="X.Org Foundation"
[2048840.789] 	compiled for 1.16.3, module version = 1.1.0
[2048840.789] 	ABI class: X.Org ANSI C Emulation, version 0.4
[2048840.789] (==) Depth 24 pixmap format is 32 bpp
[2048840.797] (==) FBDEV(0): Backing store disabled
[2048840.798] (==) FBDEV(0): DPMS enabled
[2048840.798] (==) RandR enabled
[2048842.690] (II) config/udev: Adding input device gpio-keys (/dev/input/event1)
[2048842.690] (**) gpio-keys: Applying InputClass "evdev keyboard catchall"
[2048842.690] (II) LoadModule: "evdev"
[2048842.718] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[2048842.969] (II) Module evdev: vendor="X.Org Foundation"
[2048842.969] 	compiled for 1.16.3, module version = 2.8.2
[2048842.969] 	Module class: X.Org XInput Driver
[2048842.969] 	ABI class: X.Org XInput driver, version 21.0
[2048842.969] (II) Using input driver 'evdev' for 'gpio-keys'
[2048842.969] (**) gpio-keys: always reports core events
[2048842.969] (**) evdev: gpio-keys: Device: "/dev/input/event1"
[2048842.970] (--) evdev: gpio-keys: Vendor 0x1 Product 0x1
[2048842.970] (--) evdev: gpio-keys: Found keys
[2048842.970] (II) evdev: gpio-keys: Configuring as keyboard
[2048842.970] (**) Option "config_info" "udev:/sys/devices/soc0/gpio-keys/input/input1/event1"
[2048842.970] (II) XINPUT: Adding extended input device "gpio-keys" (type: KEYBOARD, id 6)
[2048842.970] (**) Option "xkb_rules" "evdev"
[2048842.970] (**) Option "xkb_model" "pc104"
[2048842.970] (**) Option "xkb_layout" "us"
[2048843.670] (II) config/udev: Adding input device EP0700M06 (/dev/input/event0)
[2048843.670] (**) EP0700M06: Applying InputClass "evdev touchscreen catchall"
[2048843.670] (II) Using input driver 'evdev' for 'EP0700M06'
[2048843.671] (**) EP0700M06: always reports core events
[2048843.671] (**) evdev: EP0700M06: Device: "/dev/input/event0"
[2048843.671] (II) evdev: EP0700M06: Using mtdev for this device
[2048843.671] (--) evdev: EP0700M06: Vendor 0 Product 0
[2048843.671] (--) evdev: EP0700M06: Found absolute axes
[2048843.671] (--) evdev: EP0700M06: Found absolute multitouch axes
[2048843.671] (II) evdev: EP0700M06: No buttons found, faking one.
[2048843.672] (--) evdev: EP0700M06: Found x and y absolute axes
[2048843.672] (--) evdev: EP0700M06: Found absolute touchscreen
[2048843.672] (II) evdev: EP0700M06: Configuring as touchscreen
[2048843.672] (**) evdev: EP0700M06: YAxisMapping: buttons 4 and 5
[2048843.672] (**) evdev: EP0700M06: EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[2048843.672] (**) Option "config_info" "udev:/sys/devices/soc0/soc/2100000.aips-bus/21a8000.i2c/i2c-2/2-0038/input/input0/event0"
[2048843.672] (II) XINPUT: Adding extended input device "EP0700M06" (type: TOUCHSCREEN, id 7)
[2048843.672] (II) evdev: EP0700M06: initialized for absolute axes.
[2048843.679] (**) EP0700M06: (accel) keeping acceleration scheme 1
[2048843.679] (**) EP0700M06: (accel) acceleration profile 0
[2048843.679] (**) EP0700M06: (accel) acceleration factor: 2.000
[2048843.679] (**) EP0700M06: (accel) acceleration threshold: 4
#  



M.v.g .
Sagaert Johan

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 6253 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150210/bfd61bc9/attachment.bin>
