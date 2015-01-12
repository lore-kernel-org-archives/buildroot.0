From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 12 Jan 2015 23:39:17 +0100
Subject: [Buildroot] [PATCH v2 4/4] dtc: add patches for raspberry pi
 overlay support
In-Reply-To: <20150112215052.48005c8d@free-electrons.com>
References: <1421000166-24963-1-git-send-email-ps.report@gmx.net>
 <1421000166-24963-4-git-send-email-ps.report@gmx.net>,
 <20150112215052.48005c8d@free-electrons.com>
Message-ID: <trinity-b7b3f76f-e86c-4740-afdf-f26001183958-1421102357546@3capp-gmx-bs16>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> Gesendet: Montag, 12. Januar 2015 um 21:50 Uhr
> Von: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> An: "Peter Seiderer" <ps.report@gmx.net>
> Cc: buildroot at busybox.net
> Betreff: Re: [Buildroot] [PATCH v2 4/4] dtc: add patches for raspberry pi overlay support
>
> Dear Peter Seiderer,
> 
> On Sun, 11 Jan 2015 19:16:06 +0100, Peter Seiderer wrote:
> > See [1] for documentation of raspberry pi kernel dt overlay support.
> > 
> > The following patches (see original download urls) where adjusted to dtc-1.4.1:
> > 
> > - 0003-dtc-Dynamic-symbols-fixup-support.patch
> > https://github.com/RobertCNelson/dtc/commit/dd6a0533e846e8d5e690a618fa35cc15a6103efb.patch
> > 
> > - 0004-dtc-v-takes-no-argument-drop-extra.patch
> > https://github.com/RobertCNelson/dtc/commit/f345d9e48c9e1169edf047de742da142cc5687bc.patch
> > 
> > [1] https://github.com/raspberrypi/documentation/blob/master/configuration/device-tree.md
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  .../0003-dtc-Dynamic-symbols-fixup-support.patch   | 581 +++++++++++++++++++++
> >  .../0004-dtc-v-takes-no-argument-drop-extra.patch  |  44 ++
> >  2 files changed, 625 insertions(+)
> >  create mode 100644 package/dtc/0003-dtc-Dynamic-symbols-fixup-support.patch
> >  create mode 100644 package/dtc/0004-dtc-v-takes-no-argument-drop-extra.patch
> 
> We normally don't really like to include patches adding new features:

Yes, expected this point...

> those should be included upstream first. However, for the case of the
> DT overlay mechanism, it's now being more and more widely used for the
> BeagleBone Black and the Raspberry Pi, so maybe we should make an
> exception for this.

Hoped for this...the RPI/BeagleBone description is download some magic
script (which will download/git clone the https://github.com/RobertCNelson/dtc
version and compile)..., the aproach with official package plus 2 patches
is a little bit nicer (and more up to date)...

Regards,
Peter

> 
> Opinion of other Buildroot developers on this is welcome.
> 
> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> 
