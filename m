From: Damien Borie <dbe@terawatt.fr>
Date: Wed, 24 Mar 2010 16:19:19 +0100
Subject: [Buildroot] Xorg configuration for XGI chip
In-Reply-To: <4BAA0988.9050708@arcor.de>
References: <4BA3A72B.3010009@terawatt.fr> <4BA3AAC2.9050400@gmail.com>
	<4BA8E694.3080809@terawatt.fr> <4BAA0988.9050708@arcor.de>
Message-ID: <4BAA2D77.1050402@terawatt.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thank for your help.
I don't know how to access the video BIOS. I can only access Motherboard 
BIOS and there is nothing into for video parameters.

I use startx command to launch X server and my xinitrc is the default 
one which launch twn, xclock and 3 xterm. When I use vesa, I can see 
them. But, as I don't get any error, maybe the server is really running 
and there is only a bad parameter or something like that.
My log file is a bit log, but here we go. The only thing strange is an 
memory error when I interrupt (at the end). I don't know the cause, but 
we think maybe we must set  memory value for video somewhere.
Another theory : the hsync range and vrefresh range are default, and I 
don't know how to find the good values.

X.Org X Server 1.7.1
Release Date: 2009-10-23
X Protocol Version 11, Revision 0
Build Operating System: Linux 2.6.25-2-686 i686
Current Operating System: Linux matrix5 2.6.32 #1 PREEMPT Tue Mar 23 
11:15:59 CET 2010 i586
Kernel command line: root=/dev/hda2 vga=769 BOOT_IMAGE=bzImage
Build Date: 22 March 2010  05:55:06PM
 
Current version of pixman: 0.17.4
    Before reporting problems, check http://wiki.x.org
    to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
    (++) from command line, (!!) notice, (II) informational,
    (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/usr/var/log/Xorg.0.log", Time: Wed Mar 24 23:07:46 2010
(==) Using config file: "/etc/X11/xorg.conf"
(==) ServerLayout "Simple Layout"
(**) |-->Screen "Screen0" (0)
(**) |   |-->Monitor "Monitor XGI"
(==) No device specified for screen "Screen0".
    Using the first device section listed.
(**) |   |-->Device "Volari z9s"
(**) |-->Input Device "Mouse1"
(**) |-->Input Device "Keyboard1"
(==) Not automatically adding devices
(==) Not automatically enabling devices
(WW) The directory "/usr/lib/X11/fonts/misc/" does not exist.
    Entry deleted from font path.
(WW) The directory "/usr/lib/X11/fonts/TTF/" does not exist.
    Entry deleted from font path.
(WW) The directory "/usr/lib/X11/fonts/OTF" does not exist.
    Entry deleted from font path.
(WW) The directory "/usr/lib/X11/fonts/Type1/" does not exist.
    Entry deleted from font path.
(WW) The directory "/usr/lib/X11/fonts/100dpi/" does not exist.
    Entry deleted from font path.
(WW) The directory "/usr/lib/X11/fonts/75dpi/" does not exist.
    Entry deleted from font path.
(**) FontPath set to:
    /usr/share/fonts/X11/misc/
(==) ModulePath set to "/usr/lib/xorg/modules"
(II) Loader magic: 0x8196b60
(II) Module ABI versions:
    X.Org ANSI C Emulation: 0.4
    X.Org Video Driver: 6.0
    X.Org XInput driver : 7.0
    X.Org Server Extension : 2.0
(--) using VT number 3

(--) PCI:*(0:0:3:0) 18ca:0020:18ca:0020 rev 0, Mem @ 
0xf8000000/67108864, 0xfefc0000/262144, I/O @ 0x0000df80/128
(WW) Open ACPI failed (/var/run/acpid.socket) (No such file or directory)
(II) "extmod" will be loaded. This was enabled by default and also 
specified in the config file.
(II) "dbe" will be loaded. This was enabled by default and also 
specified in the config file.
(II) "glx" will be loaded by default.
(II) "dri" will be loaded by default.
(II) LoadModule: "dbe"
(II) Loading /usr/lib/xorg/modules/extensions/libdbe.so
(II) Module dbe: vendor="X.Org Foundation"
    compiled for 1.7.1, module version = 1.0.0
    Module class: X.Org Server Extension
    ABI class: X.Org Server Extension, version 2.0
(II) Loading extension DOUBLE-BUFFER
(II) LoadModule: "extmod"
(II) Loading /usr/lib/xorg/modules/extensions/libextmod.so
(II) Module extmod: vendor="X.Org Foundation"
    compiled for 1.7.1, module version = 1.0.0
    Module class: X.Org Server Extension
    ABI class: X.Org Server Extension, version 2.0
(II) Loading extension MIT-SCREEN-SAVER
(II) Loading extension XFree86-VidModeExtension
(II) Loading extension DPMS
(II) Loading extension XVideo
(II) Loading extension XVideo-MotionCompensation
(II) Loading extension X-Resource
(II) LoadModule: "extmod"
(II) Reloading /usr/lib/xorg/modules/extensions/libextmod.so
(II) Loading extension MIT-SCREEN-SAVER
(II) Loading extension XFree86-VidModeExtension
(II) Loading extension XFree86-DGA
(II) Loading extension DPMS
(II) Loading extension XVideo
(II) Loading extension XVideo-MotionCompensation
(II) Loading extension X-Resource
(II) LoadModule: "glx"
(II) Loading /usr/lib/xorg/modules/extensions/libglx.so
(II) Module glx: vendor="X.Org Foundation"
    compiled for 1.7.1, module version = 1.0.0
    ABI class: X.Org Server Extension, version 2.0
(==) AIGLX enabled
(II) Loading extension GLX
(II) LoadModule: "dri"
(II) Loading /usr/lib/xorg/modules/extensions/libdri.so
(II) Module dri: vendor="X.Org Foundation"
    compiled for 1.7.1, module version = 1.0.0
    ABI class: X.Org Server Extension, version 2.0
(II) Loading extension XFree86-DRI
(II) LoadModule: "sis"
(II) Loading /usr/lib/xorg/modules/drivers/sis_drv.so
(II) Module sis: vendor="X.Org Foundation"
    compiled for 1.7.1, module version = 0.10.2
    Module class: X.Org Video Driver
    ABI class: X.Org Video Driver, version 6.0
(II) LoadModule: "mouse"
(II) Loading /usr/lib/xorg/modules/input/mouse_drv.so
(II) Module mouse: vendor="X.Org Foundation"
    compiled for 1.7.1, module version = 1.5.0
    Module class: X.Org XInput Driver
    ABI class: X.Org XInput driver, version 7.0
(II) LoadModule: "kbd"
(II) Loading /usr/lib/xorg/modules/input/kbd_drv.so
(II) Module kbd: vendor="X.Org Foundation"
    compiled for 1.7.1, module version = 1.4.0
    Module class: X.Org XInput Driver
    ABI class: X.Org XInput driver, version 7.0
(II) SIS: driver for SiS chipsets: SIS5597/5598, SIS530/620,
    SIS6326/AGP/DVD, SIS300/305, SIS630/730, SIS540, SIS315, SIS315H,
    SIS315PRO/E, SIS550, SIS650/M650/651/740, SIS330(Xabre),
    SIS660/[M]661[F|M]X/[M]670/[M]741[GX]/[M]760[GX]/[M]761[GX]/[M]770[GX],
    SIS340
(II) SIS: driver for XGI chipsets: Volari Z7 (XG20),
    Volari V3XT/V5/V8/Duo (XG40)
(II) Primary Device is: PCI 00 at 00:03:0
(WW) Falling back to old probe method for sis
(--) Chipset Volari Z7 (XG20) found
(II) SIS(0): SiS driver (2005/09/20-1, compiled for X.org 1.7.1.0)
(II) SIS(0): Copyright (C) 2001-2005 Thomas Winischhofer 
<thomas@winischhofer.net> and others
(II) SIS(0): *** See http://www.winischhofer.at/linuxsisvga.shtml
(II) SIS(0): *** for documentation and updates.
(--) SIS(0): sisfb not found
(--) SIS(0): Relocated I/O registers at 0xDF80
(WW) System lacks support for changing MTRRs
(II) Loading sub module "ramdac"
(II) LoadModule: "ramdac"
(II) Module "ramdac" already built-in
(**) SIS(0): Depth 8, (--) framebuffer bpp 8
(==) SIS(0): Default visual is PseudoColor
(--) SIS(0): Video BIOS version "1.09.05" found (XGI data layout)
(**) SIS(0): Option "DRI" "off"
(**) SIS(0): Option "BenchmarkMemcpy" "no"
(**) SIS(0): Option "UseSSE" "on"
(==) SIS(0): Using XAA acceleration architecture
(==) SIS(0): Using HW cursor
(II) SIS(0): Using VRAM command queue, size 128k
(==) SIS(0): Hotkey display switching is enabled
(==) SIS(0): SiSCtrl utility interface is disabled
(II) SIS(0): For information on SiSCtrl, see
        http://www.winischhofer.at/linuxsispart1.shtml#sisctrl
(**) SIS(0): Will not benchmark methods for system RAM to video RAM 
transfers
(**) SIS(0): Will eventually use SSE CPU instructions
(**) SIS(0): DRI disabled
(--) SIS(0): DRAM type: Single channel DDR2x SDRAM
(--) SIS(0): Memory clock: 248.178 MHz
(--) SIS(0): DRAM bus width: 16 bit
(--) SIS(0): Linear framebuffer at 0xF8000000
(--) SIS(0): MMIO registers at 0xFEFC0000 (size 64K)
(--) SIS(0): VideoRAM: 32768 KB
(II) SIS(0): Using 32608K of framebuffer memory at offset 0K
(==) SIS(0): Using gamma correction (1.0, 1.0, 1.0)
(II) SIS(0): Gamma correction is enabled
(--) SIS(0): Memory bandwidth at 8 bpp is 496.356 MHz
(II) Loading sub module "ddc"
(II) LoadModule: "ddc"
(II) Module "ddc" already built-in
(--) SIS(0): CRT1 DDC probing failed
(II) Loading sub module "ddc"
(II) LoadModule: "ddc"
(II) Module "ddc" already built-in
(II) Loading sub module "vbe"
(II) LoadModule: "vbe"
(II) Loading /usr/lib/xorg/modules/libvbe.so
(II) Module vbe: vendor="X.Org Foundation"
    compiled for 1.7.1, module version = 1.1.0
    ABI class: X.Org Video Driver, version 6.0
(II) Loading sub module "int10"
(II) LoadModule: "int10"
(II) Loading /usr/lib/xorg/modules/libint10.so
(II) Module int10: vendor="X.Org Foundation"
    compiled for 1.7.1, module version = 1.0.0
    ABI class: X.Org Video Driver, version 6.0
(II) SIS(0): initializing int10
(II) SIS(0): Primary V_BIOS segment is: 0xc000
(II) SIS(0): VESA BIOS detected
(II) SIS(0): VESA VBE Version 3.0
(II) SIS(0): VESA VBE Total Mem: 32768 kB
(II) SIS(0): VESA VBE OEM: XGI
(II) SIS(0): VESA VBE OEM Software Rev: 1.0
(II) SIS(0): VESA VBE OEM Vendor: XGI Technology, Inc.
(II) SIS(0): VESA VBE OEM Product: Volari Z9s
(II) SIS(0): VESA VBE OEM Product Rev: 1.09.05
(II) Loading sub module "ddc"
(II) LoadModule: "ddc"
(II) Module "ddc" already built-in
(II) SIS(0): VESA VBE DDC supported
(II) SIS(0): VESA VBE DDC Level none
(II) SIS(0): VESA VBE DDC transfer in appr. 0 sec.
(II) SIS(0): VESA VBE DDC read failed
(==) SIS(0): Min pixel clock is 10 MHz
(--) SIS(0): Max pixel clock is 166 MHz
(II) SIS(0): Replaced entire mode list with built-in modes
(II) SIS(0): Using real widescreen modes for CRT1 VGA devices
(II) SIS(0):     Use option "ForceCRT1VGAAspect" to overrule
(II) SIS(0): "Unknown reason" in the following list means that the mode
(II) SIS(0): is not supported on the chipset/bridge/current output device.
(II) SIS(0): Monitor XGI: Using default hsync range of 31.50-37.90 kHz
(II) SIS(0): Monitor XGI: Using default vrefresh range of 50.00-70.00 Hz
(II) SIS(0): Clock range:  10.00 to 166.00 MHz
(II) SIS(0): Not using default mode "800x600" (hsync out of range)
(II) SIS(0): Not using default mode "800x600" (hsync out of range)
(II) SIS(0): Not using default mode "800x600" (hsync out of range)
(II) SIS(0): Not using default mode "800x600" (hsync out of range)
(II) SIS(0): Not using default mode "800x600" (hsync out of range)
(II) SIS(0): Not using default mode "800x600" (hsync out of range)
(II) SIS(0): Not using default mode "640x480" (vrefresh out of range)
(II) SIS(0): Not using default mode "640x480" (vrefresh out of range)
(II) SIS(0): Not using default mode "640x480" (hsync out of range)
(II) SIS(0): Not using default mode "640x480" (hsync out of range)
(II) SIS(0): Not using default mode "640x480" (hsync out of range)
(II) SIS(0): Not using default mode "640x480" (hsync out of range)
(II) SIS(0): Not using default mode "640x480" (hsync out of range)
(II) SIS(0): Not using default mode "640x400" (vrefresh out of range)
(II) SIS(0): Not using default mode "1024x768" (vrefresh out of range)
(II) SIS(0): Not using default mode "1024x768" (hsync out of range)
(II) SIS(0): Not using default mode "1024x768" (hsync out of range)
(II) SIS(0): Not using default mode "1024x768" (hsync out of range)
(II) SIS(0): Not using default mode "1024x768" (hsync out of range)
(II) SIS(0): Not using default mode "1024x768" (hsync out of range)
(II) SIS(0): Not using default mode "1024x768" (hsync out of range)
(II) SIS(0): Not using default mode "1280x1024" (hsync out of range)
(II) SIS(0): Not using default mode "1280x1024" (hsync out of range)
(II) SIS(0): Not using default mode "1280x1024" (hsync out of range)
(II) SIS(0): Not using default mode "1280x1024" (hsync out of range)
(II) SIS(0): Not using default mode "1600x1200" (hsync out of range)
(II) SIS(0): Not using default mode "1600x1200" (bad mode 
clock/interlace/doublescan)
(II) SIS(0): Not using default mode "1600x1200" (bad mode 
clock/interlace/doublescan)
(II) SIS(0): Not using default mode "1600x1200" (bad mode 
clock/interlace/doublescan)
(II) SIS(0): Not using default mode "1600x1200" (bad mode 
clock/interlace/doublescan)
(II) SIS(0): Not using default mode "1600x1200" (bad mode 
clock/interlace/doublescan)
(II) SIS(0): Not using default mode "1600x1200" (bad mode 
clock/interlace/doublescan)
(II) SIS(0): Not using default mode "320x200" (vrefresh out of range)
(II) SIS(0): Not using default mode "512x384" (hsync out of range)
(II) SIS(0): Not using default mode "1920x1440" (bad mode 
clock/interlace/doublescan)
(II) SIS(0): Not using default mode "1920x1440" (bad mode 
clock/interlace/doublescan)
(II) SIS(0): Not using default mode "1920x1440" (bad mode 
clock/interlace/doublescan)
(II) SIS(0): Not using default mode "1920x1440" (bad mode 
clock/interlace/doublescan)
(II) SIS(0): Not using default mode "1920x1440" (bad mode 
clock/interlace/doublescan)
(II) SIS(0): Not using default mode "1920x1440" (bad mode 
clock/interlace/doublescan)
(II) SIS(0): Not using default mode "2048x1536" (bad mode 
clock/interlace/doublescan)
(II) SIS(0): Not using default mode "2048x1536" (bad mode 
clock/interlace/doublescan)
(II) SIS(0): Not using default mode "2048x1536" (bad mode 
clock/interlace/doublescan)
(II) SIS(0): Not using default mode "2048x1536" (bad mode 
clock/interlace/doublescan)
(II) SIS(0): Not using default mode "2048x1536" (bad mode 
clock/interlace/doublescan)
(II) SIS(0): Not using default mode "800x480" (hsync out of range)
(II) SIS(0): Not using default mode "800x480" (hsync out of range)
(II) SIS(0): Not using default mode "1024x576" (hsync out of range)
(II) SIS(0): Not using default mode "1024x576" (hsync out of range)
(II) SIS(0): Not using default mode "1024x576" (hsync out of range)
(II) SIS(0): Not using default mode "1280x720" (hsync out of range)
(II) SIS(0): Not using default mode "1280x720" (hsync out of range)
(II) SIS(0): Not using default mode "1280x720" (hsync out of range)
(II) SIS(0): Not using default mode "1280x960" (hsync out of range)
(II) SIS(0): Not using default mode "1280x960" (hsync out of range)
(II) SIS(0): Not using default mode "1280x768" (hsync out of range)
(II) SIS(0): Not using default mode "1280x768" (hsync out of range)
(II) SIS(0): Not using default mode "1280x768" (hsync out of range)
(II) SIS(0): Not using default mode "1400x1050" (hsync out of range)
(II) SIS(0): Not using default mode "1400x1050" (hsync out of range)
(II) SIS(0): Not using default mode "1152x864" (hsync out of range)
(II) SIS(0): Not using default mode "1152x864" (hsync out of range)
(II) SIS(0): Not using default mode "1152x864" (hsync out of range)
(II) SIS(0): Not using default mode "848x480" (hsync out of range)
(II) SIS(0): Not using default mode "848x480" (hsync out of range)
(II) SIS(0): Not using default mode "856x480" (hsync out of range)
(II) SIS(0): Not using default mode "1360x768" (hsync out of range)
(II) SIS(0): Not using default mode "1280x800" (hsync out of range)
(II) SIS(0): Not using default mode "1280x800" (hsync out of range)
(II) SIS(0): Not using default mode "1280x800" (hsync out of range)
(II) SIS(0): Not using default mode "1680x1050" (hsync out of range)
(II) SIS(0): Not using default mode "1280x854" (hsync out of range)
(II) SIS(0): Not using default mode "1280x854" (hsync out of range)
(II) SIS(0): Not using default mode "1280x854" (hsync out of range)
(II) SIS(0): Not using default mode "960x600" (width too large for 
virtual size)
(II) SIS(0): Not using default mode "960x540" (width too large for 
virtual size)
(II) SIS(0): Not using default mode "856x480" (width too large for 
virtual size)
(--) SIS(0): Virtual size is 800x600 (pitch 800)
(**) SIS(0): *Default mode "800x600": 40.0 MHz, 37.9 kHz, 60.3 Hz
(II) SIS(0): Modeline "800x600"x60.3   39.97  800 840 968 1056  600 601 
605 628 +hsync +vsync (37.9 kHz)
(**) SIS(0):  Default mode "800x600": 36.1 MHz, 35.2 kHz, 56.3 Hz
(II) SIS(0): Modeline "800x600"x56.3   36.06  800 824 896 1024  600 601 
603 625 +hsync +vsync (35.2 kHz)
(**) SIS(0):  Default mode "768x576": 35.0 MHz, 35.9 kHz, 60.1 Hz
(II) SIS(0): Modeline "768x576"x60.1   35.00  768 792 872 976  576 578 
581 597 +hsync +vsync (35.9 kHz)
(**) SIS(0):  Default mode "720x576": 32.7 MHz, 35.9 kHz, 60.1 Hz
(II) SIS(0): Modeline "720x576"x60.1   32.73  720 744 816 912  576 578 
581 597 +hsync +vsync (35.9 kHz)
(**) SIS(0):  Default mode "800x480": 39.8 MHz, 37.7 kHz, 60.0 Hz
(II) SIS(0): Modeline "800x480"x60.0   39.77  800 840 968 1056  480 552 
556 628 +hsync +vsync (37.7 kHz)
(**) SIS(0):  Default mode "720x480": 28.3 MHz, 31.6 kHz, 61.0 Hz
(II) SIS(0): Modeline "720x480"x61.0   28.28  720 728 840 896  480 490 
492 517 -hsync -vsync (31.6 kHz)
(**) SIS(0):  Default mode "640x480": 25.1 MHz, 31.3 kHz, 59.7 Hz
(II) SIS(0): Modeline "640x480"x59.7   25.06  640 656 752 800  480 490 
492 525 -hsync -vsync (31.3 kHz)
(**) SIS(0):  Default mode "400x300": 20.0 MHz, 37.9 kHz, 60.3 Hz (D)
(II) SIS(0): Modeline "400x300"x60.3   19.98  400 416 480 528  300 300 
302 314 doublescan +hsync +vsync (37.9 kHz)
(**) SIS(0):  Default mode "320x240": 12.5 MHz, 31.3 kHz, 60.7 Hz (D)
(II) SIS(0): Modeline "320x240"x60.7   12.53  320 328 376 400  240 245 
246 258 doublescan -hsync -vsync (31.3 kHz)
(==) SIS(0): DPI set to (96, 96)
(II) Loading sub module "fb"
(II) LoadModule: "fb"
(II) Loading /usr/lib/xorg/modules/libfb.so
(II) Module fb: vendor="X.Org Foundation"
    compiled for 1.7.1, module version = 1.0.0
    ABI class: X.Org ANSI C Emulation, version 0.4
(II) Loading sub module "xaa"
(II) LoadModule: "xaa"
(II) Loading /usr/lib/xorg/modules/libxaa.so
(II) Module xaa: vendor="X.Org Foundation"
    compiled for 1.7.1, module version = 1.2.1
    ABI class: X.Org Video Driver, version 6.0
(II) SIS(0): 2D acceleration enabled
(II) Loading sub module "vbe"
(II) LoadModule: "vbe"
(II) Reloading /usr/lib/xorg/modules/libvbe.so
(II) Loading sub module "int10"
(II) LoadModule: "int10"
(II) Reloading /usr/lib/xorg/modules/libint10.so
(II) SIS(0): initializing int10
(II) SIS(0): Primary V_BIOS segment is: 0xc000
(II) SIS(0): VESA BIOS detected
(II) SIS(0): VESA VBE Version 3.0
(II) SIS(0): VESA VBE Total Mem: 32768 kB
(II) SIS(0): VESA VBE OEM: XGI
(II) SIS(0): VESA VBE OEM Software Rev: 1.0
(II) SIS(0): VESA VBE OEM Vendor: XGI Technology, Inc.
(II) SIS(0): VESA VBE OEM Product: Volari Z9s
(II) SIS(0): VESA VBE OEM Product Rev: 1.09.05
(II) SIS(0): Setting standard mode 0x30
(II) SIS(0): Framebuffer from (0,0) to (799,32766)
(II) SIS(0): Using XFree86 Acceleration Architecture (XAA)
    Screen to screen bit blits
    Solid filled rectangles
    8x8 mono pattern filled rectangles
    8x8 color pattern filled rectangles
    Solid Lines
    Dashed Lines
    Setting up tile and stipple cache:
        32 128x128 slots
        32 256x256 slots
        16 512x512 slots
        32 8x8 color pattern slots
(==) SIS(0): Backing store disabled
(==) SIS(0): Silken mouse enabled
(==) SIS(0): DPMS enabled
(II) SIS(0): Initialized SISCTRL extension version 0.1
(II) SIS(0): Registered screen 0 with SISCTRL extension version 0.1
(==) RandR enabled
(II) Initializing built-in extension Generic Event Extension
(II) Initializing built-in extension SHAPE
(II) Initializing built-in extension MIT-SHM
(II) Initializing built-in extension XInputExtension
(II) Initializing built-in extension XTEST
(II) Initializing built-in extension BIG-REQUESTS
(II) Initializing built-in extension SYNC
(II) Initializing built-in extension XKEYBOARD
(II) Initializing built-in extension XC-MISC
(II) Initializing built-in extension XINERAMA
(II) Initializing built-in extension XFIXES
(II) Initializing built-in extension RENDER
(II) Initializing built-in extension RANDR
(II) Initializing built-in extension COMPOSITE
(II) Initializing built-in extension DAMAGE
(EE) AIGLX error: dlopen of /usr/lib/dri/swrast_dri.so failed 
(/usr/lib/dri/swrast_dri.so: cannot open shared object file: No such 
file or directory)
(EE) GLX: could not load software renderer
(II) GLX: no usable GL providers found for screen 0
(**) Option "Protocol" "auto"
(**) Option "Device" "/dev/event2"
(II) Mouse1: Setting mouse protocol to "PS/2"
(**) Mouse1: Device: "/dev/event2"
(**) Mouse1: Protocol: "auto"
(**) Option "CorePointer"
(**) Mouse1: always reports core events
(**) Option "Device" "/dev/event2"
(**) Option "Emulate3Buttons" "false"
(**) Option "ZAxisMapping" "4 5 6 7"
(**) Mouse1: ZAxisMapping: buttons 4, 5, 6 and 7
(**) Mouse1: Buttons: 11
(**) Mouse1: Sensitivity: 1
(II) XINPUT: Adding extended input device "Mouse1" (type: MOUSE)
(**) Mouse1: (accel) keeping acceleration scheme 1
(**) Mouse1: (accel) acceleration profile 0
(II) Mouse1: Setting mouse protocol to "PS/2"
(**) Option "CoreKeyboard"
(**) Keyboard1: always reports core events
(**) Option "Protocol" "standard"
(**) Keyboard1: Protocol: standard
(**) Option "XkbRules" "base"
(**) Keyboard1: XkbRules: "base"
(**) Option "XkbModel" "pc105"
(**) Keyboard1: XkbModel: "pc105"
(**) Option "XkbLayout" "fr"
(**) Keyboard1: XkbLayout: "fr"
(**) Option "XkbVariant" "nodeadkeys"
(**) Keyboard1: XkbVariant: "nodeadkeys"
(**) Option "CustomKeycodes" "off"
(**) Keyboard1: CustomKeycodes disabled
(II) XINPUT: Adding extended input device "Keyboard1" (type: KEYBOARD)
(II) UnloadModule: "mouse"
(II) UnloadModule: "kbd"
(II) SIS(0): Restoring by setting old mode 0x2e
(WW) SIS(0): xf86UnMapVidMem: cannot find region for [0xb7137000,0x10000]
(WW) SIS(0): xf86UnMapVidMem: cannot find region for [0xb5137000,0x2000000]

Thanks,
Damien.


Sebastian a ?crit :
> Hello,
>
>> I tried with latest snapshot. I still have problems to launch a X 
>> server.
>> With vesa and fbdev X drivers, it's OK, I can launch X server but 
>> only with depth 8, and resolution 800x600 for vesa and 600x480 for 
>> fbdev (framebuffer limit?). The problem is that I need depth 16 and 
>> 1024x600 resolution.
>
> You could check if the video BIOS allows higher resolutions for the 
> framebuffer. But you probably won't get widescreen this way.
>
> About the compiling and loading issues, I have no idea.
>
>> With SIS driver built in Buildroot, everything seems ok, no errors, 
>> but I only get a black screen. I tried a lot of options of the driver 
>> which seems to be useful but with no results.
>
> Newer versions of the Xorg server won't display the black-and-white 
> pattern anymore, but instead a black screen. Try to run some 
> application from the same console device and watch the screen, like in:
>
> # Xorg &
> # DISPLAY=:0.0 xclock &
>
> maybe the server is up and running, but you don't think it is?
>
>> I don't know how to resolve this problem. I need a working displaying 
>> in 1024x600x16 mode but this chip doesn't seems to be very used with 
>> Linux.
>
> I had some fun with SiS chipsets (SiS 315) myself, so I'm avoiding it. 
> Probably it isn't an option for you...
>
>> So if somebody has the begin of an idea to solve this, I accept 
>> everything.
>
> Try to post a full Xorg.0.log using the SiS driver, as it seems to be 
> the best working one for now.
>
> I do not know if the driver supports full modesetting (i.e. widescreen 
> resolutions not offered by the video BIOS).
>
> Best regards,
> Sebastian
>
>
