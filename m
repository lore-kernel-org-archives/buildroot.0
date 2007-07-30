From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 30 Jul 2007 10:39:14 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <1185781988.15219.2.camel@localhost.localdomain>
References: <20070729174350.EF22BA4508@busybox.net>
	<20070730072137.GB21479@aon.at>
	<1185781988.15219.2.camel@localhost.localdomain>
Message-ID: <20070730083914.GA22956@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 30, 2007 at 09:53:08AM +0200, Hans-Christian Egtvedt wrote:
>
>On Mon, 2007-07-30 at 09:21 +0200, Bernhard Fischer wrote:
>> On Sun, Jul 29, 2007 at 10:43:50AM -0700, ulf at uclibc.org wrote:
>
><cut patch info header>
>
>> >+config BR2_GCC_TARGET_AVR32_CONFIGURATION
>> >+	bool "Enable default AVR32 GCC configuration"
>> >+	default y
>> >+	depends BR2_avr32 && BR2_PACKAGE_GCC_TARGET
>> >+	help
>> >+	  For the AVR32 platform there is some configuration which are not
>> >+	  supported.
>> >+
>> >+	  Currently this will add "--disable-libmudflap" to configure.
>> >+
>> 
>> I object to this change.
>> Please explain why you don't just add disable-mudflap if the target arch
>> is BR2_avr32
>
>So a little patch to alter the toolchain/gcc/Makefile.in to modify
>EXTRA_TARGET_GCC_CONFIG_OPTIONS when ARCH is avr32 is a clean and nice
>solution?
>
>And remove this stuff from Config.in.2?

exactly, yes.
>
>If the solution above, I agree.
>
>> > config BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS
>> > 	string "Additional target gcc options"
>> > 	default ""
>> >+	depends BR2_PACKAGE_GCC_TARGET
>> > 	help
>> > 	  Any additional target gcc options you may want to include....
>> > 	  Including, but not limited to --disable-checking etc.
