From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 06 Jan 2009 17:03:32 +0100
Subject: [Buildroot] svn
	commit:	trunk/buildroot/target/u-boot/2009.01-rc1
In-Reply-To: <87zli4o3mj.fsf@macbook.be.48ers.dk>
References: <20090103000456.97D1E769FA@busybox.osuosl.org>
	<87iqosqz0z.fsf@macbook.be.48ers.dk>
	<1231255237.32308.111.camel@elrond.atmel.com>
	<87zli4o3mj.fsf@macbook.be.48ers.dk>
Message-ID: <1231257812.32308.156.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2009-01-06 klockan 16:28 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
>  ulf> Provide factory default command to u-boot, using Buildroot variables
>  >> 
>  ulf> Added:
>  ulf> trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-009-factory.patch
>  >> 
>  >> Do we really need this? What's the upstream status of it?
> 
>  Ulf> I find that this patch reduces maintenance A LOT.
>  Ulf> If someone calls in with a problem loading linux,
>  Ulf> then you tell them to do "factory"  and then 
>  Ulf> everything is SO much easier.
> 
> But what's the difference between this command and a factory
> environment variable which just erases your environment and resets the
> board?
> 

It sets up a number of environment variables,
depending on the buildroot configuration for u-boot.


> If you really need it for Atmel stuff, maybe you should keep it in the
> Atmel fork?
> 

I think beeing able to reset the environment to a known 
board specific default is useful for everyone.
If it is available for PCs, why is it a bad idea for U-boot?
That does not mean that there is no room for improvement
on the actual implementation.

You have to explicitly enable this in your board config,
so noone should be hurt by the patch.


The plan is to remove the Atmel specific U-Boot soon.
(It is already removed from Kconfig)

BR
Ulf Samuelsson
