From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Sep 2015 22:52:08 +0200
Subject: [Buildroot] [PATCH 2/3] New entry for the Cortex-M4 processor
In-Reply-To: <20150913102136.01d94129@free-electrons.com>
References: <1442127768-26447-1-git-send-email-cjwfirmware@vxmdesign.com>
 <1442127768-26447-2-git-send-email-cjwfirmware@vxmdesign.com>
 <20150913102136.01d94129@free-electrons.com>
Message-ID: <20150915205208.GE3650@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-09-13 10:21 +0200, Thomas Petazzoni spake thusly:
> On Sun, 13 Sep 2015 03:02:47 -0400, Chris Wardman wrote:
[--SNIP--]
> > diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> > index 4d10f4c..2692402 100644
> > --- a/arch/Config.in.arm
> > +++ b/arch/Config.in.arm
> > @@ -156,6 +156,11 @@ config BR2_cortex_m3
> >  	bool "cortex-M3"
> >  	select BR2_ARM_CPU_HAS_THUMB
> >  	select BR2_ARM_CPU_HAS_THUMB2
> > +config BR2_cortex_m4
> > +       bool "cortex-M4"
> > +        select BR2_ARM_CPU_HAS_THUMB
> > +        select BR2_ARM_CPU_HAR_THUMB2
> > +        select BR2_ARM_CPU_ARMV7M
> 
> Please use tab for indentation. Also, while Cortex-M3 also does it, I
> think selecting both Thumb and Thumb-2 is not correct: Cortex-M3/M4
> only support Thumb-2, no? Or at least, gcc only provides a -mthumb
> option that will generate Thumb-2 code, so there is no way to generate
> classic Thumb code on ARMv7-M platforms. Though since the problem
> already exists for Cortex-M3, we can keep it this way for Cortex-M4 as
> well for now.

It is my understanding that -mthumb will generate Thumb2 instructions on
cores that have Thumb2 (e.g. Cortex), and Thumb (aka Thumb1) on cores
that do not have Thumb2.

Also, since Thumb2 is a strict superset of Thumb, then having Thumb2
means having Thumb, at least from an instruction set point of view.

I believe Thumb2 should select Thumb.


What I meant is: if a package needs Thumb (e.g. to use assembly code
that uses Thumb instructions) then that assembly code is still entirely
valid when the core is Thumb2-capable.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
