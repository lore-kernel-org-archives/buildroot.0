From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Dec 2018 21:03:37 +0100
Subject: [Buildroot] [PATCH] pkgconf: bump to 1.5.3, change upstream
In-Reply-To: <20181209195931.GE3383@scaer>
References: <20180908200507.23939-1-thomas.petazzoni@bootlin.com>
 <ul30efx8ue.ln2@ID-313208.user.individual.net>
 <20181209195931.GE3383@scaer>
Message-ID: <20181209200337.GF3383@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

(Damn, I was not finished typing my mail, I was to quick at sending
it... Sorry for the noise...)

On 2018-12-09 20:59 +0100, Yann E. MORIN spake thusly:
> On 2018-12-09 19:31 +0100, Bernd Kuhls spake thusly:
> > Am Sat, 08 Sep 2018 22:05:07 +0200 schrieb Thomas Petazzoni:
> > > Of course, updating pkgconf has the potential of breaking lots of
> > > things, that's why I would suggest to update early in the development
> > > cycle, to leave us enough time to resolve issues.
> > libxcb got broken due to this bump:
> > http://autobuild.buildroot.net/?reason=libxcb-1.13
> > 
> > Libxcb configure checks for the variable xcbincludedir of the xcb-proto 
> > package during configure:
> > https://cgit.freedesktop.org/xcb/libxcb/tree/configure.ac#n75
> > 
> > This results in
> > 
> > $ /home/bernd/buildroot/br8_ffmpeg3_kodi17_github/output/host/bin/pkg-
> > config --variable=xcbincludedir xcb-proto
> > 
> > /home/bernd/buildroot/br8_ffmpeg3_kodi17_github/output/host/x86_64-
> > buildroot-linux-uclibc/sysroot/home/bernd/buildroot/
> > br8_ffmpeg3_kodi17_github/output/host/bin/../x86_64-buildroot-linux-
> > uclibc/sysroot/usr/share/xcb
> > 
> > Please note that "/home/bernd/buildroot/..." is present twice in the 
> > pkgconfig result.
> 
> Have you noticed that it is us that are adding the sysroot to the
> xcb-proto.pc file:
> 
>     https://git.buildroot.org/buildroot/tree/package/x11r7/xcb-proto/xcb-proto.mk#n18
> 
> and thus maybe we need to dfrop this tweak now that pkgconf does it for

s/dfrop/drop/

> us?

BTW, that tweak was done by someone called Bernd Kuhls, in commit
862e1221d1c (xorg: Bump xcb-proto & libxcb version to 1.10). Granted,
that was back then in January 2014, now almost 5 years ago, so you're
forgiven for forgiving that! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
