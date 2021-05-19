From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 14:39:39 +0200
Subject: [Buildroot] [PATCH 3/3] boot/at91bootstrap3: add
 BR2_TARGET_AT91BOOTSTRAP3_NEEDS_PYTHON3
In-Reply-To: <20210519141910.0af4f949@windsurf.orange-hotspot>
References: <20210518213749.144355-1-thomas.petazzoni@bootlin.com>
 <20210518213749.144355-4-thomas.petazzoni@bootlin.com>
 <ebcdcf55-e613-6b37-0faa-26b3d548b5be@microchip.com>
 <20210519141910.0af4f949@windsurf.orange-hotspot>
Message-ID: <20210519123939.GV2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Eugen, All,

On 2021-05-19 14:19 +0200, Thomas Petazzoni spake thusly:
> On Wed, 19 May 2021 11:29:23 +0000
> <Eugen.Hristev@microchip.com> wrote:
> > > diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
> > > index 18301a0dc0..966e393db5 100644
> > > --- a/boot/at91bootstrap3/Config.in
> > > +++ b/boot/at91bootstrap3/Config.in
> > > @@ -101,3 +101,11 @@ config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE
> > >            Path to the at91bootstrap3 configuration file
> > > 
> > >   endif # BR2_TARGET_AT91BOOTSTRAP3
> > > +
> > > +config BR2_TARGET_AT91BOOTSTRAP3_NEEDS_PYTHON3
> > > +       bool "needs host-python3"  
> > This prompt that appears in menuconfig is a bit unfriendly : it does not 
> > say who needs the host-python3, and it does not appear to be in the 
> > at91bootstrap3 -related options.
> > It is at the same indentation level as the other bootloaders, like 
> > Barebox, Grub, etc. So I think it's misleading and should be aligned 
> > with the other At91bootstrap options
> 
> Crap, you're entirely right, it is misplaced: it should have been just
> two line above, within the if BR2_TARGET_AT91BOOTSTRAP3 ... endif block.
> 
> Unless someone beats me at it, I'll send a patch fixing that.

I've just pushed the fix.

> Thanks for spotting this!

Yes, thanks for spotting it! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
