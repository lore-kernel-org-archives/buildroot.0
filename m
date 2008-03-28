From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 28 Mar 2008 14:08:31 +0100
Subject: [Buildroot] Size of svn
Message-ID: <021701c890d9$3e8c6370$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I looked through the svn.

The avr32 boards (target/device/Atmel/atngw100_<xxx>)
recently added by John Voltz, each have their own patchset, 
and the large patches are duplications of the patches in
(target/device/Atmel/arch-avr32/kernel-patches-<version>)
That adds 2-3 MB and should be cleaned up.

The major remaining part in terms of size in target/device/Atmel 
are kernel patches for at91 and avr32 for different kernel versions.
It would be possible to download these patches as well
from an ftpserver, but the infrastructure in "target/linux" is
not there yet. I think this is 5-6 MB.

==========================
The toolchain patches for avr32 added by John,
is IMHO unneccessary and can be removed. 
IIRC they add 7-8 MB to the svn size.

The avr32 toolchain can (and should)
be built using the prepatched source.
If patches are required, then they can be located in the
(target/device/Atmel/toolchain) directory.



Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57

Join the Atmel 2008 Microcontroller Seminar April 7-10.
Introducing X-Mega, AVR32 and ARM9. STK600 Kit included.
Register at Acte, Arrow or EBV webpage.

Technical support when I am not available:
AT90 AVR Applications Group: mailto:avr at atmel.com
AT91 ARM Applications Group: mailto:at91support at atmel.com
AVR32 Applications Group        mailto:avr32 at atmel.com
http://www.avrfreaks.net/;            http://avr32linux.org/
http://www.at91.com/ ;                 http://www.linux4sam.org/
