From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 May 2021 14:19:10 +0200
Subject: [Buildroot] [PATCH 3/3] boot/at91bootstrap3: add
 BR2_TARGET_AT91BOOTSTRAP3_NEEDS_PYTHON3
In-Reply-To: <ebcdcf55-e613-6b37-0faa-26b3d548b5be@microchip.com>
References: <20210518213749.144355-1-thomas.petazzoni@bootlin.com>
 <20210518213749.144355-4-thomas.petazzoni@bootlin.com>
 <ebcdcf55-e613-6b37-0faa-26b3d548b5be@microchip.com>
Message-ID: <20210519141910.0af4f949@windsurf.orange-hotspot>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 19 May 2021 11:29:23 +0000
<Eugen.Hristev@microchip.com> wrote:

> > diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
> > index 18301a0dc0..966e393db5 100644
> > --- a/boot/at91bootstrap3/Config.in
> > +++ b/boot/at91bootstrap3/Config.in
> > @@ -101,3 +101,11 @@ config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE
> >            Path to the at91bootstrap3 configuration file
> > 
> >   endif # BR2_TARGET_AT91BOOTSTRAP3
> > +
> > +config BR2_TARGET_AT91BOOTSTRAP3_NEEDS_PYTHON3
> > +       bool "needs host-python3"  
> 
> Hi,
> 
> This prompt that appears in menuconfig is a bit unfriendly : it does not 
> say who needs the host-python3, and it does not appear to be in the 
> at91bootstrap3 -related options.
> It is at the same indentation level as the other bootloaders, like 
> Barebox, Grub, etc. So I think it's misleading and should be aligned 
> with the other At91bootstrap options

Crap, you're entirely right, it is misplaced: it should have been just
two line above, within the if BR2_TARGET_AT91BOOTSTRAP3 ... endif block.

Unless someone beats me at it, I'll send a patch fixing that.

Thanks for spotting this!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
