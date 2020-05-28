From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 28 May 2020 20:52:36 +0200
Subject: [Buildroot] Issue with Asus Tinkerboard Buildroot OS build
In-Reply-To: <1272084788.2015886.1590685356172@mail.yahoo.com>
References: <1272084788.2015886.1590685356172.ref@mail.yahoo.com>
 <1272084788.2015886.1590685356172@mail.yahoo.com>
Message-ID: <20200528205236.3c1c0d40@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Francesco,

On Thu, 28 May 2020 17:02:36 +0000 (UTC), "fld2865 at gmail.com" <fld2865@gmail.com> wrote:

> Hello Busybox.net,I'm attempting the development of a custom Linux distribution for the Asus Tinkerboard,using Buildroot 2020.02.2.I successfully obtained a booting OS image, which does communicate via serial and SSH,but doesn't output ANYTHING on the HDMI video output.I added all the packages I know of, including X11 stack and OpenGLES libs, but I'm not sureabout which video driver to use. I tried with xf86-video-fbdev and xf86-video-vesa, but withoutsuccess.
> The net result is that when I try to load the Xserver through startx, I get the following result:
> /home# startx
> xauth:? file //.serverauth.255 does not exist
> xauth:? file //.Xauthority does not exist
> 
> 
> X.Org X Server 1.20.8
> X Protocol Version 11, Revision 0
> Build Operating System: Linux 5.4.0-31-generic x86_64
> Current Operating System: Linux Tinker 5.0.0 #1 SMP Thu May 28 16:06:04 CEST 2020 armv7l
> Kernel command line: console=ttyS2,115200n8 root=/dev/mmcblk0p1 rootwait
> Build Date: 28 May 2020? 03:26:17PM
> 
> Current version of pixman: 0.38.4
> ??????? Before reporting problems, check http://wiki.x.org
> ??????? to make sure that you have the latest version.
> Markers: (--) probed, (**) from config file, (==) default setting,
> ??????? (++) from command line, (!!) notice, (II) informational,
> ??????? (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
> (==) Log file: "/var/log/Xorg.0.log", Time: Thu Jan? 1 01:10:01 1970
> (==) Using default built-in configuration (21 lines)
> (EE)
> Fatal server error:
> (EE) no screens found(EE)
> (EE)
> Please consult the The X.Org Foundation support
> ???????? at http://wiki.x.org
> ?for help.
> (EE) Please also check the log file at "/var/log/Xorg.0.log" for additional information.
> (EE)
> (EE) Server terminated with error (1). Closing log file.
> 
> 
> /var/log/Xorg.0.log basically says that there's no /dev/fb pseudo file, which is true, so I thinkI'm using the wrong video driver.Any hint about how could I address this issue?

Most probably no graphic enabled in the kernel config, tinkerboard uses an Mali-T760 GPU ([1]),
there is a official mixed open/closed source graphic stack available I think, or the complete
open source graphic stack 'panfrost' ([2]), see  [3] for a starting point...

Regards,
Peter

[1] https://en.wikipedia.org/wiki/Asus_Tinker_Board
[2] https://panfrost.freedesktop.org/
[3] https://panfrost.freedesktop.org/building-panfrost-mesa.html

> Thanks & best regards,
> Francesco LANDE
