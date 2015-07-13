From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 10:03:36 +0200
Subject: [Buildroot] libfslcodecs libraries installation location
In-Reply-To: <CAAMH-yuiKwzK1_q0hwxC3SigU+veYQA3wQTiZRdGYO0j=K=Z5g@mail.gmail.com>
References: <20150712215125.4675bd5f@free-electrons.com>
 <CAAMH-yuiKwzK1_q0hwxC3SigU+veYQA3wQTiZRdGYO0j=K=Z5g@mail.gmail.com>
Message-ID: <20150713100336.0de992c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Mon, 13 Jul 2015 09:58:50 +0200, Gary Bisson wrote:

> > How it is possible that the glibc dynamic linker finds such libraries?
> 
> I remember discussions about it and I didn't get the issue at first for
> some reason. Then I reproduced it and used ld.so.conf to add imx-mm folder.

Ah, so you confirm that back then you used ld.so.conf, but not recently?

> > We have a very old patch at http://patchwork.ozlabs.org/patch/409684/
> > that was moving around the libraries installed in imx-mm to make them
> > appear in /usr/lib rather than /usr/lib/imx-mm. The same problem was
> > also reported in 2014 by J?r?me Pouiller:
> >
> http://buildroot-busybox.2317881.n4.nabble.com/PATCH-1-2-skeleton-ld-so-conf-include-ld-so-conf-d-conf-td81900.html
> .
> >
> > Can you confirm that you tested that the GStreamer plugin was working ?
> > Did you validate that the video is really decoded using the Freescale
> > stuff and not decoded by the CPU ?
> 
> Yes, I'm using the 1080p video to make sure it strikes me if not using the
> VPU as the CPU can't handle it well. However I hope I didn't use the
> ld.so.conf.

But it seems that not all codecs use those libraries. Arnout was saying
that maybe some codecs such as H.264 are decoded by real
dedicated hardware, while some others (like the MP3 example are gave)
require a firmware to be pushed to a DSP. And in this last case, a
library in imx-mm would be needed.

Can you try playing a MP3 file for example?

> I'm on vacation for two weeks so I'll only be able to do some testing
> starting on the 27th.

Yes, sure, no problem. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
