From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 25 Oct 2020 11:00:05 +0100
Subject: [Buildroot] [PATCH v1 1/1] package/rtl8821au: add patch fixing
 sprintf error
In-Reply-To: <20200802125758.3ce2215d@gmx.net>
References: <20200801203749.424827-1-christian@paral.in>
 <20200801233410.6ec574ce@gmx.net>
 <CA+h8R2qz5aRa5DrkXcN+0Cca_vysEUdLQK+nAN1WMNg3dR08yA@mail.gmail.com>
 <CA+h8R2oApXa_RjDPxNXK65S6SNZXgyXvBnEBUy3RuR9BZA=xNQ@mail.gmail.com>
 <20200802125758.3ce2215d@gmx.net>
Message-ID: <20201025110005.06b3bffb@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

On Sun, 2 Aug 2020 12:57:58 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Christian,
>
> On Sat, 1 Aug 2020 17:33:48 -0700, Christian Stewart <christian@paral.in> wrote:
>
> > Hi Peter,
> >
> > On Sat, Aug 1, 2020 at 2:51 PM Christian Stewart <christian@paral.in> wrote:
> > >
> > > Hi Peter,
> > >
> > >
> > > On Sat, Aug 1, 2020, 2:34 PM Peter Seiderer <ps.report@gmx.net> wrote:
> > >>
> > >> maybe its worth to try some other 'upstream' sources, e.g. as
> > >> openSUSE [4] does (mentioning previous [5] and [6]), or the first
> > >> google search result [7] (did not find the time to dig into the
> > >> different repositories to find out which one is the best)...
> > >
> > >
> > > We've been through a number of these over the years. I would not recommend switching to another unless there's a specific reason. As far as I know the current configuration/upstream works fine with USB RTL cards.
>
> Did only a quick test some weeks ago, trying the IBSS mode and to get wifibroadcast
> to work (both did not work out as far as I remember, so switched to some other cards)...
>
> >
> > See: https://github.com/paralin/buildroot/commit/af8d30846e71e378fdcdb632bbbbfe0aaf7bb669
> >
>
> Will take a look at it (if I find some spare time ;-)) and try it out....

Found some time:

 - with the aircrack-ng repo IBSS mode does not work, monitor mode works
 - with the abperiasamy repo (buildroot original) IBSS mode works, monitor mode
   does not work

> > Just out of curiosity I made a patch switching to the aircrack fork,
> > but there were some errors at the install step, for example:
> >
> > depmod: WARNING: /target/lib/modules/4.14.180/extra/88XXau.ko needs
> > unknown symbol cfg80211_unlink_bss
> > depmod: WARNING: /target/lib/modules/4.14.180/extra/88XXau.ko needs
> > unknown symbol ieee80211
> >
> > Even though the CFG80211 options are enabled in the kernel, and the
> > build passes with the old fork.

No compile/running problems against the RPi kernel/configuration (5.4.72/bcmrpi3_defconfig)...

Regards,
Peter

> >
> > Maybe there are some path issues going on there.
> >
> > Looks like the aircrack fork may have better support for packet injection?
> >
> > Best,
> > Christian
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
