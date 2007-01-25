From: Ulf Samuelsson <ulfs@dof.se>
Date: Thu, 25 Jan 2007 01:02:49 +0100
Subject: [Buildroot] [PATCH] Set CFLAGS = $(TARGET_CFLAGS) for many
	packages
References: <1169596433.5361.23.camel@elrond.sweden.atmel.com>
	<20070124232349.GF28221@aon.at>
Message-ID: <02b901c74014$8da2aa80$01c4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> On Wed, Jan 24, 2007 at 12:53:53AM +0100, Ulf Samuelsson wrote:
>> If you make Buildroot from scratch, CFLAGS gets set during the build,
>> but if you add packages later, then CFLAGS should be set in the
>> makefile fragment of the new package.
>
> I don't understand what you mean here. Please elaborate
>>

Some packages require kernel headers.
If you build from scratch, something sets CFLAGS to a good value.

If you come back the next day, reconfigure your system,
to include a new package, and recompile, many packages
will bomb out because they do not find the "asm-generic.h"

By adding this CFLAGS patch you can compile those packages.

Many packages have this already, many don't.
Can you explain when you have it and when you don't?

>> I believe that TARGET_CFLAGS needs to include the Linux Include
>> Directory or you will get compolie time errors.
>
> I don't have the linux include in my TARGET_CFLAGS AFAIK and do not
> get compile errors. What kernel-headers are you using? What errors
> are you seeing with what package?

Best Regards,
Ulf Samuelsson
ulf at atmel.com
GSM:  +46 (706) 22 44 57
Tel:     +46  (8) 441 54 22
Fax:     +46 (8) 441 54 29
Mail: Box 2033  174 02 Sundbyberg
Visit: Kavalleriv?gen 24
          174 58 Sundbyberg'
Sweden
