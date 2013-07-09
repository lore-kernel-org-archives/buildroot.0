From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 09 Jul 2013 12:50:51 +0200
Subject: [Buildroot] Buildroot compilation using uClibc and activating
	bluez
In-Reply-To: <747C1E83C744F44E9ACFB89FAEEC2C7B2423BF9923@EXDCVYMBSTM005.EQ1STM.local>
 (Julien COUVRAND's message of "Tue, 9 Jul 2013 10:57:13 +0200")
References: <747C1E83C744F44E9ACFB89FAEEC2C7B2423BF9923@EXDCVYMBSTM005.EQ1STM.local>
Message-ID: <8738rohur8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien COUVRAND <julien.couvrand@stericsson.com> writes:

 Julien> Hi,

 Julien> I would like to enable Bluez packages using uClibc but i meet
 Julien> some dependencies with MMU.  We can't enable bluez-utils
 Julien> package while MMU is deactivated.

 Julien> As soon as i compile Buildroot deactivating MMU dependencies
 Julien> into Config.in from bluez-utils package such as:

 Julien> --
 Julien> config BR2_PACKAGE_BLUEZ_UTILS
 Julien> 	bool "bluez-utils"
 Julien> 	depends on !BR2_avr32
 Julien> 	depends on BR2_USE_WCHAR # libglib2
 Julien> 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib
 Julien> 	# depends on BR2_USE_MMU # dbus
 Julien> 	select BR2_PACKAGE_DBUS
 Julien> 	select BR2_PACKAGE_LIBGLIB2
 Julien> 	help
 Julien> 	  bluez utils
 Julien> --

Indeed, dbus really requires a MMU.

 Julien> So, currently, using uclibc for bluez, without MMU activation,
 Julien> I can't compile Buildroot due dBus and the "fork".  Does it
 Julien> exist a way to enable bluez using uClibc avoiding Dbus issues?

Well, uClibc works nicely with a MMU. What hardware platform is this,
doesn't it have a MMU?

-- 
Bye, Peter Korsgaard
