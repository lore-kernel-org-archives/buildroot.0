From: Jerry Huang <jerry.huang@nxp.com>
Date: Thu, 9 Apr 2020 13:03:53 +0000
Subject: [Buildroot] [EXT] Re: how to make two defconfig simultaneously
In-Reply-To: <CA+h21hr+Ct3COWUv7ZfiHnwfWRb0GVw_A268qEG6WZD-VMyv7g@mail.gmail.com>
References: <VI1PR04MB513697495A894BC827B3CF0DFEC10@VI1PR04MB5136.eurprd04.prod.outlook.com>
 <20200409133434.20276005@windsurf.home>
 <CA+h21hpmV55Nh7HUA5WZ3QKU+yCPsnoLOVuNge8VyMbbK6EtHg@mail.gmail.com>
 <20200409142507.5de703f4@windsurf.home>
 <CA+h21hr+Ct3COWUv7ZfiHnwfWRb0GVw_A268qEG6WZD-VMyv7g@mail.gmail.com>
Message-ID: <VI1PR04MB51363A253E4C4360ABE8FEF5FEC10@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Best Regards
Jerry Huang

> -----Original Message-----
> From: Vladimir Oltean <olteanv@gmail.com>
> Sent: Thursday, April 9, 2020 8:46 PM
> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Jerry Huang <jerry.huang@nxp.com>; Heiko Thiery
> <heiko.thiery@gmail.com>; buildroot at busybox.net; Michael Walle
> <michael@walle.cc>; matthew.weber at collins.com; geomatsi at gmail.com
> Subject: [EXT] Re: [Buildroot] how to make two defconfig simultaneously
> 
> Caution: EXT Email
> 
> On Thu, 9 Apr 2020 at 15:25, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > On Thu, 9 Apr 2020 15:16:36 +0300
> > Vladimir Oltean <olteanv@gmail.com> wrote:
> >
> > > > Thomas Petazzoni, CTO, Bootlin
> > > > Embedded Linux and Kernel engineering
> > > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2F
> > > >
> bootlin.com%2F&amp;data=02%7C01%7Cjerry.huang%40nxp.com%7Caa2566c
> 3
> > > >
> daca4d2d7f4a08d7dc83ed07%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%
> 7C
> > > >
> 1%7C637220331486875411&amp;sdata=cE7A7OhJopKeT7Z7ZvvIhaC6fJ9VdfFKC
> > > > 1IAns0ZwCc%3D&amp;reserved=0
> > >
> > > I would assume the question is about merging a defconfig with
> > > multiple fragments.
> >
> > Then:
> >
> > $ ./support/kconfig/merge_config.sh fragment1 fragment2
> >
> > see also
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fboot
> > lin.com%2Fdoc%2Ftraining%2Fbuildroot%2Fbuildroot-slides.pdf&amp;data=0
> >
> 2%7C01%7Cjerry.huang%40nxp.com%7Caa2566c3daca4d2d7f4a08d7dc83ed07
> %7C68
> >
> 6ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637220331486875411&amp
> ;sdata=
> >
> WbhRwcsABaCuTXLRIPz%2F0AqVbgZPXeFjA6lg%2BM6WL34%3D&amp;reserve
> d=0
> > slides
> > 43 and 44.
> >
> > However, I would recommend to *not* store fragments under configs/
> > with a _defconfig suffix, as this is normally used for complete
> > defconfigs, not fragments.
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fboot
> >
> lin.com%2F&amp;data=02%7C01%7Cjerry.huang%40nxp.com%7Caa2566c3dac
> a4d2d
> >
> 7f4a08d7dc83ed07%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C63
> 722033
> >
> 1486885410&amp;sdata=s9%2F4o8MhHm7fftdxDYiaFBF1kwo544D6l5TkRuqZN
> qI%3D&
> > amp;reserved=0
> 
> Ok, this answers the 'how to merge them' portion of the question.
> Are there guidelines for where defconfig fragments _can_ be stored, how they
> should be structured, named, what they can contain? All the files that I see in
> the configs/ folder are simple defconfigs.

They are that I want to know.


> Thanks,
> -Vladimir
