From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 29 Sep 2007 22:49:14 +0200
Subject: [Buildroot] --with-abi=<empty> ... during gcc build
In-Reply-To: <1191097947.5322.282.camel@elrond.atmel.sweden>
References: <1191087530.5322.275.camel@elrond.atmel.sweden>
	<20070929182857.GS20951@aon.at>
	<1191097947.5322.282.camel@elrond.atmel.sweden>
Message-ID: <20070929204914.GU20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 29, 2007 at 10:32:26PM +0200, Ulf Samuelsson wrote:
>l?r 2007-09-29 klockan 20:28 +0200 skrev Bernhard Fischer:
>> On Sat, Sep 29, 2007 at 07:38:50PM +0200, Ulf Samuelsson wrote:
>> >gcc configure is passed $(GCC_WITH_ABI)
>> >which is defined as:
>> >toolchain/gcc/Makefile.in:GCC_WITH_ABI:=--with-abi=$(BR2_GCC_TARGET_ABI)
>> 
>> Well, if it is empty it will not be set, so there is something wrong at
>> your end, really.
>> ifneq ($(strip $(subst ",,$(BR2_GCC_TARGET_ABI))),)
>> # ")))
>> GCC_WITH_ABI:=--with-abi=$(BR2_GCC_TARGET_ABI)
>> endif

Note that this has nothing to do with that. I have a suspicion (comment
the EABI selection of the device/Arm/Config.in locally for now.
Locally!)

>I think this is why I get an EABI compiler
>even when OABI is selected in buildroot.
 
grep -i abi .config
once again, please.
>
>I fo not know if --with-abi=32 is the right thing to do for ARM
>when OABI is wanted, so if you know it is different, pls change.

I took that unreflected and applied it. Oh well..
