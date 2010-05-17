From: David Wooff <David.Wooff@calrec.com>
Date: Mon, 17 May 2010 15:02:37 +0100
Subject: [Buildroot] buildroot compilation problem
Message-ID: <1A3C06457633904EAC567D23DA05171702AA844F@calrec-exch03.calrecaudio.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
my buildroot compile seems to be getting stuck with an error and I'm not
sure how to cure it.  Would anyone care to advise?  Thanks:
 
/home/dez/buildroot-v23434/build_arm/staging_dir/usr/bin/arm-linux-uclib
cgnueabi-gcc -DMONOLITH -I.. -I../include  -mfloat-abi=soft  -fPIC
-DOPENSSL_PIC -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H
-DOPENSSL_NO_KRB5
-I/home/dez/buildroot-v23434/build_arm/staging_dir/usr/include
-DOPENSSL_NO_IDEA -DOPENSSL_NO_MDC2 -DOPENSSL_NO_RC5 -DL_ENDIAN -DTERMIO
-O3 -fomit-frame-pointer -Wall -Os
-I/home/dez/buildroot-v23434/build_arm/staging_dir/usr/include
-I/home/dez/buildroot-v23434/build_arm/staging_dir/include
--sysroot=/home/dez/buildroot-v23434/build_arm/staging_dir/ -isysroot
/home/dez/buildroot-v23434/build_arm/staging_dir -mtune=arm9tdmi
-msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64   -c -o s_client.o s_client.c
/home/dez/buildroot-v23434/build_arm/staging_dir/usr/bin/arm-linux-uclib
cgnueabi-gcc -DMONOLITH -I.. -I../include  -mfloat-abi=soft  -fPIC
-DOPENSSL_PIC -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H
-DOPENSSL_NO_KRB5
-I/home/dez/buildroot-v23434/build_arm/staging_dir/usr/include
-DOPENSSL_NO_IDEA -DOPENSSL_NO_MDC2 -DOPENSSL_NO_RC5 -DL_ENDIAN -DTERMIO
-O3 -fomit-frame-pointer -Wall -Os
-I/home/dez/buildroot-v23434/build_arm/staging_dir/usr/include
-I/home/dez/buildroot-v23434/build_arm/staging_dir/include
--sysroot=/home/dez/buildroot-v23434/build_arm/staging_dir/ -isysroot
/home/dez/buildroot-v23434/build_arm/staging_dir -mtune=arm9tdmi
-msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64   -c -o speed.o speed.c
speed.c:122:23: error: sys/timeb.h: No such file or directory
speed.c: In function 'Time_F':
speed.c:350: error: storage size of 'tstart' isn't known
speed.c:350: error: storage size of 'tend' isn't known
speed.c:356: warning: implicit declaration of function 'ftime'
speed.c:350: warning: unused variable 'tend'
speed.c:350: warning: unused variable 'tstart'
make[2]: *** [speed.o] Error 1
make[2]: Leaving directory
`/home/dez/buildroot-v23434/build_arm/openssl-0.9.7m/apps'
make[1]: *** [sub_all] Error 1
make[1]: Leaving directory
`/home/dez/buildroot-v23434/build_arm/openssl-0.9.7m'
make: ***
[/home/dez/buildroot-v23434/build_arm/openssl-0.9.7m/apps/openssl] Error
2


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100517/52f96389/attachment.htm>
