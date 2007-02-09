From: F.Roch <f.roch@ibsdisplay.de>
Date: Fri, 09 Feb 2007 13:39:20 +0100
Subject: [Buildroot] Unresolved symbols when running Xorg
In-Reply-To: <45C8356B.4030107@ibsdisplay.de>
References: <45C8356B.4030107@ibsdisplay.de>
Message-ID: <45CC6B78.9040209@ibsdisplay.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi,

i managed to build Xorg for my target system (arm926t with softfloat).

i applyed the "lnx_video.c" part of this patch to remove unsupported 
ioperm syscalls :
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=234808

but when i try to run xorg (with the default configuration) i get the 
following messages
about unresolved symbols:

<snip>
# startx
hostname: uclibc: Unknown host

X Window System Version 6.8.2
Release Date: 9 February 2005
X Protocol Version 11, Revision 0, Release 6.8.2
Build Operating System: Linux 2.6.17-10-generic x86_64 [ELF]
Current Operating System: Linux uclibc 2.6.15.4 #12 Fri Feb 9 09:18:36 
CET 2007
armv5tejl
Build Date: 09 ??? 2007
        Before reporting problems, check http://wiki.X.Org
        to make sure that you have the latest version.
Module Loader present
Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Wed Dec 31 17:33:16 1969
(==) Using config file: "/etc/X11/xorg.conf"

(EE) FBDEV(0): FBIOBLANK: Invalid argument
Symbol __fixdfsi from module /usr/X11R6/lib/modules/input/mouse_drv.o is 
unresolved!
Symbol __adddf3 from module /usr/X11R6/lib/modules/input/mouse_drv.o is 
unresolved!
Symbol __subdf3 from module /usr/X11R6/lib/modules/input/mouse_drv.o is 
unresolved!
Symbol __floatsidf from module /usr/X11R6/lib/modules/input/mouse_drv.o 
is unresolved!
Symbol __fixdfsi from module /usr/X11R6/lib/modules/input/mouse_drv.o is 
unresolved!
Symbol __adddf3 from module /usr/X11R6/lib/modules/input/mouse_drv.o is 
unresolved!
Symbol __adddf3 from module /usr/X11R6/lib/modules/input/mouse_drv.o is 
unresolved!
Symbol __floatsidf from module /usr/X11R6/lib/modules/input/mouse_drv.o 
is unresolved!
Symbol __floatsidf from module /usr/X11R6/lib/modules/input/mouse_drv.o 
is unresolved!
Symbol __floatsidf from module /usr/X11R6/lib/modules/input/mouse_drv.o 
is unresolved!
Symbol __fixunsdfsi from module /usr/X11R6/lib/modules/libvbe.a is 
unresolved!
Symbol __floatsidf from module /usr/X11R6/lib/modules/libvbe.a is 
unresolved!
Symbol __adddf3 from module /usr/X11R6/lib/modules/libvbe.a is unresolved!
Symbol __floatsidf from module /usr/X11R6/lib/modules/libvbe.a is 
unresolved!
Symbol __fixsfsi from module /usr/X11R6/lib/modules/libvbe.a is unresolved!
Symbol __addsf3 from module /usr/X11R6/lib/modules/libvbe.a is unresolved!
Symbol __floatsisf from module /usr/X11R6/lib/modules/libvbe.a is 
unresolved!
Symbol __truncdfsf2 from module /usr/X11R6/lib/modules/libvbe.a is 
unresolved!
Symbol __adddf3 from module /usr/X11R6/lib/modules/libvbe.a is unresolved!
Symbol __floatsidf from module /usr/X11R6/lib/modules/libvbe.a is 
unresolved!
Symbol __extendsfdf2 from module /usr/X11R6/lib/modules/libvbe.a is 
unresolved!
Symbol __floatsisf from module /usr/X11R6/lib/modules/libvbe.a is 
unresolved!
Symbol __extendsfdf2 from module 
/usr/X11R6/lib/modules/fonts/libbitmap.a is unresolved!
Symbol __fixdfsi from module /usr/X11R6/lib/modules/fonts/libbitmap.a is 
unresolved!
Symbol __floatsidf from module /usr/X11R6/lib/modules/fonts/libbitmap.a 
is unresolved!
Symbol __fixdfsi from module /usr/X11R6/lib/modules/fonts/libbitmap.a is 
unresolved!
Symbol __ltsf2 from module /usr/X11R6/lib/modules/fonts/libbitmap.a is 
unresolved!
Symbol __gedf2 from module /usr/X11R6/lib/modules/fonts/libbitmap.a is 
unresolved!
Symbol __gtdf2 from module /usr/X11R6/lib/modules/fonts/libbitmap.a is 
unresolved!
</snip>

many more following

<snip>
Symbol __fixunsdfsi from module 
/usr/X11R6/lib/modules/extensions/libextmod.a is unresolved!
error opening security policy file /usr/X11R6/lib/X11/xserver/SecurityPolicy
(EE) xf86OpenSerial: Cannot open device /dev/input/mice
        No such file or directory.
(EE) xf86OpenSerial: Cannot open device /dev/psaux
        No such file or directory.
(EE) xf86OpenSerial: Cannot open device /dev/input/mice
        No such file or directory.
(EE) xf86OpenSerial: Cannot open device /dev/psaux
        No such file or directory.
Warning: font renderer for ".pcf" already registered at priority 0
Warning: font renderer for ".pcf.Z" already registered at priority 0
Warning: font renderer for ".pcf.gz" already registered at priority 0
Warning: font renderer for ".snf" already registered at priority 0
Warning: font renderer for ".snf.Z" already registered at priority 0
Warning: font renderer for ".snf.gz" already registered at priority 0
Warning: font renderer for ".bdf" already registered at priority 0
Warning: font renderer for ".bdf.Z" already registered at priority 0
Warning: font renderer for ".bdf.gz" already registered at priority 0
Warning: font renderer for ".pmf" already registered at priority 0


        This should not happen!
        An unresolved function was called!

Fatal server error:



Please consult the The X.Org Foundation support
         at http://wiki.X.Org
 for help.
Please also check the log file at "/var/log/Xorg.0.log" for additional 
informati
on.

XIO:  fatal IO error 104 (Connection reset by peer) on X server ":0.0"
      after 0 requests (0 known processed) with 0 events remaining.
#
</snip>

i googled for it and it seems that has something to do with the 
softfloat libs
but i don't know what to do about this ...

can someone point me in the right direction ?

i'm using:
buildroot-snapshot  from  2007-02-07
linux-headers 2.4.31
uClibc 0.9.28.1
binutils 2.17
gcc 3.4.6

thank you,
Frank Roch
