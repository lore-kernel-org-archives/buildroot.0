From: Johannes Morgenroth <morgenroth@ibr.cs.tu-bs.de>
Date: Fri, 07 Feb 2014 16:59:41 +0100
Subject: [Buildroot] SIGSEGV in __pthread_initialize_minimal_internal ()
In-Reply-To: <52F3B2BC.3000904@ibr.cs.tu-bs.de>
References: <52F3B2BC.3000904@ibr.cs.tu-bs.de>
Message-ID: <52F502ED.6000902@ibr.cs.tu-bs.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I do not know why, but disabling SSP (stack protection) allows to
generate working binaries again.
Maybe now anyone can tell me why that is an issue?

Kind regards,
Johannes Morgenroth



Am 06.02.2014 17:05, schrieb Johannes Morgenroth:
> $ gdb --args ./output/build/ibrdtnd-0.10.2/src/dtnd
> GNU gdb (GDB) 7.6.1-ubuntu
> Copyright (C) 2013 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later
> <http://gnu.org/licenses/gpl.html>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
> and "show warranty" for details.
> This GDB was configured as "x86_64-linux-gnu".
> For bug reporting instructions, please see:
> <http://www.gnu.org/software/gdb/bugs/>...
> Reading symbols from ./output/build/ibrdtnd-0.10.2/src/dtnd...done.
> (gdb) r
> Starting program: ./output/build/ibrdtnd-0.10.2/src/dtnd
>
> Program received signal SIGSEGV, Segmentation fault.
> 0x082b81f1 in __pthread_initialize_minimal_internal ()
> (gdb) bt
> #0  0x082b81f1 in __pthread_initialize_minimal_internal ()
> #1  0x08408797 in __uClibc_init ()
> #2  0x08408939 in __uClibc_main ()
> #3  0x08049111 in _start ()
> (gdb)


-- 
Johannes Morgenroth     Institut fuer Betriebssysteme und Rechnerverbund
Tel.: +49-531-391-3249                           Muehlenpfordtstrasse 23
Fax.: +49-531-391-5936      TU Braunschweig         D-38106 Braunschweig
