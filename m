From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Sun, 14 Mar 2010 12:41:49 +0200
Subject: [Buildroot] setserial fails to build (after uClibc 0.9.30.3
	upgrade?)
Message-ID: <4B9CBD6D.6010606@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am almost sure that setserial was building OK before uClibc upgrade to
0.9.30.3. Now I get:

/home/paulius/buildroot/output/build/staging_dir/usr/bin/i386-linux-uclibc-gcc 
-Os -pipe -Os -g2 -I/home/paulius/buildroot/output/build/staging_dir/usr/include 
-I/home/paulius/buildroot/output/build/staging_dir/include 
--sysroot=/home/paulius/buildroot/output/build/staging_dir/ -isysroot 
/home/paulius/buildroot/output/build/staging_dir -mtune=i386 -march=i386 
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 
-DHAVE_ASM_IOCTLS_H=1  -I. setserial.c -o setserial
setserial.c: In function ?get_multiport?:
setserial.c:249: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c: In function ?set_multiport?:
setserial.c:271: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c:281: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c:338: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c:342: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c: In function ?print_hayesesp?:
setserial.c:362: error: storage size of ?esp? isn?t known
setserial.c: In function ?set_hayesesp?:
setserial.c:378: error: storage size of ?esp? isn?t known
setserial.c:384: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c:410: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c: In function ?set_serial?:
setserial.c:488: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c:494: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c:512: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c:516: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c:520: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c:541: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c:571: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c:575: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c:579: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c:585: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c:592: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c:608: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c:613: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c: In function ?do_wild_intr?:
setserial.c:628: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c:632: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c:636: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c: In function ?usage?:
setserial.c:714: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c: In function ?main?:
setserial.c:749: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c:764: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c:770: warning: incompatible implicit declaration of built-in function 
?exit?
setserial.c:776: warning: incompatible implicit declaration of built-in function 
?exit?
make[1]: *** [setserial] Error 1
make[1]: Leaving directory `/home/paulius/buildroot/output/build/setserial-2.17'
make: *** [/home/paulius/buildroot/output/build/setserial-2.17/setserial] Error 2

Actual problem I see here is not with uClibc, but with setserial.c not including
stdlib.h. Due to my very limited time I can't provide fix now...

BR,
Paulius Zaleckas
