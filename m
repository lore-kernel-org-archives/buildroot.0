From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 9 Aug 2017 20:17:57 +0300
Subject: [Buildroot] Compiling buildroot for Arm "Armada 166E" Target
In-Reply-To: <CANK3ZEe9uvSZx-=iG-gLkUPV98vTUxtsF8fC+wTAt+HovNDoVw@mail.gmail.com>
References: <CANK3ZEdaEdw6YuyN-offP1M4F88zdgy_Eg7qikQ5uzUDC2-XKQ@mail.gmail.com>
 <20170809154918.tthy3t2p6d3hsqon@tarshish>
 <CANK3ZEe9uvSZx-=iG-gLkUPV98vTUxtsF8fC+wTAt+HovNDoVw@mail.gmail.com>
Message-ID: <20170809171757.itid3fvz6462r2no@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Aseem,

On Wed, Aug 09, 2017 at 10:03:24PM +0530, Aseem Sharma wrote:
> Hello Baruch & Arnout,
> 
> Thanks for your responses.
> The board that I have is quite old with limited RAM and Flash.
> 
> Baruch,
> Could you please provide more details as to how do I select "iwmmxt" using
> menuconfig. As far as I remember, I do not seem to have that option in my
> current buildroot release.

Go to 'Target options' -> 'Target Architecture Variant', and select 'iwmmxt' 
(last option).

> Also, as per Arnout's response to my query, I should be using ARM little
> endian with arm926tARM.

As far as I know arm926t code is compatible with iwmmxt, but not the other way 
around. Look for Sheeva PJ1 at [1]. See also [2].

[1] https://en.wikipedia.org/wiki/List_of_ARM_microarchitectures

[2] https://en.wikipedia.org/wiki/MMX_(instruction_set)#MMX_in_embedded_applications

> Are these two options one and the same?

I don't think so.

baruch

> Thanks in advance.
> 
> Best Regards,
> Aseem
> 
> Sent via really tiny keyboard. Expect random auto corrects, fat finger
> typos and weirdness!!
> 
> 
> On 09-Aug-2017 21:19, "Baruch Siach" <baruch@tkos.co.il> wrote:
> 
> Hi Aweem,
> 
> On Wed, Aug 09, 2017 at 06:00:55PM +0530, Aseem Sharma wrote:
> > I am naive to buildroot & processor world trying to compile
> > "buildroot-2017.02.5" for "Marvell ARM Armada 166E processor (compatible
> to
> > ARMv5TE instruction-set)" based old system. However, I do not understand
> > the options to be selected in "make menuconfig" for
> > 1. Target options->Target Architecture {think should be ARM - little
> endian}
> > 2. Target options->Target Architecture variant
> >
> > Thanks in advance for your help.
> 
> Based on the Armada 16x Datasheet[1], the mainline kernel
> arch/arm/mach-mmp/Kconfig (CONFIG_CPU_PXA168) and arch/arm/Kconfig
> (CONFIG_IWMMXT), it seems like you need the iwmmxt ARM variant for your
> Armada
> 166E processor.
> 
> [1] http://www.marvell.com.cn/application-processors/armada-100/
> assets/armada_16x_datasheet.pdf

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
