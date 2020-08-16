From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 Aug 2020 10:05:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpv: link with libatomic if
 needed
In-Reply-To: <20200816001124.7a7b2755@windsurf.home>
References: <20200815215730.3901102-1-fontaine.fabrice@gmail.com>
 <20200816001124.7a7b2755@windsurf.home>
Message-ID: <CAPi7W82cnRc2YhHHJQ6Y2DCup2S1LWQEf4id5REP9xhSi99Ybg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dim. 16 ao?t 2020 ? 00:11, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Sat, 15 Aug 2020 23:57:30 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Fixes:
> >  - http://autobuild.buildroot.org/results/12f4580429427b6b546184366f74da16f83d692c
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Thanks! I was also looking (briefly) at this build issue. I see that mpv has:
>
>         depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
>
> Does RISC-V implements the sync 8-byte built-in ?
It seems that __sync builtins have been dropped since version 0.24.0 and
https://github.com/mpv-player/mpv/commit/c3205d294e519f994829d9355eb133670729aab4
so this dependency should also be updated to reflect that atomic is mandatory.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
