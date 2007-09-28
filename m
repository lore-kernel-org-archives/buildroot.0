From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 28 Sep 2007 23:08:13 +0200
Subject: [Buildroot] Building ARM with Soft-float
In-Reply-To: <20070928170109.GO20951@aon.at>
References: <1190969812.5322.96.camel@elrond.atmel.sweden>
	<1190996888.5322.198.camel@elrond.atmel.sweden>
	<20070928170109.GO20951@aon.at>
Message-ID: <1191013693.5322.252.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2007-09-28 klockan 19:01 +0200 skrev Bernhard Fischer:
> On Fri, Sep 28, 2007 at 06:28:08PM +0200, Ulf Samuelsson wrote:
> >fre 2007-09-28 klockan 10:56 +0200 skrev Ulf Samuelsson:
> >> Tried the Integrator-926ejs default.
> >> =>	This works:
> >> 
> >
> >Beeing trying the ARM integrator softfloat the whole day.
> >
> >Vanilla configuration works.
> >generic-arm, instead of arm926ejs works
> >
> >oabi, instead of eabi, generates a new problem
> >which was not present a week ago.
> >The C compiler seems to be built with EABI...
> 
> double-check, triple-check your BR2_GNU_TARGET_SUFFIX
> 
> And i'm not doing OABI ;)
> >
> >My configuration is as follows
> >> grep ABI .config
> >BR2_ARM_OABI=y
> ># BR2_ARM_EABI is not set
> >> grep ABI toolchain_build_arm_nofpu/uClibc-0.9.29/.config
> >CONFIG_ARM_OABI=y
> ># CONFIG_ARM_EABI is not set
> >> grep abi .config
> >BR2_GNU_TARGET_SUFFIX="uclibc-linux-gnueabi"
> 
> yea, that'd be it. Everything is fine.
> >


You mean the gcc look at its invocation name to determine
what it should do.
Seems stupid to me.
What happens if you just call it arm-linux-gcc or even gcc?

BTW; there are a lot of warning messages about
calling the tools

<arch>-linux-uclibc-<tool>.

Should they not be called <arch>-uclibc-linux-<tool>?

BR
Ulf Samuelsson


 
