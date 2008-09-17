From: J Lee <jameslee05@gmail.com>
Date: Wed, 17 Sep 2008 11:38:16 -0700
Subject: [Buildroot] oprofile build error related to gcc
Message-ID: <ccdbf7fe0809171138q281529d6tf964e5bec4a1ffbe@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I got this error while I was building oprofile for a powerpc target.
I have checked gcc directories but I did not see any gcc_s_nof.
How can I get around this?
Thanks in advance.

rm -f libabi.a
ar cru libabi.a abi.o op_abi.o
/home/buildroot/output/devel/tools/bin/powerpc-linux-uclibc-ranlib libabi.a
if /home/buildroot/output/devel/tools/bin/powerpc-linux-uclibc-g++
-DHAVE_CONFIG_H -I. -I. -I..  -I ../libop -I ../libutil -I ../libdb -I
../libopt++
-I/home/buildroot/output/devel//binutils-2.15.94.0.2.2-target/bfd
-I/home/buildroot/output/devel//popt-1.14
-I/home/buildroot/output/devel//root/usr/include -W -Wall -fno-common
-ftemplate-depth-50 -g -O2 -MT opimport.o -MD -MP -MF ".deps/opimport.Tpo"
-c -o opimport.o opimport.cpp; \
    then mv -f ".deps/opimport.Tpo" ".deps/opimport.Po"; else rm -f
".deps/opimport.Tpo"; exit 1; fi
/home/buildroot/output/devel/tools/bin/powerpc-linux-uclibc-g++ -W -Wall
-fno-common -ftemplate-depth-50 -g -O2
-L/home/buildroot/output/devel/root/usr/lib -o opimport  opimport.o libabi.a
../libdb/libodb.a ../libopt++/libopt++.a ../libutil++/libutil++.a
../libutil/libutil.a -lpopt -liberty -ldl -lintl
/home/buildroot/output/devel/tools/lib/gcc-lib/powerpc-linux-uclibc/3.3.5/../../../../powerpc-linux-uclibc/bin/ld:
cannot find -lgcc_s_nof
collect2: ld returned 1 exit status
make[4]: *** [opimport] Error 1
make[4]: Leaving directory
`/home/buildroot/output/devel/oprofile-0.9.3/libabi'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/home/buildroot/output/devel/oprofile-0.9.3/libabi'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/home/buildroot/output/devel/oprofile-0.9.3'
make[1]: *** [all] Error 2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080917/fba45e51/attachment.htm 
