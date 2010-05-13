From: Bill Borton <security@conwin.com>
Date: Thu, 13 May 2010 14:41:45 -0500
Subject: [Buildroot] Kernel config for Atmel at91sam9g20ek dev board?
Message-ID: <20100513144145.16fd98a5@snot.conwin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Around October 2009 I did a "git clone git://git.buildroot.net/buildroot"
and with these settings built a kernel and jffs2 file system that runs
great on my Atmel AT91SAM9G20EK dev board.

Build options  --->
    [*] Atmel Device Support  ---> 
          [*] Board support for the Atmel AT91 range of microprocessors
              AT91 device (Atmel AT91SAM9G20 Microprocessor)  --->
              Development Board support (Atmel AT91SAM9G20EK)  --->




Yesterday I did another git clone and configured these options:

Target options  --->
    [*] Atmel Device Support  ---> 
          *** Atmel AT91 Specific Device Support ***
          [*]   Board support for the Atmel AT91 range of microprocessors 
                *** Selection criteria ***   
          [*]     Allow all ARM targets  
                *** Device Selection ***  
          AT91 device (Atmel AT91SAM9G20 Microprocessor)  --->
                *** Development Board Selection *** 
          Development Board support (Atmel AT91SAM9G20EK)  ---> 

When I did a make it errored out with this:


  You should create a .config for your kernel
  and install it as
  target/device/Atmel/at91sam9g20ek/at91sam9g20ek-linux-2.6.33.3.config

cp -dpf target/device/Atmel/at91sam9g20ek/at91sam9g20ek-linux-2.6.33.3.config /home/drumgod/space1/atmel_linux/buildroot/from_uclibc/5-12-10/buildroot/output/build/linux-2.6.33.3/.config
cp: cannot stat `target/device/Atmel/at91sam9g20ek/at91sam9g20ek-linux-2.6.33.3.config': No such file or directory
make: ***
[/home/drumgod/space1/atmel_linux/buildroot/from_uclibc/5-12-10/buildroot/output/build/linux-2.6.33.3/.configured]
Error 1



It seems that the first time I used buildroot it found and used
the correct kernel config for my dev board.  Now it does not.  It
could be I missed something I did before, but I don't think so.  I
will start looking into it, but any pointers you can give me would
be much appreciated.

Thanks,
-Bill
