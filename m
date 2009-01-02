From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sat, 03 Jan 2009 00:29:48 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel:	at91bootstrap
	at91rm9200df at91sam9260d etc...
In-Reply-To: <20090103000725.D15D0769FA@busybox.osuosl.org>
References: <20090103000725.D15D0769FA@busybox.osuosl.org>
Message-ID: <1230938988.8886.35.camel@linux-yrgm.site>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

l?r 2009-01-03 klockan 00:07 +0000 skrev ulf at uclibc.org:
> Author: ulf
> Date: 2009-01-03 00:07:25 +0000 (Sat, 03 Jan 2009)
> New Revision: 24659
> 
> Log:
> Remove debugging variable added to svn by mistake, (Thanks Pter)
> 

Butterfingers.
To quick on <Carriage return> 

> Removed:
>    trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9260dfc-linux-2.6.28-rc6.config
> 
> Modified:

THe two files below, fixes the problem
>    trunk/buildroot/target/device/Atmel/Makefile.in
>    trunk/buildroot/target/device/Atmel/at91sam9260dfc/Makefile.in
> 

INtroduction of at91bootstrap-2.9 which is based on 
Atmel v1.11 and thus adds support for 
* at91sam92g20ek
* at91sam9xeek
* at91sam9rlek
* at91cap9adk

It should also support both dataflash (card) and NAND flash.
There is a new configuration system which uses the 
Buildroot KConfig stuff from BUILDROOT:/packages/config

make <board>_defconfig will copy a file from the board
directory to ".config" but you can also enter
the directory and do a make menuconfig.

>    trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in
>    trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk

New defconfigs for two at91 targets

>    trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
>    trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
> 
> 
> Changeset:
> 
> Sorry, the patch is too large to include (2502 lines).
> Please use ViewCVS to see it!
> 
> http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=24659
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
