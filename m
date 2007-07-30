From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 30 Jul 2007 16:34:00 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
References: <20070729174728.EC106A4508@busybox.net>
	<20070730073648.GD21479@aon.at>
Message-ID: <026501c7d2c2$c740ce70$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Bernhard Fischer" <rep.dot.nop@gmail.com>
To: <buildroot@uclibc.org>
Cc: <ulf@atmel.com>
Sent: Monday, July 30, 2007 9:36 AM
Subject: Re: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc


> On Sun, Jul 29, 2007 at 10:47:28AM -0700, ulf at uclibc.org wrote:
>>Author: ulf
>>Date: 2007-07-29 10:47:27 -0700 (Sun, 29 Jul 2007)
>>New Revision: 19333
>>
>>Log:
>>Add AVR32 support to uClibc
>>
>>Modified:
>>   trunk/buildroot/toolchain/uClibc/uclibc.mk
>>
>>
>>Changeset:
>>Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
>>===================================================================
>>--- trunk/buildroot/toolchain/uClibc/uclibc.mk 2007-07-29 17:43:50 UTC (rev 19332)
>>+++ trunk/buildroot/toolchain/uClibc/uclibc.mk 2007-07-29 17:47:27 UTC (rev 19333)
> 
> [snip utterly ugly VENDOR specific stuff]
> 
>>@@ -241,15 +252,19 @@
>> mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/usr/include
>> mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/usr/lib
>> mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/lib
>>+ 
>>+ touch $@
>>+
> 
> Please explain the need for the empty line above (and remove it).
> 
>>+$(UCLIBC_DIR)/.oldconfig: $(UCLIBC_DIR)/.config
>> $(MAKE1) -C $(UCLIBC_DIR) \
>> PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
>> DEVEL_PREFIX=/usr/ \
>> RUNTIME_PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
>> HOSTCC="$(HOSTCC)" \
>> oldconfig
>>- touch -c $@
>>+ touch $@
>> 
>>-$(UCLIBC_DIR)/.configured: $(UCLIBC_DIR)/.config
>>+$(UCLIBC_DIR)/.configured: $(UCLIBC_DIR)/.oldconfig
>> set -x && $(MAKE1) -C $(UCLIBC_DIR) \
>> PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
>> DEVEL_PREFIX=/usr/ \
>>@@ -359,9 +374,13 @@
>> UCLIBC_TARGETS=$(TARGET_DIR)/lib/libc.so.0
>> endif
>> 
>>-uclibc-configured: kernel-headers $(UCLIBC_DIR)/.configured
>>+uclibc-configured: dependencies kernel-headers $(UCLIBC_DIR)/.configured
> 
> NO! I removed this "dependencies" on purpose. Ulf, you keep reverting
> fixes. Please explain in detail why you did this.
> 

Sorry about that.
I am trying to migrate an AVR32 specific buildroot to mainstream.
I did not do that so I am not 100% sure of all the differences.
Where there are differences, I could sometimes see that this
is due to old stuff, but some stuff looked to be additions
by the AVR32 team.
Obvsiously that has introduced some mistakes which I will remove ASAP.

BTW: If  you are still interested in an AVR32 Gateway, I now have one spare.
Pls resend your address if that is the case.

Best Regards
Ulf Samuelsson
