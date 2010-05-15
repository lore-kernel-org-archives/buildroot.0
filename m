From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Sat, 15 May 2010 14:43:29 +0000 (UTC)
Subject: [Buildroot] endian issue
References: <201005151547.02656.korgull@home.nl>
	<1273933182.28330.87.camel@coalu.atr>
Message-ID: <hsmbug$d0p$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-05-15, Lionel Landwerlin <llandwerlin@gmail.com> wrote:
> Le samedi 15 mai 2010 ?? 15:47 +0200, Marcel a ??crit :
>> 
>> I'm using an Atmel sam9g45 using buildroot with linux 2.6.33.
>> 
>> I currently have most of my things working but run into an issue which is 
>> endian related.
>
> The endianness configuration of your processor isn't something you
> can usually change 'on-the-fly'. It's usually set up early in the
> boot process.

While the endian configuration of the ARM9 core can be changed, the
AT91 peripherals are little-endian.  In theory, he should be able to
run the ARM9 core in big-endian mode, but a running uC core without
any working peripherals is surprisingly useless.

> So you have to choose whether you want to compile all your system in
> big or little endian, you can select that from the buildroot
> architecture configuration (arm -> little, armeb -> big, for
> example).

In this case, he has to choose little-endian.

[I've never seen an ARM-based uController that had peripherals with
configurable endianess -- are there any?]

>> Is there any way to compile my package in big-endian mode from
>> buildroot? Or is there another way I should force this?
>
> You can't select that for 1 package, it's for the whole system or
> nothing. Otherwise, the smartest approch would be to make endian
> detection (at compile time or at running time) to adapt your
> processing algorithm.

Yep, the OP's should driver should return data in host-order.

Otherwise, he'll have to suffer the guilt of knowing that a few years
from now some poor sod who inherits the code will have a stroke from
the effort required to resist the urge to track down the OP and slap
him silly.

-- 
Grant
