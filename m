From: tigmac <chromy@asix.cz>
Date: Tue, 3 Feb 2009 00:23:37 -0800 (PST)
Subject: [Buildroot]
	svn	commit:	trunk/buildroot/target/device/Atmel/at91bootstrap
Message-ID: <21805444.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I am afraid that AT91Bootstrap version 2.10 is broken regarding NAND flash.
The main problem being in Makefile:

ifeq ($(CONFIG_NANDFLASH),y)
CPPFLAGS += -DCONFIG_NAND_FLASH
endif

See the extra underscore which should not be there?
Unfortunately this is not the only problem, even if Makefile is corrected,
there is an #include missing
in  driver/nandflash.c causing the compilation to fail. In other words
version 2.10 is buggy like hell,
at least concerning NADN flash.
Unless you are willing to fix it yourself, I recommend using version 2.4.

BTW if I would like to submit a patch for AT91Bootstrap, where should I send
it so that it makes its way
info the official release?
-- 
View this message in context: http://www.nabble.com/svn-commit%3A-trunk-buildroot-target-device-Atmel-at91bootstrap-tp21404604p21805444.html
Sent from the BuildRoot mailing list archive at Nabble.com.
