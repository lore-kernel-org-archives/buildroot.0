From: Stanislav Vasic <svlasic@gmail.com>
Date: Sat, 2 Nov 2013 20:49:51 +0000 (UTC)
Subject: [Buildroot] [PATCH 2 of 2] Introduction of Amlogic platform to
	buildroot
References: <l53633$d6q$3@ger.gmane.org> <20131102165459.09a35044@skate> <
 l53858$d6q$4@ger.gmane.org> <20131102172023.6a8bc642@skate>
Message-ID: <l53ohf$69i$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 02 Nov 2013 17:20:23 +0100, Thomas Petazzoni wrote:

> Dear Stanislav Vasic,
> 
> On Sat, 2 Nov 2013 16:10:16 +0000 (UTC), Stanislav Vasic wrote:
> 
>> That is what I was told yesterday (about adding it). Amlogic buildroot
>> is too complicated and it's used mainly for running XBMC on top of
>> buildroot.
>> I agree there are too many things (such as non-standard opengl drivers,
>> Amlogic property a/v libraries...).
> 
> That's not a problem. We already have a number of packages with OpenGL
> drivers for specific platforms:
> 
>  package/freescale-imx/gpu-viv-bin-mx6q/ (for i.MX6)
>  package/rpi-userland/ (for Rasberry Pi) package/sunxi-mali/ (for
>  Allwinner) package/ti-gfx/ (for TI OMAP)
> 
>> Patch is needed so we know we're building for Amlogic SoC, and for
>> other packages to know which eg. opengl or a/v libs to include in
>> build.
> 
> Just do it the way we do it for all of the platforms mentioned above:
> add a package in Buildroot, and make it depend on BR2_arm. This way it
> will only be visible on ARM platforms, and from this point, users are
> expected to know which OpenGL implementation they need for their
> platform.
> 
> We are also considering adding "demo" defconfigs in Buildroot so that
> users could easily find a configuration that enables OpenGL for a given
> platform.
> 
>> > For all other ARM platforms, the user simply has to choose the
>> > appropriate ARM core (Cortex-A8, Cortex-A9, Cortex-A15, etc.), and
>> > that's it. We also provide default configurations (see the configs/
>> > directory) for various well-known hardware platforms, and those
>> > configurations correctly define which ARM core should be used.
>> 
>> See above, at this point it's not so simple for Amlogic.
> 
> See above. Amlogic is not exceptional: it's just like several other SoCs
> we already support in Buildroot :-)
> 
> Best regards,
> 
> Thomas

Hi,

I see your point. At the moment I don't have time to toy with it because 
lot of work, but if noone else is interested in doing such a thing, I'll 
do it but don't have any ETA on this one.

I did not follow since yesterday, but if not available, I can submit 
patch of extracting Linaro's gconv libs and copying it to target (option 
in toolchain configuration).

This patch works for all Linaros (oldest tested is 2012.03).

Regards,
Stan
