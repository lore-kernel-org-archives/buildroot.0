From: Ether Brat <etherbrat@hotmail.com>
Date: Fri, 7 Oct 2011 22:22:56 +1000
Subject: [Buildroot] Incorrect sysroot?
Message-ID: <BLU0-SMTP205DA131C115414D017385BA4FE0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to use buildroot with an external toolchain.

The following output from buildroot seems to indicate that sysroot has
not been set up correctly:

=====<quote>
checking for avr32-linux-gcc...
/home/neil/Projects/Atmel-buildroot-avr32-v3.0.0-1-1/output/staging/usr/bin/avr32-linux-gcc
-Os -pipe -Os
-I/home/neil/Projects/ICnova-20110104-2/ICnova/build_avr32/staging_dir/include
-I/home/neil/Projects/ICnova-20110104-2/ICnova/build_avr32/staging_dir/usr/include
-I/home/neil/Projects/Atmel-buildroot-avr32-v3.0.0-1-1/output/staging/usr/avr32-linux/include
--sysroot /home/neil/Projects/ICnova-20110104-2/ICnova/build_avr32/staging_dir/
checking for C compiler default output file name... configure: error: C
compiler cannot create executables
See `config.log' for more details.
make: ***
[/home/neil/Projects/ICnova-20110104-2/ICnova/build_avr32/gdbserver-6.7.1/.configured]
Error 77
=====<unquote>

The correct compiler has been invoked, but sysroot is not pointing to
the correct container for the compatible .../lib (which sits beside
the .../bin directory containing the compiler (actually a simlink to
ccache).

Is my understanding correct? How can I fix this?
