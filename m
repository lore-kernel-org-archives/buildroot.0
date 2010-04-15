From: Belisko Marek <marek.belisko@gmail.com>
Date: Thu, 15 Apr 2010 13:24:25 +0200
Subject: [Buildroot] openssl 0.9.8.n compilation problem
Message-ID: <q2je7c6a05e1004150424w61966695v31ec1ee0e1dfcb18@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I would like to build with buildroot transmission which
is dependent on libcurl and openssl. I have a problems with building of ssl.

I build toolchain in buildroot with uclibc.

Error is:
/home/open-nandra/projects/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc
-I.. -I../.. -I../../include -fPIC -DOPENSSL_PIC -DZLIB_SHARED -DZLIB
-DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DTERMIO -Os
-pipe -Os  -I/home/open-nandra/projects/buildroot/output/staging/usr/include
-I/home/open-nandra/projects/buildroot/output/staging/include
--sysroot=/home/open-nandra/projects/buildroot/output/staging/
-isysroot /home/open-nandra/projects/buildroot/output/staging
-mabi=aapcs-linux -msoft-float -fomit-frame-pointer -Wall   -c -o
bss_dgram.o bss_dgram.c
bss_dgram.c: In function 'dgram_ctrl':
bss_dgram.c:433: error: 'IPV6_PMTUDISC_DO' undeclared (first use in
this function)
bss_dgram.c:433: error: (Each undeclared identifier is reported only once
bss_dgram.c:433: error: for each function it appears in.)
bss_dgram.c:434: error: 'IPV6_MTU_DISCOVER' undeclared (first use in
this function)
bss_dgram.c:474: error: 'IPV6_MTU' undeclared (first use in this function)
make[3]: *** [bss_dgram.o] Error 1

I try to fix this but it leads to different problem so my question is
if there exist some patch to fix this.

Thanks,

Marek
