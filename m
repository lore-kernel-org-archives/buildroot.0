From: Will Wagner <will_wagner@carallon.com>
Date: Mon, 01 Sep 2008 16:15:37 +0100
Subject: [Buildroot] xserver help
In-Reply-To: <46a136670808291113v4695d5dcm1f6d8fa893869b8a@mail.gmail.com>
References: <48B83724.2060709@carallon.com>
	<46a136670808291113v4695d5dcm1f6d8fa893869b8a@mail.gmail.com>
Message-ID: <48BC0719.1010306@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

John Voltz wrote:

> First you need to decide whether you want to use the tinyX (also known 
> as kdrive or framebuffer X) or the modular X.org server.

I need modular X.org

  Then you need
> the X libraries, I would just select them all, unless your file system 
> space is limited. Then select the fonts you want. And last, if you are 
> building the modular system, you need the xdriver_xf86-video-intel for 
> your video, then the mouse (xdriver_xf86-input-mouse) and keyboard 
> (xdriver_xf86-input-keyboard) drivers.

Have done all this. Not sure which X applications I need.

  You will need to create an
> xorg.conf file for your system as well, and save it to 
> /etc/X11/xorg.conf. I think there is an example in the default target 
> skeleton directory in buildroot.

I am able to create a config file with X -configure

I could not find any examples in buildroot

When I try starting X I get the following:

# X -config xorg.conf.new
_XSERVTransSocketOpenCOTSServer: Unable to open socket for inet6
_XSERVTransOpen: transport open failed for inet6/vip:0
_XSERVTransMakeAllCOTSServerListeners: failed to open listener for inet6

X.Org X Server 1.4.1
Release Date: 5 September 2007
X Protocol Version 11, Revision 0
Build Operating System: Linux 2.6.25-2-486 i686
Current Operating System: Linux vip 2.6.26.3 #6 SMP PREEMPT Fri Aug 29 19:25:41
BST 2008 i686
Build Date: 29 August 2008  05:46:10PM

         Before reporting problems, check http://wiki.x.org
         to make sure that you have the latest version.
Module Loader present
Markers: (--) probed, (**) from config file, (==) default setting,
         (++) from command line, (!!) notice, (II) informational,
         (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/usr/var/log/Xorg.0.log", Time: Thu Jan 12 21:48:14 2006
(++) Using config file: "xorg.conf.new"
(WW) intel: No matching Device section for instance (BusID PCI:0:2:1) found
(II) Module "ddc" already built-in
(II) Module "i2c" already built-in
(EE) intel(0): SDVO: No active TMDS outputs (0x0000)
(EE) intel(0): SDVO: No active TMDS outputs (0x0000)
(EE) intel(0): Couldn't get SDVO clock rate multiplier
(EE) intel(0): Couldn't get SDVO clock rate multiplier
(EE) intel(0): Output Unknown-1 enabled but has no modes
(EE) intel(0): Output Unknown-2 enabled but has no modes
(II) Module "ramdac" already bui[  333.575105] [drm] Initialized i915 1.6.0 2006
0119 on minor 0
lt-in
modprobe: /etc/modprobe.d: No such file or directory
(EE) intel(0): Couldn't get SDVO clock rate multiplier
(EE) intel(0): Couldn't get SDVO clock rate multiplier
(EE) AIGLX error: dlopen of /usr/lib/dri/i915_dri.so failed (File not found)
(EE) AIGLX: reverting to software rendering
sh: /usr/bin/xkbcomp: not found
(EE) Error compiling keymap (server-0)
(EE) XKB: Couldn't compile keymap
(EE) XKB: Couldn't open rules file /usr/share/X11/xkb/rules/xorg
Could not init font path element /usr/lib/X11/fonts/OTF, removing from list!

Fatal server error:
could not open default font 'fixed'

Looking at what is in the root filesystem there indeed doesn't seem to be a fixed font 
folder but I can't find a package that would add them.

> 
> On your first boot you will also need to run fontconfig to build your 
> font cache, or it will take bloody ages for any applications to start in 
> X. Make sure your fonts end up in /usr/share/X11/fonts, or make a 
> symbolic link to them from there.
> 

I have lib fontconfig built but there is no application fontconfig. Do you mean you have 
to run the fc-cache command?

Also buildroot puts all the fonts into /usr/lib/X11/fonts but adding the sym link doesn't 
seem to help. Seems like all the font paths are a bit messed up and not sure quite where 
they should reside.

I guess this isn't a buildroot problem per se and so I'll try on the freedesktop list.

Thanks for your help.

Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
