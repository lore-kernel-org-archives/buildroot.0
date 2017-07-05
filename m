From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Jul 2017 13:01:31 +0200
Subject: [Buildroot] [PATCH 2/5] arch/arm: fix defaults for AArch64 in
 64-bit mode
In-Reply-To: <20170705105506.eutzkvcalunabk2b@tarshish>
References: <cover.1499250321.git.yann.morin.1998@free.fr>
 <354db2be118602b0b12429d6d0f897455918ea12.1499250321.git.yann.morin.1998@free.fr>
 <20170705105506.eutzkvcalunabk2b@tarshish>
Message-ID: <20170705110131.GG3499@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2017-07-05 13:55 +0300, Baruch Siach spake thusly:
> On Wed, Jul 05, 2017 at 12:25:34PM +0200, Yann E. MORIN wrote:
> > Even in 64-bit mode we have to specify the -mcpu value.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  arch/Config.in.arm | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> > index aaf4506d7f..e6beacf3d8 100644
> > --- a/arch/Config.in.arm
> > +++ b/arch/Config.in.arm
> > @@ -534,9 +534,9 @@ config BR2_GCC_TARGET_CPU
> >  	default "strongarm"	if BR2_strongarm
> >  	default "xscale"	if BR2_xscale
> >  	default "iwmmxt"	if BR2_iwmmxt
> > -	default "cortex-a53"		if (BR2_cortex_a53 && !BR2_ARCH_IS_64)
> > -	default "cortex-a57"		if (BR2_cortex_a57 && !BR2_ARCH_IS_64)
> > -	default "cortex-a72"		if (BR2_cortex_a72 && !BR2_ARCH_IS_64)
> > +	default "cortex-a53"		if (BR2_cortex_a53)
> > +	default "cortex-a57"		if (BR2_cortex_a57)
> > +	default "cortex-a72"		if (BR2_cortex_a72)
> 
> What are the parentheses good for?

They are just so that the series is not applied on the first go. ;-)

Regards,
Yann E. MORIN.

> baruch
> 
> >  
> >  config BR2_GCC_TARGET_ABI
> >  	default "aapcs-linux"	if BR2_arm || BR2_armeb
> 
> -- 
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
