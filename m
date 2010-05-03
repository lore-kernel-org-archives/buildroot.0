From: Microbit_Ubuntu <microbit@virginbroadband.com.au>
Date: Tue, 04 May 2010 08:06:48 +1000
Subject: [Buildroot] ext x-tools (ct-ng-1.6.1) make error for LIB path with
	2010.02
Message-ID: <1272924408.17672.12.camel@ubuntu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I wonder if someone can enlighten me on this.
After setting up x-tools (ct-ng 1.6.1) and building BR2 2010.02, 

1. links-2.2
The configure scripts seem to lose the LIB include for links package :
original error = "cannot find -lz"
After checking around, turns out that the path to staging/usr/lib is
simply not found. I worked around it by making links_LDFLAGS =
-L/path/to/buildroot/output/staging/usr/lib

2. ltrace-0.5
the OS path for sysdeps gets set to :
OS := linux-uclibcgnueabi
whereas internal toolchain 2010.02 produces at start of Makefile :
OS = linux-gnu
This results in an unknown path to /sysdeps/


Has anyone come across this behaviour before ?
I can workaround for now by manually changing Makefile and then resuming
build.

I can't find the common denominator - I think it has to do with CC being
set --sysroot=......
whereas the internal toolchain produces
--isysroot=......   ?????

Any input would be very welcome !!!
TIA

-- 
Best regards,
Kris
