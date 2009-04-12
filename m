From: Brad Johnson <bradjohn263@comcast.net>
Date: Sat, 11 Apr 2009 22:46:59 -0500
Subject: [Buildroot] buildroot openssl compile error
Message-ID: <49E16433.9010707@comcast.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am using buildroot to cross-compile an embedded ARM system. Everything 
else works fine, but I can not get openssl to compile (I am trying to 
add openssh and it requires openssl and zlib). It can not find zlib.h, 
although I have zlib1g-dev installed on my build machine (a 386 Ubuntu 
system).
I have tried manually configuring openssl (./Configure 
--with-zlib-include=/usr/include), with no success.
Here is the error I get:

making all in crypto/comp...
make[3]: Entering directory 
`/home/brad/2240/buildroot-2009.02/build_arm/openssl
-0.9.8g/crypto/comp'
/opt/arm-linux/usr/bin/arm-linux-gcc -I.. -I../.. -I../../include -fPIC 
-DOPENSS
L_PIC -DZLIB_SHARED -DZLIB -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN 
-DHAVE_DLF
CN_H -DTERMIO -O3 -fomit-frame-pointer -Wall   -c -o comp_lib.o comp_lib.c
/opt/arm-linux/usr/bin/arm-linux-gcc -I.. -I../.. -I../../include -fPIC 
-DOPENSS
L_PIC -DZLIB_SHARED -DZLIB -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN 
-DHAVE_DLF
CN_H -DTERMIO -O3 -fomit-frame-pointer -Wall   -c -o comp_err.o comp_err.c
/opt/arm-linux/usr/bin/arm-linux-gcc -I.. -I../.. -I../../include -fPIC 
-DOPENSS
L_PIC -DZLIB_SHARED -DZLIB -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN 
-DHAVE_DLF
CN_H -DTERMIO -O3 -fomit-frame-pointer -Wall   -c -o c_rle.o c_rle.c
/opt/arm-linux/usr/bin/arm-linux-gcc -I.. -I../.. -I../../include -fPIC 
-DOPENSS
L_PIC -DZLIB_SHARED -DZLIB -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN 
-DHAVE_DLF
CN_H -DTERMIO -O3 -fomit-frame-pointer -Wall   -c -o c_zlib.o c_zlib.c
c_zlib.c:25:18: error: zlib.h: No such file or directory

Thanks in advance for any help with this.
...Brad
