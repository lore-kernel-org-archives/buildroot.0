From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 21 Jul 2007 00:34:36 +0200
Subject: [Buildroot] [RFC] Support for "distributions" in buildroot
References: <1184934649.6382.10.camel@elrond.sweden.atmel.com>
	<20070720140438.GB29640@real.realitydiluted.com>
Message-ID: <044b01c7cb1e$8db0a550$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Steven J. Hill" <sjhill@realitydiluted.com>
To: "Ulf Samuelsson" <ulf@atmel.com>
Cc: "buildroot" <buildroot@uclibc.org>
Sent: Friday, July 20, 2007 4:04 PM
Subject: Re: [Buildroot] [RFC] Support for "distributions" in buildroot


> On Fri, Jul 20, 2007 at 02:30:49PM +0200, Ulf Samuelsson wrote:
>> There is an inherent problem in buildroot, that things
>> are downloaded from a volatile Internet.
>> When packages disappear from Internet,
>> the build breaks for new users.
>> If we then update the package/<package>/<package>.mk
>> without testing too much, this might break someones
>> stable build, which is undesirable.
>> 
>> By introducing "distributions" defined in a separate
>> file containing lines like:
>> 
> Sorry to keep saying "No", but "No". If people want to stay with older
> versions, then they should download the source they need and keep it
> with their current buildroot system.
> 
> -Steve
>

I think maybe it is worthwhile to explain why I think this is neccessary.

If you are a semiconductor company like Atmel, then you spend time
on creating example applications/rootfs/kernel combinations which
you test extensively.
You are not interested in having other people breaking the build
by forcing the use of a new version of a package which is incompatible
with the rest of the build.
You want to give a few simple instructions that allow people to 
get a running system *WITHOUT PHONING IN ASKING QUESTIONS*

Once they get a hang of things, then they should be able to 
upgrade to the latest packages easily.

Your suggestions means that either the end customer will get
a buildroot frozen at a certain time, or that the maintenance
effort to keep buildroot up to date has to be duplicated.

To me, buildroot is a mere toy if it does not allow the professional
user some amount of control over the configuration.

Let me give you an example:
Assume that you have VERSION-X.Y.Z of a certain package.
After testing, it is shown that it is broken on the ARM architecture,
but works on the PowerPC.
VERSION-X.Y.W becomes available and works for ARM, but
is broken for the PowerPC.
The current buildroot only supports having one package.

If you do not like the proposed approach, then I think you need
to explain how to solve that specific problem in an acceptable way.

I have seen comments that maybe we should not update mtd
because it is "working".   Well, it isn't...
AT45 dataflash support is severly broken, and I expect that 
the development in NAND flash could also affect the usability
of the current 
According to your proposal, people that wants to keep
the 2005 version then needs to freeze their buildroot
because the svn trunk will not maintain that anymore.

Seen similar comments about udev, which is no longer downloadable.
If your approach stands, then people should not expect to have
the current udev available in the main trunk.


Really, I do not think there is a workable solution to the problem
except allowing each user to select which version they should use. 

Best Regards
Ulf Samuelsson
