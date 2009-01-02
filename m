From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 2 Jan 2009 23:44:47 +0100
Subject: [Buildroot] u-boot and at91bootstrap NAND flash options
References: <20081219165959.207450@gmx.net>
Message-ID: <C8CB595F5CFF4465B69420300FF9515F@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> Hi guys, is there any specific reason why buildroot does not have options
> in the menuconfig to compile
> u-boot with NAND flash support for the AT91SAM9xxx devices?
> I know that NAND support does not function for the RevA SAM9260, SAM9263,
> and the SAM9261,
> but Rev B has been out for a while for the first two and I think it would
> be nice to see the
> options in buildroot instead of having to build manually or download the
> pre-built binaries from www.linux4sam.org.

> Also, the NAND flash option for at91bootstrap does not work.
> The NAND code is missing.
> I know that at91bootstrap-1.9 (found here:
> ftp://www.linux4sam.org/pub/at91bootstrap/) has fully functional NAND
> support
> - any reason why this has not been integrated into the buildroot
> at91bootstrap?

Same answer on both accounts.
Noone had the time to do it.

Atmels bootstrap needs porting work, to be able to run with buildroot.
It has a real strange way of "makeing" the target, and a tool
like buildroot needs deep internal knowledge about the internal
directory structure of at91bootstrap to be able to build the target.

I rewrote at91bootstrap, creating the v2.x series used by buildroot
where you use a Makefile in the top directory and a
make XXX_config command to configre the tool.

Have been testing, what I call 2.8 and 2.9 which uses KConfig to configure
at91bootstrap
and this is based on at91bootstrap-1.11 so most new things should  be there.

Have also been working on u-boot-2009.01-rc1 today and this
should allow more functionality.

I am not particularily interested in NAND flash, so that will receive  less
(no) testing,
but the basic source have little change so I do not see any big problems.



Best Regards
Ulf Samuelsson
