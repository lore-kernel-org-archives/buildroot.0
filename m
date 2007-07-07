From: Ulf Samuelsson <ulf@atmel.com>
Date: Sun, 8 Jul 2007 00:49:20 +0200
Subject: [Buildroot] $(TARGET_CONFIGURE_OPTS) $(MAKE) vs
	$(MAKE)	$(TARGET_CONFIGURE_OPTS)
References: <006201c7bfd9$de0f46a0$dcc4af0a@atmel.com>
	<20070706155558.GA18954@real.realitydiluted.com>
	<000201c7c087$9e70d0a0$dcc4af0a@atmel.com>
	<20070707130132.GU4096@aon.at>
	<1183824383.19912.5.camel@elrond.sweden.atmel.com>
	<20070707172925.GV4096@aon.at>
	<1183837025.19912.17.camel@elrond.sweden.atmel.com>
	<20070707211606.GZ4096@aon.at>
Message-ID: <05fb01c7c0e9$275c45a0$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Sat, Jul 07, 2007 at 09:37:05PM +0200, Ulf Samuelsson wrote:
>>l?r 2007-07-07 klockan 19:29 +0200 skrev Bernhard Fischer:
>>> On Sat, Jul 07, 2007 at 06:06:23PM +0200, Ulf Samuelsson wrote:
>>> >> >I think someone got it wrong in the "package/mtd/mtd.mk" which says
>>> >> >
>>> >> >    $(TARGET_CONFIGURE_OPTS) $(MAKE) ...    - build using gcc
>>> >> >    
>>> >> >which should be:
>>> >> >
>>> >> >     $(MAKE) $(TARGET_CONFIGURE_OPTS) ...    - build using arm-linux-uclibc-gcc
>>> >> 
>>> >> yes, the latter is correct. Steven, please repair or elaborate.
>>> >> 
>>> >
>>> >Here are a set of patches to change the position of
>>> >TARGET_CONFIGURE_OPTS.
>>> >Please review and apply if you agree.
>>> >
>>> >
>>

Stephen, can you pls review the mtd part of this patch ASAP,
since this breaks the build for ARM (and possibly all non-x86).
Pls commit (or ack my commit) if OK.

Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57

Technical support when I am not available:
AT90 AVR Applications Group: mailto:avr at atmel.com
AT91 ARM Applications Group: mailto:at91support at atmel.com
AVR32 Applications Group        mailto:avr32 at atmel.com
http://www.avrfreaks.net/;            http://avr32linux.org/
http://www.at91.com/ ;                ftp://at91dist:distrib at 81.80.104.162/
