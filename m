From: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
Date: Mon, 30 Jul 2007 12:41:21 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <20070730103200.GA24102@aon.at>
References: <20070729174350.EF22BA4508@busybox.net>
	<20070730072137.GB21479@aon.at>
	<1185781988.15219.2.camel@localhost.localdomain>
	<20070730083914.GA22956@aon.at>
	<1185786881.9395.1.camel@localhost.localdomain>
	<20070730092118.GC23273@aon.at>
	<1185790775.12206.5.camel@localhost.localdomain>
	<20070730103200.GA24102@aon.at>
Message-ID: <1185792081.1057.1.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Mon, 2007-07-30 at 12:32 +0200, Bernhard Fischer wrote:
> On Mon, Jul 30, 2007 at 12:19:35PM +0200, Hans-Christian Egtvedt wrote:
> >
> >On Mon, 2007-07-30 at 11:21 +0200, Bernhard Fischer wrote:
> 
> >> > # AVR32 GCC configuration
> >> >-ifeq ($(strip $(BR2_GCC_AVR32_CONFIGURATION)),y)
> >> >+ifeq ($(strip $(BR2_avr32)),y)
> >> > EXTRA_GCC_CONFIG_OPTIONS+=--disable-libmudflap
> >> > endif
> >> 
> >> This is the cross-compiler, isn't it? Why do you need to disable mudflap
> >> for the cross-compiler unconditionally?
> >
> >Because libmudflap does not build for AVR32 arch.
> 
> http://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=UNCONFIRMED&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&bug_status=WAITING&bug_status=SUSPENDED&field0-0-0=product&type0-0-0=substring&value0-0-0=mudflap&field0-0-1=component&type0-0-1=substring&value0-0-1=mudflap&field0-0-2=short_desc&type0-0-2=substring&value0-0-2=mudflap&field0-0-3=status_whiteboard&type0-0-3=substring&value0-0-3=mudflap&field1-0-0=product&type1-0-0=substring&value1-0-0=avr32&field1-0-1=component&type1-0-1=substring&value1-0-1=avr32&field1-0-2=short_desc&type1-0-2=substring&value1-0-2=avr32&field1-0-3=status_whiteboard&type1-0-3=substring&value1-0-3=avr32
> 
> Can't seem to find a PR about this brokenness?

There is a very easy answer to that, AVR32 architecture is not supported
by upstream GCC (yet).

The same goes for binutils and uClibc.

Hence the discussion at the end of last week about Buildroot size after
adding the AVR32 patches.

-- 
Mvh
Hans-Christian Egtvedt
