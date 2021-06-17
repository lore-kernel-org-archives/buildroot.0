From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 17 Jun 2021 23:20:49 +0200
Subject: [Buildroot] Problems with Xorg,
 either blank screen or "no screens found"
In-Reply-To: <c5f5d16e-8e6e-88b4-dacd-3684e2f726d7@gmx.de>
References: <c5f5d16e-8e6e-88b4-dacd-3684e2f726d7@gmx.de>
Message-ID: <20210617232049.74864c46@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Lukas,

On Tue, 15 Jun 2021 17:54:47 +0200, Lukas Hecht <mixolydisch@gmx.de> wrote:

> Hi guys,
> i'm currently building a system for an embedded AMD X86 system with an
> Radeon HD6250 GPU and i have problems with getting xorg to work. My
> configuration regarding xorg is mostly according to this tutorial:
> https://agentoss.wordpress.com/2011/03/06/building-a-tiny-x-org-linux-system-using-buildroot/
> If i include the vesa package for xorg, i get a blank screen after boot,
> without typing "root" or "startx". Is an automatic start of xorg an
> expected behaviour?
> If i do not include the vesa package, the system boots as expected and i
> can log in with "root" and try "startx" which doesn't work. But i've
> been able to save the logfile of this, see below. It looks like X can't
> find the screen and also not the graphics card, though an Ubuntu 20.10
> live boots flawlessly and is using the "radeon" driver.
> Any help would be very appreciated as i'm trying to get this to work for
> quite some time now. Thanks a lot!
> My buildroot config regarding X is as follows:
> BR2_PACKAGE_XORG7=y
> #
> # X11R7 Servers
> #
> BR2_PACKAGE_XSERVER_XORG_SERVER=y
> BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y
> # BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE is not set
> #
> # Optional Servers
> #
> # BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB is not set
> #
> # X11R7 Libraries
> #
> BR2_PACKAGE_LIBXCB=y
> BR2_PACKAGE_XCB_UTIL=y
> BR2_PACKAGE_XCB_UTIL_CURSOR=y
> BR2_PACKAGE_XCB_UTIL_IMAGE=y
> # BR2_PACKAGE_XCB_UTIL_KEYSYMS is not set
> BR2_PACKAGE_XCB_UTIL_RENDERUTIL=y
> # BR2_PACKAGE_XCB_UTIL_WM is not set
> # BR2_PACKAGE_XLIB_LIBFS is not set
> BR2_PACKAGE_XLIB_LIBICE=y
> BR2_PACKAGE_XLIB_LIBSM=y
> BR2_PACKAGE_XLIB_LIBX11=y
> # BR2_PACKAGE_XLIB_LIBXSCRNSAVER is not set
> BR2_PACKAGE_XLIB_LIBXAU=y
> BR2_PACKAGE_XLIB_LIBXAW=y
> BR2_PACKAGE_XLIB_LIBXCOMPOSITE=y
> BR2_PACKAGE_XLIB_LIBXCURSOR=y
> BR2_PACKAGE_XLIB_LIBXDAMAGE=y
> BR2_PACKAGE_XLIB_LIBXDMCP=y
> BR2_PACKAGE_XLIB_LIBXEXT=y
> BR2_PACKAGE_XLIB_LIBXFIXES=y
> BR2_PACKAGE_XLIB_LIBXFONT=y
> BR2_PACKAGE_XLIB_LIBXFONT2=y
> BR2_PACKAGE_XLIB_LIBXFT=y
> BR2_PACKAGE_XLIB_LIBXI=y
> BR2_PACKAGE_XLIB_LIBXINERAMA=y
> BR2_PACKAGE_XLIB_LIBXMU=y
> BR2_PACKAGE_XLIB_LIBXPM=y
> BR2_PACKAGE_XLIB_LIBXRANDR=y
> BR2_PACKAGE_XLIB_LIBXRENDER=y
> BR2_PACKAGE_XLIB_LIBXRES=y
> BR2_PACKAGE_XLIB_LIBXT=y
> # BR2_PACKAGE_XLIB_LIBXTST is not set
> # BR2_PACKAGE_XLIB_LIBXV is not set
> # BR2_PACKAGE_XLIB_LIBXVMC is not set
> # BR2_PACKAGE_XLIB_LIBXXF86DGA is not set
> BR2_PACKAGE_XLIB_LIBXXF86VM=y
> # BR2_PACKAGE_XLIB_LIBDMX is not set
> BR2_PACKAGE_XLIB_LIBFONTENC=y
> BR2_PACKAGE_XLIB_LIBXKBFILE=y
> BR2_PACKAGE_XLIB_LIBXSHMFENCE=y
> BR2_PACKAGE_XLIB_XTRANS=y
> #
> # X11R7 Applications
> #
> # BR2_PACKAGE_XAPP_APPRES is not set
> # BR2_PACKAGE_XAPP_BDFTOPCF is not set
> # BR2_PACKAGE_XAPP_BEFORELIGHT is not set
> # BR2_PACKAGE_XAPP_BITMAP is not set
> # BR2_PACKAGE_XAPP_EDITRES is not set
> # BR2_PACKAGE_XAPP_FONTTOSFNT is not set
> # BR2_PACKAGE_XAPP_FSLSFONTS is not set
> # BR2_PACKAGE_XAPP_FSTOBDF is not set
> # BR2_PACKAGE_XAPP_ICEAUTH is not set
> # BR2_PACKAGE_XAPP_ICO is not set
> # BR2_PACKAGE_XAPP_LISTRES is not set
> # BR2_PACKAGE_XAPP_LUIT is not set
> # BR2_PACKAGE_XAPP_MKFONTSCALE is not set
> # BR2_PACKAGE_XAPP_OCLOCK is not set
> # BR2_PACKAGE_XAPP_RGB is not set
> # BR2_PACKAGE_XAPP_RSTART is not set
> # BR2_PACKAGE_XAPP_SCRIPTS is not set
> BR2_PACKAGE_XAPP_SESSREG=y
> BR2_PACKAGE_XAPP_SETXKBMAP=y
> # BR2_PACKAGE_XAPP_SHOWFONT is not set
> # BR2_PACKAGE_XAPP_SMPROXY is not set
> BR2_PACKAGE_XAPP_TWM=y
> # BR2_PACKAGE_XAPP_VIEWRES is not set
> # BR2_PACKAGE_XAPP_X11PERF is not set
> BR2_PACKAGE_XAPP_XAUTH=y
> # BR2_PACKAGE_XAPP_XBACKLIGHT is not set
> # BR2_PACKAGE_XAPP_XBIFF is not set
> BR2_PACKAGE_XAPP_XCALC=y
> # BR2_PACKAGE_XAPP_XCLIPBOARD is not set
> BR2_PACKAGE_XAPP_XCLOCK=y
> # BR2_PACKAGE_XAPP_XCMSDB is not set
> # BR2_PACKAGE_XAPP_XCOMPMGR is not set
> BR2_PACKAGE_XAPP_XCONSOLE=y
> # BR2_PACKAGE_XAPP_XCURSORGEN is not set
> # BR2_PACKAGE_XAPP_XDBEDIZZY is not set
> # BR2_PACKAGE_XAPP_XDITVIEW is not set
> BR2_PACKAGE_XAPP_XDM=y
> # BR2_PACKAGE_XAPP_XDPYINFO is not set
> # BR2_PACKAGE_XAPP_XDRIINFO is not set
> BR2_PACKAGE_XAPP_XEDIT=y
> # BR2_PACKAGE_XAPP_XEV is not set
> BR2_PACKAGE_XAPP_XEYES=y
> # BR2_PACKAGE_XAPP_XF86DGA is not set
> # BR2_PACKAGE_XAPP_XFD is not set
> # BR2_PACKAGE_XAPP_XFINDPROXY is not set
> # BR2_PACKAGE_XAPP_XFONTSEL is not set
> # BR2_PACKAGE_XAPP_XFS is not set
> # BR2_PACKAGE_XAPP_XFSINFO is not set
> # BR2_PACKAGE_XAPP_XGAMMA is not set
> # BR2_PACKAGE_XAPP_XGC is not set
> # BR2_PACKAGE_XAPP_XHOST is not set
> BR2_PACKAGE_XAPP_XINIT=y
> BR2_PACKAGE_XAPP_XINPUT=y
> # BR2_PACKAGE_XAPP_XINPUT_CALIBRATOR is not set
> BR2_PACKAGE_XAPP_XKBCOMP=y
> BR2_PACKAGE_XAPP_XKBEVD=y
> # BR2_PACKAGE_XAPP_XKBPRINT is not set
> # BR2_PACKAGE_XAPP_XKBUTILS is not set
> # BR2_PACKAGE_XAPP_XKILL is not set
> # BR2_PACKAGE_XAPP_XLOAD is not set
> # BR2_PACKAGE_XAPP_XLOGO is not set
> # BR2_PACKAGE_XAPP_XLSATOMS is not set
> # BR2_PACKAGE_XAPP_XLSCLIENTS is not set
> # BR2_PACKAGE_XAPP_XLSFONTS is not set
> # BR2_PACKAGE_XAPP_XMAG is not set
> # BR2_PACKAGE_XAPP_XMAN is not set
> # BR2_PACKAGE_XAPP_XMESSAGE is not set
> # BR2_PACKAGE_XAPP_XMH is not set
> BR2_PACKAGE_XAPP_XMODMAP=y
> # BR2_PACKAGE_XAPP_XMORE is not set
> # BR2_PACKAGE_XAPP_XPR is not set
> # BR2_PACKAGE_XAPP_XPROP is not set
> # BR2_PACKAGE_XAPP_XRANDR is not set
> BR2_PACKAGE_XAPP_XRDB=y
> # BR2_PACKAGE_XAPP_XREFRESH is not set
> # BR2_PACKAGE_XAPP_XSET is not set
> # BR2_PACKAGE_XAPP_XSETMODE is not set
> # BR2_PACKAGE_XAPP_XSETPOINTER is not set
> # BR2_PACKAGE_XAPP_XSETROOT is not set
> # BR2_PACKAGE_XAPP_XSM is not set
> # BR2_PACKAGE_XAPP_XSTDCMAP is not set
> # BR2_PACKAGE_XAPP_XVIDTUNE is not set
> # BR2_PACKAGE_XAPP_XVINFO is not set
> # BR2_PACKAGE_XAPP_XWD is not set
> # BR2_PACKAGE_XAPP_XWININFO is not set
> # BR2_PACKAGE_XAPP_XWUD is not set
> #
> # X11R7 Drivers
> #
> BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV=y
> # BR2_PACKAGE_XDRIVER_XF86_INPUT_JOYSTICK is not set
> BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD=y
> BR2_PACKAGE_XDRIVER_XF86_INPUT_LIBINPUT=y
> BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE=y
> # BR2_PACKAGE_XDRIVER_XF86_INPUT_SYNAPTICS is not set
> BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB=y
> # BR2_PACKAGE_XDRIVER_XF86_INPUT_VMMOUSE is not set
> # BR2_PACKAGE_XDRIVER_XF86_VIDEO_AMDGPU is not set
> # BR2_PACKAGE_XDRIVER_XF86_VIDEO_ARK is not set
> # BR2_PACKAGE_XDRIVER_XF86_VIDEO_AST is not set
> BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI=y
> # BR2_PACKAGE_XDRIVER_XF86_VIDEO_CIRRUS is not set
> # BR2_PACKAGE_XDRIVER_XF86_VIDEO_DUMMY is not set
> BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBDEV=y
> # BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBTURBO is not set
> # BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLINT is not set
> # BR2_PACKAGE_XDRIVER_XF86_VIDEO_I128 is not set
> # BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL is not set
> # BR2_PACKAGE_XDRIVER_XF86_VIDEO_MACH64 is not set
> # BR2_PACKAGE_XDRIVER_XF86_VIDEO_MGA is not set
> # BR2_PACKAGE_XDRIVER_XF86_VIDEO_NEOMAGIC is not set
> # BR2_PACKAGE_XDRIVER_XF86_VIDEO_NOUVEAU is not set
> # BR2_PACKAGE_XDRIVER_XF86_VIDEO_NV is not set
> # BR2_PACKAGE_XDRIVER_XF86_VIDEO_OPENCHROME is not set
> # BR2_PACKAGE_XDRIVER_XF86_VIDEO_QXL is not set
> # BR2_PACKAGE_XDRIVER_XF86_VIDEO_R128 is not set
> # BR2_PACKAGE_XDRIVER_XF86_VIDEO_SAVAGE is not set
> # BR2_PACKAGE_XDRIVER_XF86_VIDEO_SILICONMOTION is not set
> # BR2_PACKAGE_XDRIVER_XF86_VIDEO_SIS is not set
> # BR2_PACKAGE_XDRIVER_XF86_VIDEO_TDFX is not set
> # BR2_PACKAGE_XDRIVER_XF86_VIDEO_TGA is not set
> # BR2_PACKAGE_XDRIVER_XF86_VIDEO_TRIDENT is not set
> BR2_PACKAGE_XDRIVER_XF86_VIDEO_VESA=y
> # BR2_PACKAGE_XDRIVER_XF86_VIDEO_VMWARE is not set
> # BR2_PACKAGE_XDRIVER_XF86_VIDEO_VOODOO is not set
> #
> # X11R7 Fonts
> #
> BR2_PACKAGE_XFONT_FONT_UTIL=y
> BR2_PACKAGE_XFONT_ENCODINGS=y
> # BR2_PACKAGE_XFONT_FONT_ADOBE_100DPI is not set
> # BR2_PACKAGE_XFONT_FONT_ADOBE_75DPI is not set
> # BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_100DPI is not set
> # BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_75DPI is not set
> # BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_TYPE1 is not set
> BR2_PACKAGE_XFONT_FONT_ALIAS=y
> # BR2_PACKAGE_XFONT_FONT_ARABIC_MISC is not set
> # BR2_PACKAGE_XFONT_FONT_BH_100DPI is not set
> # BR2_PACKAGE_XFONT_FONT_BH_75DPI is not set
> # BR2_PACKAGE_XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI is not set
> # BR2_PACKAGE_XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI is not set
> # BR2_PACKAGE_XFONT_FONT_BH_TTF is not set
> # BR2_PACKAGE_XFONT_FONT_BH_TYPE1 is not set
> # BR2_PACKAGE_XFONT_FONT_BITSTREAM_100DPI is not set
> # BR2_PACKAGE_XFONT_FONT_BITSTREAM_75DPI is not set
> # BR2_PACKAGE_XFONT_FONT_BITSTREAM_TYPE1 is not set
> # BR2_PACKAGE_XFONT_FONT_CRONYX_CYRILLIC is not set
> BR2_PACKAGE_XFONT_FONT_CURSOR_MISC=y
> # BR2_PACKAGE_XFONT_FONT_DAEWOO_MISC is not set
> # BR2_PACKAGE_XFONT_FONT_DEC_MISC is not set
> # BR2_PACKAGE_XFONT_FONT_IBM_TYPE1 is not set
> # BR2_PACKAGE_XFONT_FONT_ISAS_MISC is not set
> # BR2_PACKAGE_XFONT_FONT_JIS_MISC is not set
> # BR2_PACKAGE_XFONT_FONT_MICRO_MISC is not set
> # BR2_PACKAGE_XFONT_FONT_MISC_CYRILLIC is not set
> # BR2_PACKAGE_XFONT_FONT_MISC_ETHIOPIC is not set
> # BR2_PACKAGE_XFONT_FONT_MISC_MELTHO is not set
> BR2_PACKAGE_XFONT_FONT_MISC_MISC=y
> # BR2_PACKAGE_XFONT_FONT_MUTT_MISC is not set
> # BR2_PACKAGE_XFONT_FONT_SCHUMACHER_MISC is not set
> # BR2_PACKAGE_XFONT_FONT_SCREEN_CYRILLIC is not set
> # BR2_PACKAGE_XFONT_FONT_SONY_MISC is not set
> # BR2_PACKAGE_XFONT_FONT_SUN_MISC is not set
> # BR2_PACKAGE_XFONT_FONT_WINITZKI_CYRILLIC is not set
> # BR2_PACKAGE_XFONT_FONT_XFREE86_TYPE1 is not set
> #
> # X11R7 X protocols
> #
> BR2_PACKAGE_XCB_PROTO=y
> BR2_PACKAGE_XORGPROTO=y
> #
> # X11R7 Utilities
> #
> BR2_PACKAGE_XUTIL_MAKEDEPEND=y
> BR2_PACKAGE_MCOOKIE=y
> #
> # X11R7 Other data
> #
> BR2_PACKAGE_XDATA_XBITMAPS=y
> # BR2_PACKAGE_XDATA_XCURSOR_THEMES is not set
> # BR2_PACKAGE_XCURSOR_TRANSPARENT_THEME is not set
> #
> # X applications
> #
> # BR2_PACKAGE_ALSAMIXERGUI is not set
> # BR2_PACKAGE_APITRACE is not set
> # BR2_PACKAGE_DILLO is not set
> # BR2_PACKAGE_DOCKER is not set
> # BR2_PACKAGE_FEH is not set
> Logfile from unsuccessful attempt of starting x:
> [??? 19.228]
> X.Org X Server 1.20.10
> X Protocol Version 11, Revision 0
> [??? 19.228] Build Operating System: Linux 5.8.0-53-generic x86_64
> [??? 19.228] Current Operating System: Linux buildroot 4.18.10 #1 SMP
> Thu Jun 10 23:20:02 CEST 2021 x86_64
> [??? 19.228] Kernel command line: BOOT_IMAGE=/boot/bzImage
> root=/dev/sda1 rootwait console=tty1
> [??? 19.229] Build Date: 10 June 2021? 11:11:04PM
> [??? 19.229]
> [??? 19.229] Current version of pixman: 0.40.0
> [??? 19.229] ?? ?Before reporting problems, check http://wiki.x.org
>  ?? ?to make sure that you have the latest version.
> [??? 19.229] Markers: (--) probed, (**) from config file, (==) default
> setting,
>  ?? ?(++) from command line, (!!) notice, (II) informational,
>  ?? ?(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
> [??? 19.231] (==) Log file: "/var/log/Xorg.0.log", Time: Fri Feb? 4
> 06:31:27 2011
> [??? 19.231] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
> [??? 19.232] (==) No Layout section.? Using the first Screen section.
> [??? 19.232] (==) No screen section available. Using defaults.
> [??? 19.232] (**) |-->Screen "Default Screen Section" (0)
> [??? 19.232] (**) |?? |-->Monitor "<default monitor>"
> [??? 19.234] (==) No monitor specified for screen "Default Screen Section".
>  ?? ?Using a default monitor configuration.
> [??? 19.234] (==) Automatically adding devices
> [??? 19.234] (==) Automatically enabling devices
> [??? 19.234] (==) Automatically adding GPU devices
> [??? 19.234] (==) Max clients allowed: 256, resource mask: 0x1fffff
> [??? 19.234] (WW) The directory "/usr/share/fonts/X11//TTF/" does not exist.
> [??? 19.234] ?? ?Entry deleted from font path.
> [??? 19.234] (WW) The directory "/usr/share/fonts/X11//OTF/" does not exist.
> [??? 19.234] ?? ?Entry deleted from font path.
> [??? 19.234] (WW) The directory "/usr/share/fonts/X11//Type1/" does not
> exist.
> [??? 19.234] ?? ?Entry deleted from font path.
> [??? 19.234] (WW) `fonts.dir' not found (or not valid) in
> "/usr/share/fonts/X11//100dpi/".
> [??? 19.234] ?? ?Entry deleted from font path.
> [??? 19.234] ?? ?(Run 'mkfontdir' on "/usr/share/fonts/X11//100dpi/").
> [??? 19.234] (WW) `fonts.dir' not found (or not valid) in
> "/usr/share/fonts/X11//75dpi/".
> [??? 19.234] ?? ?Entry deleted from font path.
> [??? 19.234] ?? ?(Run 'mkfontdir' on "/usr/share/fonts/X11//75dpi/").
> [??? 19.234] (==) FontPath set to:
>  ?? ?/usr/share/fonts/X11//misc/
> [??? 19.234] (==) ModulePath set to "/usr/lib/xorg/modules"
> [??? 19.234] (II) The server relies on udev to provide the list of input
> devices.
>  ?? ?If no devices become available, reconfigure udev or disable
> AutoAddDevices.
> [??? 19.234] (II) Loader magic: 0x612c40
> [??? 19.234] (II) Module ABI versions:
> [??? 19.234] ?? ?X.Org ANSI C Emulation: 0.4
> [??? 19.234] ?? ?X.Org Video Driver: 24.1
> [??? 19.234] ?? ?X.Org XInput driver : 24.1
> [??? 19.234] ?? ?X.Org Server Extension : 10.0
> [??? 19.246] (--) PCI:*(0 at 0:1:0) 1002:9804:1002:0123 rev 0, Mem @
> 0x80000000/268435456, 0x90400000/262144, I/O @ 0x00005000/256, BIOS @
> 0x????????/131072
> [??? 19.246] (II) Open ACPI successful (/var/run/acpid.socket)
> [??? 19.246] (II) LoadModule: "glx"
> [??? 19.247] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
> [??? 19.257] (II) Module glx: vendor="X.Org Foundation"
> [??? 19.257] ?? ?compiled for 1.20.10, module version = 1.0.0
> [??? 19.257] ?? ?ABI class: X.Org Server Extension, version 10.0
> [??? 19.257] (==) Matched ati as autoconfigured driver 0
> [??? 19.257] (==) Matched modesetting as autoconfigured driver 1
> [??? 19.257] (==) Matched fbdev as autoconfigured driver 2
> [??? 19.257] (==) Matched vesa as autoconfigured driver 3
> [??? 19.257] (==) Assigned the driver to the xf86ConfigLayout
> [??? 19.257] (II) LoadModule: "ati"
> [??? 19.257] (II) Loading /usr/lib/xorg/modules/drivers/ati_drv.so
> [??? 19.258] (II) Module ati: vendor="X.Org Foundation"
> [??? 19.258] ?? ?compiled for 1.20.10, module version = 19.1.0
> [??? 19.258] ?? ?Module class: X.Org Video Driver
> [??? 19.258] ?? ?ABI class: X.Org Video Driver, version 24.1
> [??? 22.456] (II) LoadModule: "radeon"
> [??? 22.457] (II) Loading /usr/lib/xorg/modules/drivers/radeon_drv.so
> [??? 22.458] (II) Module radeon: vendor="X.Org Foundation"
> [??? 22.458] ?? ?compiled for 1.20.10, module version = 19.1.0
> [??? 22.458] ?? ?Module class: X.Org Video Driver
> [??? 22.458] ?? ?ABI class: X.Org Video Driver, version 24.1
> [??? 22.458] (II) LoadModule: "modesetting"
> [??? 22.458] (II) Loading /usr/lib/xorg/modules/drivers/modesetting_drv.so
> [??? 22.459] (II) Module modesetting: vendor="X.Org Foundation"
> [??? 22.459] ?? ?compiled for 1.20.10, module version = 1.20.10
> [??? 22.459] ?? ?Module class: X.Org Video Driver
> [??? 22.459] ?? ?ABI class: X.Org Video Driver, version 24.1
> [??? 22.459] (II) LoadModule: "fbdev"
> [??? 22.459] (II) Loading /usr/lib/xorg/modules/drivers/fbdev_drv.so
> [??? 22.459] (II) Module fbdev: vendor="X.Org Foundation"
> [??? 22.459] ?? ?compiled for 1.20.10, module version = 0.5.0
> [??? 22.459] ?? ?Module class: X.Org Video Driver
> [??? 22.459] ?? ?ABI class: X.Org Video Driver, version 24.1
> [??? 22.459] (II) LoadModule: "vesa"
> [??? 22.460] (WW) Warning, couldn't open module vesa
> [??? 22.460] (EE) Failed to load module "vesa" (module does not exist, 0)
> [??? 22.460] (II) RADEON: Driver for ATI/AMD Radeon chipsets:
>  ?? ?ATI Radeon Mobility X600 (M24), ATI FireMV 2400,
>  ?? ?ATI Radeon Mobility X300 (M24), ATI FireGL M24 GL,
>  ?? ?ATI Radeon X600 (RV380), ATI FireGL V3200 (RV380),
>  ?? ?ATI Radeon IGP320 (A3), ATI Radeon IGP330/340/350 (A4),
>  ?? ?ATI Radeon 9500, ATI Radeon 9600TX, ATI FireGL Z1, ATI Radeon 9800SE,
>  ?? ?ATI Radeon 9800, ATI FireGL X2, ATI Radeon 9600, ATI Radeon 9600SE,
>  ?? ?ATI Radeon 9600XT, ATI FireGL T2, ATI Radeon 9650, ATI FireGL RV360,
>  ?? ?ATI Radeon 7000 IGP (A4+), ATI Radeon 8500 AIW,
>  ?? ?ATI Radeon IGP320M (U1), ATI Radeon IGP330M/340M/350M (U2),
>  ?? ?ATI Radeon Mobility 7000 IGP, ATI Radeon 9000/PRO, ATI Radeon 9000,
>  ?? ?ATI Radeon X800 (R420), ATI Radeon X800PRO (R420),
>  ?? ?ATI Radeon X800SE (R420), ATI FireGL X3 (R420),
>  ?? ?ATI Radeon Mobility 9800 (M18), ATI Radeon X800 SE (R420),
>  ?? ?ATI Radeon X800XT (R420), ATI Radeon X800 VE (R420),
>  ?? ?ATI Radeon X850 (R480), ATI Radeon X850 XT (R480),
>  ?? ?ATI Radeon X850 SE (R480), ATI Radeon X850 PRO (R480),
>  ?? ?ATI Radeon X850 XT PE (R480), ATI Radeon Mobility M7,
>  ?? ?ATI Mobility FireGL 7800 M7, ATI Radeon Mobility M6,
>  ?? ?ATI FireGL Mobility 9000 (M9), ATI Radeon Mobility 9000 (M9),
>  ?? ?ATI Radeon 9700 Pro, ATI Radeon 9700/9500Pro, ATI FireGL X1,
>  ?? ?ATI Radeon 9800PRO, ATI Radeon 9800XT,
>  ?? ?ATI Radeon Mobility 9600/9700 (M10/M11),
>  ?? ?ATI Radeon Mobility 9600 (M10), ATI Radeon Mobility 9600 (M11),
>  ?? ?ATI FireGL Mobility T2 (M10), ATI FireGL Mobility T2e (M11),
>  ?? ?ATI Radeon, ATI FireGL 8700/8800, ATI Radeon 8500, ATI Radeon 9100,
>  ?? ?ATI Radeon 7500, ATI Radeon VE/7000, ATI ES1000,
>  ?? ?ATI Radeon Mobility X300 (M22), ATI Radeon Mobility X600 SE (M24C),
>  ?? ?ATI FireGL M22 GL, ATI Radeon X800 (R423), ATI Radeon X800PRO (R423),
>  ?? ?ATI Radeon X800LE (R423), ATI Radeon X800SE (R423),
>  ?? ?ATI Radeon X800 XTP (R430), ATI Radeon X800 XL (R430),
>  ?? ?ATI Radeon X800 SE (R430), ATI Radeon X800 (R430),
>  ?? ?ATI FireGL V7100 (R423), ATI FireGL V5100 (R423),
>  ?? ?ATI FireGL unknown (R423), ATI Mobility FireGL V5000 (M26),
>  ?? ?ATI Mobility Radeon X700 XL (M26), ATI Mobility Radeon X700 (M26),
>  ?? ?ATI Radeon X550XTX, ATI Radeon 9100 IGP (A5),
>  ?? ?ATI Radeon Mobility 9100 IGP (U3), ATI Radeon XPRESS 200,
>  ?? ?ATI Radeon XPRESS 200M, ATI Radeon 9250, ATI Radeon 9200,
>  ?? ?ATI Radeon 9200SE, ATI FireMV 2200, ATI Radeon X300 (RV370),
>  ?? ?ATI Radeon X600 (RV370), ATI Radeon X550 (RV370),
>  ?? ?ATI FireGL V3100 (RV370), ATI FireMV 2200 PCIE (RV370),
>  ?? ?ATI Radeon Mobility 9200 (M9+), ATI Mobility Radeon X800 XT (M28),
>  ?? ?ATI Mobility FireGL V5100 (M28), ATI Mobility Radeon X800 (M28),
>  ?? ?ATI Radeon X850, ATI unknown Radeon / FireGL (R480),
>  ?? ?ATI Radeon X800XT (R423), ATI FireGL V5000 (RV410),
>  ?? ?ATI Radeon X700 XT (RV410), ATI Radeon X700 PRO (RV410),
>  ?? ?ATI Radeon X700 SE (RV410), ATI Radeon X700 (RV410),
>  ?? ?ATI Radeon X1800, ATI Mobility Radeon X1800 XT,
>  ?? ?ATI Mobility Radeon X1800, ATI Mobility FireGL V7200,
>  ?? ?ATI FireGL V7200, ATI FireGL V5300, ATI Mobility FireGL V7100,
>  ?? ?ATI FireGL V7300, ATI FireGL V7350, ATI Radeon X1600, ATI RV505,
>  ?? ?ATI Radeon X1300/X1550, ATI Radeon X1550, ATI M54-GL,
>  ?? ?ATI Mobility Radeon X1400, ATI Radeon X1550 64-bit,
>  ?? ?ATI Mobility Radeon X1300, ATI Radeon X1300, ATI FireGL V3300,
>  ?? ?ATI FireGL V3350, ATI Mobility Radeon X1450,
>  ?? ?ATI Mobility Radeon X2300, ATI Mobility Radeon X1350,
>  ?? ?ATI FireMV 2250, ATI Radeon X1650, ATI Mobility FireGL V5200,
>  ?? ?ATI Mobility Radeon X1600, ATI Radeon X1300 XT/X1600 Pro,
>  ?? ?ATI FireGL V3400, ATI Mobility FireGL V5250,
>  ?? ?ATI Mobility Radeon X1700, ATI Mobility Radeon X1700 XT,
>  ?? ?ATI FireGL V5200, ATI Radeon X2300HD, ATI Mobility Radeon HD 2300,
>  ?? ?ATI Radeon X1950, ATI Radeon X1900, ATI AMD Stream Processor,
>  ?? ?ATI RV560, ATI Mobility Radeon X1900, ATI Radeon X1950 GT, ATI RV570,
>  ?? ?ATI FireGL V7400, ATI Radeon 9100 PRO IGP,
>  ?? ?ATI Radeon Mobility 9200 IGP, ATI Radeon X1200, ATI RS740,
>  ?? ?ATI RS740M, ATI Radeon HD 2900 XT, ATI Radeon HD 2900 Pro,
>  ?? ?ATI Radeon HD 2900 GT, ATI FireGL V8650, ATI FireGL V8600,
>  ?? ?ATI FireGL V7600, ATI Radeon 4800 Series, ATI Radeon HD 4870 x2,
>  ?? ?ATI Radeon HD 4850 x2, ATI FirePro V8750 (FireGL),
>  ?? ?ATI FirePro V7760 (FireGL), ATI Mobility RADEON HD 4850,
>  ?? ?ATI Mobility RADEON HD 4850 X2, ATI FirePro RV770,
>  ?? ?AMD FireStream 9270, AMD FireStream 9250, ATI FirePro V8700 (FireGL),
>  ?? ?ATI Mobility RADEON HD 4870, ATI Mobility RADEON M98,
>  ?? ?ATI FirePro M7750, ATI M98, ATI Mobility Radeon HD 4650,
>  ?? ?ATI Radeon RV730 (AGP), ATI Mobility Radeon HD 4670,
>  ?? ?ATI FirePro M5750, ATI RV730XT [Radeon HD 4670], ATI RADEON E4600,
>  ?? ?ATI Radeon HD 4600 Series, ATI RV730 PRO [Radeon HD 4650],
>  ?? ?ATI FirePro V7750 (FireGL), ATI FirePro V5700 (FireGL),
>  ?? ?ATI FirePro V3750 (FireGL), ATI Mobility Radeon HD 4830,
>  ?? ?ATI Mobility Radeon HD 4850, ATI FirePro M7740, ATI RV740,
>  ?? ?ATI Radeon HD 4770, ATI Radeon HD 4700 Series, ATI RV610,
>  ?? ?ATI Radeon HD 2400 XT, ATI Radeon HD 2400 Pro,
>  ?? ?ATI Radeon HD 2400 PRO AGP, ATI FireGL V4000, ATI Radeon HD 2350,
>  ?? ?ATI Mobility Radeon HD 2400 XT, ATI Mobility Radeon HD 2400,
>  ?? ?ATI RADEON E2400, ATI FireMV 2260, ATI RV670, ATI Radeon HD3870,
>  ?? ?ATI Mobility Radeon HD 3850, ATI Radeon HD3850,
>  ?? ?ATI Mobility Radeon HD 3850 X2, ATI Mobility Radeon HD 3870,
>  ?? ?ATI Mobility Radeon HD 3870 X2, ATI Radeon HD3870 X2,
>  ?? ?ATI FireGL V7700, ATI Radeon HD3690, AMD Firestream 9170,
>  ?? ?ATI Radeon HD 4550, ATI Radeon RV710, ATI Radeon HD 4350,
>  ?? ?ATI Mobility Radeon 4300 Series, ATI Mobility Radeon 4500 Series,
>  ?? ?ATI FirePro RG220, ATI Mobility Radeon 4330, ATI RV630,
>  ?? ?ATI Mobility Radeon HD 2600, ATI Mobility Radeon HD 2600 XT,
>  ?? ?ATI Radeon HD 2600 XT AGP, ATI Radeon HD 2600 Pro AGP,
>  ?? ?ATI Radeon HD 2600 XT, ATI Radeon HD 2600 Pro, ATI Gemini RV630,
>  ?? ?ATI Gemini Mobility Radeon HD 2600 XT, ATI FireGL V5600,
>  ?? ?ATI FireGL V3600, ATI Radeon HD 2600 LE,
>  ?? ?ATI Mobility FireGL Graphics Processor, ATI Radeon HD 3470,
>  ?? ?ATI Mobility Radeon HD 3430, ATI Mobility Radeon HD 3400 Series,
>  ?? ?ATI Radeon HD 3450, ATI Radeon HD 3430, ATI FirePro V3700,
>  ?? ?ATI FireMV 2450, ATI Radeon HD 3600 Series, ATI Radeon HD 3650 AGP,
>  ?? ?ATI Radeon HD 3600 PRO, ATI Radeon HD 3600 XT,
>  ?? ?ATI Mobility Radeon HD 3650, ATI Mobility Radeon HD 3670,
>  ?? ?ATI Mobility FireGL V5700, ATI Mobility FireGL V5725,
>  ?? ?ATI Radeon HD 3200 Graphics, ATI Radeon 3100 Graphics,
>  ?? ?ATI Radeon HD 3300 Graphics, ATI Radeon 3000 Graphics, SUMO, SUMO2,
>  ?? ?ATI Radeon HD 4200, ATI Radeon 4100, ATI Mobility Radeon HD 4200,
>  ?? ?ATI Mobility Radeon 4100, ATI Radeon HD 4290, ATI Radeon HD 4250,
>  ?? ?AMD Radeon HD 6310 Graphics, AMD Radeon HD 6250 Graphics,
>  ?? ?AMD Radeon HD 6300 Series Graphics,
>  ?? ?AMD Radeon HD 6200 Series Graphics, PALM, CYPRESS,
>  ?? ?ATI FirePro (FireGL) Graphics Adapter, AMD Firestream 9370,
>  ?? ?AMD Firestream 9350, ATI Radeon HD 5800 Series,
>  ?? ?ATI Radeon HD 5900 Series, ATI Mobility Radeon HD 5800 Series,
>  ?? ?ATI Radeon HD 5700 Series, ATI Radeon HD 6700 Series,
>  ?? ?ATI Mobility Radeon HD 5000 Series, ATI Mobility Radeon HD 5570,
>  ?? ?ATI Radeon HD 5670, ATI Radeon HD 5570, ATI Radeon HD 5500 Series,
>  ?? ?REDWOOD, ATI Mobility Radeon Graphics, CEDAR, ATI FirePro 2270,
>  ?? ?ATI Radeon HD 5450, CAYMAN, AMD Radeon HD 6900 Series,
>  ?? ?AMD Radeon HD 6900M Series, Mobility Radeon HD 6000 Series, BARTS,
>  ?? ?AMD Radeon HD 6800 Series, AMD Radeon HD 6700 Series, TURKS, CAICOS,
>  ?? ?ARUBA, TAHITI, PITCAIRN, VERDE, OLAND, HAINAN, BONAIRE, KABINI,
>  ?? ?MULLINS, KAVERI, HAWAII
> [??? 22.463] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
> [??? 22.463] (II) FBDEV: driver for framebuffer: fbdev
> [??? 22.463] (++) using VT number 1
> [??? 22.464] (II) [KMS] drm report modesetting isn't supported.
> [??? 22.464] (EE) open /dev/dri/card0: No such file or directory
> [??? 22.464] (WW) Falling back to old probe method for modesetting
> [??? 22.464] (EE) open /dev/dri/card0: No such file or directory

Kernel option/module missing/not loaded?


> [??? 22.464] (II) Loading sub module "fbdevhw"
> [??? 22.464] (II) LoadModule: "fbdevhw"
> [??? 22.464] (II) Loading /usr/lib/xorg/modules/libfbdevhw.so
> [??? 22.465] (II) Module fbdevhw: vendor="X.Org Foundation"
> [??? 22.465] ?? ?compiled for 1.20.10, module version = 0.0.2
> [??? 22.465] ?? ?ABI class: X.Org Video Driver, version 24.1
> [??? 22.465] (EE) Unable to find a valid framebuffer device
> [??? 22.465] (WW) Falling back to old probe method for fbdev
> [??? 22.466] (II) Loading sub module "fbdevhw"
> [??? 22.466] (II) LoadModule: "fbdevhw"
> [??? 22.466] (II) Loading /usr/lib/xorg/modules/libfbdevhw.so
> [??? 22.466] (II) Module fbdevhw: vendor="X.Org Foundation"
> [??? 22.466] ?? ?compiled for 1.20.10, module version = 0.0.2
> [??? 22.466] ?? ?ABI class: X.Org Video Driver, version 24.1
> [??? 22.466] (EE) open /dev/fb0: No such file or directory

Same here....

Regards,
Peter

> [??? 22.466] (EE) Screen 0 deleted because of no matching config section.
> [??? 22.466] (II) UnloadModule: "radeon"
> [??? 22.466] (EE) Screen 0 deleted because of no matching config section.
> [??? 22.466] (II) UnloadModule: "modesetting"
> [??? 22.466] (EE) Screen 0 deleted because of no matching config section.
> [??? 22.466] (II) UnloadModule: "fbdev"
> [??? 22.466] (II) UnloadSubModule: "fbdevhw"
> [??? 22.466] (EE) Device(s) detected, but none match those in the config
> file.
> [??? 22.466] (EE)
> Fatal server error:
> [??? 22.466] (EE) no screens found(EE)
> [??? 22.466] (EE)
> Please consult the The X.Org Foundation support
>  ?? ? at http://wiki.x.org
>  ?for help.
> [??? 22.466] (EE) Please also check the log file at
> "/var/log/Xorg.0.log" for additional information.
> [??? 22.467] (EE)
> [??? 22.467] (EE) Server terminated with error (1). Closing log file.
