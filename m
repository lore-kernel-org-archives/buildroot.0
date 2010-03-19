From: Damien Borie <dbe@terawatt.fr>
Date: Fri, 19 Mar 2010 17:32:43 +0100
Subject: [Buildroot] Xorg configuration for XGI chip
Message-ID: <4BA3A72B.3010009@terawatt.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.

I have to configure my Xorg X server to use a XGI Volari z9s chip. I'm 
not very familiar with this and all I tried for now only make a black 
screen.
I tried to use XGI driver from Buildroot, SIS driver from Buildroot, and 
tried to install XGIZ driver downloaded from XGI website, but it's not 
working.
I think I must insist with one of these drivers but I don't know which 
one really works.

With SIS driver, when I interrupt startx, my console re appears.
"startx" command result  with sis driver :
X.Org X Server 1.5.3
Release Date: 5 November 2008
X Protocol Version 11, Revision 0
Build Operating System: Linux 2.6.25-2-686 i686
Current Operating System: Linux matrix5 2.6.32 #3 PREEMPT Thu Mar 18 
10:32:53 CET 2010 i586
Build Date: 16 March 2010  05:36:01PM

        Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/usr/var/log/Xorg.0.log", Time: Sat Mar 20 00:28:53 2010
(==) Using config file: "/etc/X11/xorg.conf"
(EE) AIGLX error: dlopen of /usr/lib/dri/swrast_dri.so failed 
(/usr/lib/dri/swrast_dri.so: cannot open shared object file: No such 
file or directory)
(EE) GLX: could not load software renderer
Could not init font path element /usr/lib/X11/fonts/TTF/, removing from 
list!
Could not init font path element /usr/lib/X11/fonts/OTF, removing from list!
Could not init font path element /usr/lib/X11/fonts/Type1/, removing 
from list!


With XGI driver, the screen stay black forever.
"startx command result :
X.Org X Server 1.5.3
Release Date: 5 November 2008
X Protocol Version 11, Revision 0
Build Operating System: Linux 2.6.25-2-686 i686
Current Operating System: Linux matrix5 2.6.32 #3 PREEMPT Thu Mar 18 
10:32:53 CET 2010 i586
Build Date: 16 March 2010  05:36:01PM

        Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/usr/var/log/Xorg.0.log", Time: Sat Mar 20 00:30:05 2010
(==) Using config file: "/etc/X11/xorg.conf"
XGIPreInit
XGI_InitVBIOSData  VBType = 10
XGI_New_GetVBType  VBType = 0
XGIScreenInit
492 Part2 0 = ff 497 Part2 0 = ff Part2 0 = ff AdjustFrame 0
(EE) AIGLX error: dlopen of /usr/lib/dri/swrast_dri.so failed 
(/usr/lib/dri/swrast_dri.so: cannot open shared object file: No such 
file or directory)
(EE) GLX: could not load software renderer
Could not init font path element /usr/lib/X11/fonts/TTF/, removing from 
list!
Could not init font path element /usr/lib/X11/fonts/OTF, removing from list!
Could not init font path element /usr/lib/X11/fonts/Type1/, removing 
from list!


The errors don't seems to be important as I don't use 3D and OpenGL.

If someone has already work on this chip XGI z9s, which driver must be 
used and how to configure it?

Thanks,
Damien.
