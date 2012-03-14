From: Raj Kumar <raj_kumar_sh@yahoo.com>
Date: Wed, 14 Mar 2012 00:55:44 -0700 (PDT)
Subject: [Buildroot] Error while cross-compiling ntp using buildroot for MIPS
Message-ID: <1331711744.26964.YahooMailNeo@web112018.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,


I am trying to cross compile ntp-4.2.6p3? (network time protocol) using? buildroot-2009.02 (mipsel-linux-gcc) for MIPS processor. 


On linux-2.6.32-21 based machine ntp package cross compiles fine.
But? I? am getting error while cross compiling the same package using the same version of? buildroot on 2.6.35-28 based PC.



Case 1? (Everything works fine)

---------
Build root version :-  buildroot-2009.02 (mipsel-linux-gcc)
Build Machine Linux version :-?  2.6.32-21-generic #32-Ubuntu SMP
Target Linux version :-? linux-2.6.29.2


NTP version :-? ntp-4.2.6p3
automake (GNU automake) 1.11.1
aclocal (GNU automake) 1.11.1


Case 2? (? gives compilation error? )

--------------------------------------

Build root version :-  buildroot-2009.02 (mipsel-linux-gcc)
Build Machine Linux version :-?? 2.6.35-28-generic #50-Ubuntu SMP
Target Linux version :-? linux-2.6.29.2


NTP version :-? ntp-4.2.6p3
automake (GNU automake) 1.11.1
aclocal (GNU automake) 1.11.1
libtoolize (GNU libtool) 2.2.6b
Just for testing i compiled ntp using gcc, on the same machine and the? package compiles fine.? 

So problem happens only when cross compiling using buildroot.? 

When i cross-compiled first time i got following error 

---------------------------------------------------------------------------------

make[2]: Entering directory `/home/ws/mint_ubuws2/test-depot/test/main/src/external/ntp-4.2.6p3'
CDPATH="${ZSH_VERSION+.}:" && cd . && /bin/sh /home/ws/mint_ubuws2/test-depot/test/main/src/external/ntp-4.2.6p3/missing --run aclocal-1.11 -I m4 -I sntp/libopts/m4
?cd . && /bin/sh /home/ws/mint_ubuws2/test-depot/test/main/src/external/ntp-4.2.6p3/missing --run automake-1.11 --foreign
ElectricFence/Makefile.am:11: library used but `RANLIB' is undefined
ElectricFence/Makefile.am:11:?? The usual way to define `RANLIB' is to add `AC_PROG_RANLIB'
ElectricFence/Makefile.am:11:?? to `configure.ac' and run `autoconf' again.
libntp/Makefile.am:7: library used but `RANLIB' is undefined
libntp/Makefile.am:7:?? The usual way to define `RANLIB' is to add `AC_PROG_RANLIB'
libntp/Makefile.am:7:?? to `configure.ac' and run `autoconf' again.
libparse/Makefile.am:6: library used but `RANLIB' is undefined
libparse/Makefile.am:6:?? The usual way to define `RANLIB' is to add `AC_PROG_RANLIB'
libparse/Makefile.am:6:?? to `configure.ac' and run `autoconf' again.
ntpd/Makefile.am:10: library used but `RANLIB' is undefined
ntpd/Makefile.am:10:?? The usual way to define `RANLIB' is to add `AC_PROG_RANLIB'
ntpd/Makefile.am:10:?? to `configure.ac' and run `autoconf' again.
ntpq/Makefile.am:18: library used but `RANLIB' is undefined
ntpq/Makefile.am:18:?? The usual way to define `RANLIB' is to add `AC_PROG_RANLIB'
ntpq/Makefile.am:18:?? to `configure.ac' and run `autoconf' again.
--------------------------------------------------------------------------------------


Then i added? AC_PROG_RANLIB in configure.ac and recompiled the package . Then i hit the following error

----------------------------------------------------------------------------------------
libopts/Makefile.am:4: Libtool library used but `LIBTOOL' is undefined
libopts/Makefile.am:4:?? The usual way to define `LIBTOOL' is to add `AC_PROG_LIBTOOL'
libopts/Makefile.am:4:?? to `configure.ac' and run `aclocal' and `autoconf' again.
libopts/Makefile.am:4:?? If `AC_PROG_LIBTOOL' is in `configure.ac', make sure
libopts/Makefile.am:4:?? its definition is in aclocal's search path.
---------------------------------------------------------------------------------------
I have added AC_PROG_LIBTOOL in configure.ac and recompiled but gave the same error.


I goggled and tried some solutions suggested like? recompiling the aclocal , libtool prefixing /usr/share . etc ..? but didn't help ..

Please find attached? detailed build log.


Your help would be highly appreciated.


Thanks and Regards
Raj
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120314/9e153169/attachment-0001.html>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: ntp_logs.txt
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120314/9e153169/attachment-0001.txt>
