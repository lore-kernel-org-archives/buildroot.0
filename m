From: bbj17 at gmx.de <bbj17@gmx.de>
Date: Tue, 04 Aug 2009 11:30:09 +0200
Subject: [Buildroot] float, va_arg, printf on x86_64
Message-ID: <20090804093009.28470@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I found the bug. IT seems to be a bad combination of Host-GCC and Target-GCC:

Host1-Environment:
GNU make version '3.81'
C compiler version '4.2.1'
C++ compiler version '4.2.1'

Target architecture = x86_64
Target GCC => 4.3.3
printf %f 7 => error => -26815615859...

----------------------------------

Host2-Environment:
GNU make version '3.81'
C compiler version '4.2.1'
C++ compiler version '4.2.1'

Target architecture = x86_64
Target GCC => 4.4.1
printf %f 7 => OK => 7.0000

-----------------------------------

Host3-Environment:
GNU make version '3.81'
C compiler version '4.3.2'
C++ compiler version '4.3.2'

Target architecture = x86_64
Target GCC => 4.3.3
printf %f 7 => OK => 7.0000




-- 
GRATIS f?r alle GMX-Mitglieder: Die maxdome Movie-FLAT!
Jetzt freischalten unter http://portal.gmx.net/de/go/maxdome01
