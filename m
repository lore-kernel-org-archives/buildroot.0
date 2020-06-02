From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 2 Jun 2020 09:57:46 +0200
Subject: [Buildroot] Issue with Asus Tinkerboard Buildroot OS build
In-Reply-To: <884234841.71560.1591084477543@mail.yahoo.com>
References: <1272084788.2015886.1590685356172.ref@mail.yahoo.com>
 <1272084788.2015886.1590685356172@mail.yahoo.com>
 <20200528205236.3c1c0d40@gmx.net>
 <1644632225.187471.1590836736105@mail.yahoo.com>
 <20200601211208.65edc396@gmx.net>
 <884234841.71560.1591084477543@mail.yahoo.com>
Message-ID: <CAOf5uwmNJDp33BwOFNREdYmwFx-c+TzwYRN=F9zUpRyHFbh_3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

On Tue, Jun 2, 2020 at 9:54 AM fld2865 at gmail.com <fld2865@gmail.com> wrote:
>
> Hi Peter,
> thanks anyway for you reply.
> Moerover, I'm not familiar at all how to interact with the community, so thanks also for pointing me to
> buildroot at busybox.net.
>
> I have the feeling that the community is useful only if you already know how to interact with it, and I
> could find nowhere describing how to start as a newbie in this area.

Right now I have a tinker board. Please share your defconfig

Michael

>
> Best regards,
>
> Francesco LANDE
>
> Il luned? 1 giugno 2020, 21:12:11 CEST, Peter Seiderer <ps.report@gmx.net> ha scritto:
>
>
> Hello Francesco,
>
> re-added CC: buildroot at busybox.net
>
> On Sat, 30 May 2020 11:05:35 +0000 (UTC), "fld2865 at gmail.com" <fld2865@gmail.com> wrote:
>
> >  Hi Peter,thanks for your prompt reply, first of all.I did try to follow your suggestions, but without luck, unfortunately.More specifically:1. I upgraded the kernel to v. 5.4.40:
> > ~# uname -a
> > Linux Tinker 5.4.40 #1 SMP Sat May 30 11:28:51 CEST 2020 armv7l GNU/Linux
> > 2. I verified that in this kernel the CONFIG_DRM_PANFROST option was selected;3. I added both the KMSRO and Panfrost drivers and clean rebuilt all;
> > 4. The OS builddoes boot, but again NO "/dev/fb0" device, and xinit does not start!!!
> > Really out of mind.
> > If you would like to check my "dmesg", "Xorg.0.log" and "*_defconfig" files for your reference.
>
> Sorry, no more help from my side possible (because I own no Tinkerboard and no deeper
> knowledge on the Tinkerboard graphic stack behind the quick google survey with
> the results below)...
>
> Regards,
>
> Peter
>
> > Thanking in advance, my best regards,
> > Francesco LANDE
> >
> > Il gioved? 28 maggio 2020, 20:52:38 CEST, Peter Seiderer <ps.report@gmx.net> ha scritto:
> >
> >  Hello Francesco,
> >
> > On Thu, 28 May 2020 17:02:36 +0000 (UTC), "fld2865 at gmail.com" <fld2865@gmail.com> wrote:
> >
> > > Hello Busybox.net,I'm attempting the development of a custom Linux distribution for the Asus Tinkerboard,using Buildroot 2020.02.2.I successfully obtained a booting OS image, which does communicate via serial and SSH,but doesn't output ANYTHING on the HDMI video output.I added all the packages I know of, including X11 stack and OpenGLES libs, but I'm not sureabout which video driver to use. I tried with xf86-video-fbdev and xf86-video-vesa, but withoutsuccess.
> > > The net result is that when I try to load the Xserver through startx, I get the following result:
> > > /home# startx
> > > xauth:  file //.serverauth.255 does not exist
> > > xauth:  file //.Xauthority does not exist
> > >
> > >
> > > X.Org X Server 1.20.8
> > > X Protocol Version 11, Revision 0
> > > Build Operating System: Linux 5.4.0-31-generic x86_64
> > > Current Operating System: Linux Tinker 5.0.0 #1 SMP Thu May 28 16:06:04 CEST 2020 armv7l
> > > Kernel command line: console=ttyS2,115200n8 root=/dev/mmcblk0p1 rootwait
> > > Build Date: 28 May 2020  03:26:17PM
> > >
> > > Current version of pixman: 0.38.4
> > >         Before reporting problems, check http://wiki.x.org
> > >         to make sure that you have the latest version.
> > > Markers: (--) probed, (**) from config file, (==) default setting,
> > >         (++) from command line, (!!) notice, (II) informational,
> > >         (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
> > > (==) Log file: "/var/log/Xorg.0.log", Time: Thu Jan  1 01:10:01 1970
> > > (==) Using default built-in configuration (21 lines)
> > > (EE)
> > > Fatal server error:
> > > (EE) no screens found(EE)
> > > (EE)
> > > Please consult the The X.Org Foundation support
> > >          at http://wiki.x.org
> > >  for help.
> > > (EE) Please also check the log file at "/var/log/Xorg.0.log" for additional information.
> > > (EE)
> > > (EE) Server terminated with error (1). Closing log file.
> > >
> > >
> > > /var/log/Xorg.0.log basically says that there's no /dev/fb pseudo file, which is true, so I thinkI'm using the wrong video driver.Any hint about how could I address this issue?
> >
> > Most probably no graphic enabled in the kernel config, tinkerboard uses an Mali-T760 GPU ([1]),
> > there is a official mixed open/closed source graphic stack available I think, or the complete
> > open source graphic stack 'panfrost' ([2]), see  [3] for a starting point...
> >
> > Regards,
> > Peter
> >
> > [1] https://en.wikipedia.org/wiki/Asus_Tinker_Board
> > [2] https://panfrost.freedesktop.org/
> > [3] https://panfrost.freedesktop.org/building-panfrost-mesa.html
> >
> > > Thanks & best regards,
> > > Francesco LANDE
> >
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
