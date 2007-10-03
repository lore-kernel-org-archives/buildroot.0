From: Leonid <Leonid@a-k-a.net>
Date: Wed, 3 Oct 2007 16:55:54 -0700
Subject: [Buildroot] GDB for threads.
In-Reply-To: <4704186D.6070303@cavebear.com>
References: <4704186D.6070303@cavebear.com>
Message-ID: <406A31B117F2734987636D6CCC93EE3C0246F090@ehost011-3.exch011.intermedia.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi:

GDB on my target says it cannot debug threads:

dlopen failed on 'libthread_db.so.1' - File not found
GDB will not be able to debug pthreads.

GNU gdb 6.3
Copyright 2004 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you
are
welcome to change it and/or distribute copies of it under certain
conditions.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for
details.
This GDB was configured as "arm-linux".
(gdb)

I have chosen thread library debugging option and have re-built
toolchain:

Toolchain Options -->
  [x] Thread library debugging
 
The build went through but as a result I see broken link in the lib
directory of my toolchain and no real library:

rwxr-xr-x  1 leonid leonid   26330 2007-10-03 14:27 libssp.so.0.0.0
lrwxrwxrwx  1 leonid leonid      17 2007-10-03 14:24 libthread_db.so ->
libthread_db.so.1
-rw-r--r--  1 leonid leonid  309856 2007-10-03 14:24 libuClibc-0.9.29.so
-rw-r--r--  1 leonid leonid    4656 2007-10-03 14:24 libutil-0.9.29.so
-

Thanks,

Leonid.
