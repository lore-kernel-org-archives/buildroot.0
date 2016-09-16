From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 16 Sep 2016 16:20:42 +0200
Subject: [Buildroot] [PATCH] configs: nitrogen*: enable NEON support
In-Reply-To: <20160916161344.54fed11e@free-electrons.com>
References: <20160916130902.23091-1-gary.bisson@boundarydevices.com>
 <20160916161344.54fed11e@free-electrons.com>
Message-ID: <CAAMH-ysSivk0Q+-L0P9NTTbxwc53wAbfj4mTXZJ=auAKZTVVzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Sep 16, 2016 at 4:13 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> On Fri, 16 Sep 2016 15:09:02 +0200, Gary Bisson wrote:
> > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> > ---
> >  configs/nitrogen6sx_defconfig | 3 +++
> >  configs/nitrogen6x_defconfig  | 3 +++
> >  configs/nitrogen7_defconfig   | 1 +
> >  3 files changed, 7 insertions(+)
> >
> > diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
> > index bd92f55..1df658b 100644
> > --- a/configs/nitrogen6sx_defconfig
> > +++ b/configs/nitrogen6sx_defconfig
> > @@ -1,6 +1,9 @@
> >  # architecture
> >  BR2_arm=y
> >  BR2_cortex_a9=y
> > +BR2_ARM_ENABLE_NEON=y
> > +BR2_ARM_ENABLE_VFP=y
> > +BR2_ARM_FPU_NEON=y
>
> So, -mfpu=neon here
>
> > +BR2_ARM_ENABLE_NEON=y
> > +BR2_ARM_ENABLE_VFP=y
> > +BR2_ARM_FPU_NEON=y
>
> And here.
>
> >  # system
> >  BR2_TARGET_GENERIC_GETTY=y
> > diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
> > index a8f3b45..adce0fb 100644
> > --- a/configs/nitrogen7_defconfig
> > +++ b/configs/nitrogen7_defconfig
> > @@ -1,6 +1,7 @@
> >  # architecture
> >  BR2_arm=y
> >  BR2_cortex_a7=y
> > +BR2_ARM_FPU_NEON_VFPV4=y
>
> But here, -mfpu=neon-vfpv4
>
> Why this difference?

Because the first two configurations are for i.MX6 (ARM Cortex-A9)
whereas the last one is i.MX7 (ARM Cortex-A7).

So relying on Config.in.arm, the Cortex-A9 doesn't have VFPv4:
https://git.buildroot.net/buildroot/tree/arch/Config.in.arm#n125
https://git.buildroot.net/buildroot/tree/arch/Config.in.arm#n141

Let me know if that's not the case.

Regards,
Gary
