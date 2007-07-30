From: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
Date: Mon, 30 Jul 2007 12:19:35 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <20070730092118.GC23273@aon.at>
References: <20070729174350.EF22BA4508@busybox.net>
	<20070730072137.GB21479@aon.at>
	<1185781988.15219.2.camel@localhost.localdomain>
	<20070730083914.GA22956@aon.at>
	<1185786881.9395.1.camel@localhost.localdomain>
	<20070730092118.GC23273@aon.at>
Message-ID: <1185790775.12206.5.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Mon, 2007-07-30 at 11:21 +0200, Bernhard Fischer wrote:
> On Mon, Jul 30, 2007 at 11:14:41AM +0200, Hans-Christian Egtvedt wrote:
> >
> >On Mon, 2007-07-30 at 10:39 +0200, Bernhard Fischer wrote:
> >> On Mon, Jul 30, 2007 at 09:53:08AM +0200, Hans-Christian Egtvedt wrote:
> >> >
> >> >On Mon, 2007-07-30 at 09:21 +0200, Bernhard Fischer wrote:
> >> >> On Sun, Jul 29, 2007 at 10:43:50AM -0700, ulf at uclibc.org wrote:

<cut>

> > config BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS
> > 	string "Additional target gcc options"
> > 	default ""
> >diff --git a/toolchain/gcc/Makefile.in b/toolchain/gcc/Makefile.in
> >index ec14b25..b087eb2 100644
> >--- a/toolchain/gcc/Makefile.in
> >+++ b/toolchain/gcc/Makefile.in
> >@@ -12,7 +12,7 @@ EXTRA_GCC_CONFIG_OPTIONS:=$(strip $(subst ",, $(BR2_EXTRA_GCC_CONFIG_OPTIONS)))
> > #"))
> > 
> > # AVR32 GCC configuration
> >-ifeq ($(strip $(BR2_GCC_AVR32_CONFIGURATION)),y)
> >+ifeq ($(strip $(BR2_avr32)),y)
> > EXTRA_GCC_CONFIG_OPTIONS+=--disable-libmudflap
> > endif
> 
> This is the cross-compiler, isn't it? Why do you need to disable mudflap
> for the cross-compiler unconditionally?

Because libmudflap does not build for AVR32 arch.

> Other than that it's ok to apply.

<cut>

-- 
Regards
Hans-Christian Egtvedt
