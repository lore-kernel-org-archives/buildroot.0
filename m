From: Peter Mendham <petermendham@computing.dundee.ac.uk>
Date: Wed, 08 Nov 2006 13:57:07 +0000
Subject: [Buildroot] Compile errors during buildroot make
Message-ID: <4551E233.3060406@computing.dundee.ac.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

I am new to buildroot and trying to run it for the first time, I am also 
a fairly new linux user so I apologise for any naivety.  I am attempting 
to make buildroot for a PowerPC on cygwin (x86 Win XP).  I went with the 
default set of options (mostly, I added some things like bash to 
BusyBox) in menuconfig and then went on to make.  I don't fully 
understand the make process but I will describe the problem as best I 
can.  The compile errors occur during the build for uclibc, I *think* in 
buildroot/toolchain_build_powerpc/uClibc/utils/Makefile.in when it is 
executed by buildroot/toolchain/uClibc/uclibc.mk on line 149.  The 
errors are gcc compilation errors when executing the command "gcc 
../utils/readelf.c  -o ../utils/readelf.host  -Wl,-s  -O2 -Wall -include 
../include/elf.h".  The root cause of the errors seems to be an 
inability to include "link.h" which is in the ../include directory, but 
there doesn't seem to be -I../include, but then, maybe there doesn't 
need to be, I don't know.

I'm not entirely sure what version of buildroot I checked out, but I 
checked it out yesterday at about 14:00 GMT.  I suspect I'm not giving 
enough information here to be of any use, but I'm not sure what is most 
pertinent.  If anyone can help, and needs some more info, please just 
let me know and I'll post it.

TIA,

Peter

-- 
------------------------------------------
Peter Mendham
------------------------------------------
Space Systems Research Group
School of Computing, University of Dundee
Dundee, Scotland, DD1 1HN, UK
------------------------------------------
e: petermendham at computing.dundee.ac.uk
t: +44 (0)1382 386729
f: +44 (0)1382 388838
------------------------------------------
