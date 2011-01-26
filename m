From: Spider <spiderwebmail@gmail.com>
Date: Wed, 26 Jan 2011 00:09:13 -0200
Subject: [Buildroot] Problem compiling busybox with libpam
In-Reply-To: <AANLkTi=SoMmj4_=FMZnJ3cYTyJcTj2ymizEOM9PGSO3r@mail.gmail.com>
References: <AANLkTi=SoMmj4_=FMZnJ3cYTyJcTj2ymizEOM9PGSO3r@mail.gmail.com>
Message-ID: <AANLkTin4zfThtsb=2TobEPZWupSJAPmw1Xde2=OMiPER@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I was using buildroot to compile busybox and got the following error
when I add libpam using "make busybox-menuconfig". ?(The output is
below).
How can I get libpam to compile without this errors? If I "make clean"
and remake everything from scratch will it work? (I wil try this
tomorrow because of the time to compile and fear of configuration files changes)

I searched for a similar problem but didnt find anything on
documentation. Do I need to manually supply security/pam_appl.h and
security/pam_misc.h? Where to find them?

-----------------------------

(make busybox-menuconfig ... )

make
>>> busybox 1.17.1 Building
PATH="/home/nrx/buildroot/buildroot-2010.08/output/host/bin:/home/nrx/buildroot/buildroot-2010.08/output/host/usr/bin:/home/nrx/buildroot/buildroot-2010.08/output/host/usr/sbin/:/usr/local/bin:/usr/bin:/bin:/usr/games"
PERLLIB="/home/nrx/buildroot/buildroot-2010.08/output/host/usr/lib/perl"
CFLAGS="-pipe -Os ?-mtune=603e -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/nrx/buildroot/buildroot-2010.08/output/staging/usr/include
-I/home/nrx/buildroot/buildroot-2010.08/output/staging/include
-I/home/nrx/buildroot/buildroot-2010.08/output/toolchain/linux/include"
/usr/bin/make -j6
CC="/home/nrx/buildroot/buildroot-2010.08/output/staging/usr/bin/powerpc-unknown-linux-uclibc-gcc
--sysroot=/home/nrx/buildroot/buildroot-2010.08/output/staging"
ARCH=powerpc PREFIX="/home/nrx/buildroot/buildroot-2010.08/output/target"
EXTRA_LDFLAGS="-L/home/nrx/buildroot/buildroot-2010.08/output/staging/lib
-L/home/nrx/buildroot/buildroot-2010.08/output/staging/usr/lib"
CROSS_COMPILE="/home/nrx/buildroot/buildroot-2010.08/output/staging/usr/bin/powerpc-unknown-linux-uclibc-"
-C /home/nrx/buildroot/buildroot-2010.08/output/build/busybox-1.17.1
make[1]: Entering directory
`/home/nrx/buildroot/buildroot-2010.08/output/build/busybox-1.17.1'
?SPLIT ? include/autoconf.h -> include/config/*
?HOSTCC ?applets/usage
?HOSTCC ?applets/applet_tables
?GEN ? ? include/bbconfigopts.h
?GEN ? ? include/applet_tables.h
?HOSTCC ?applets/usage_pod
?GEN ? ? include/usage_compressed.h
?CC ? ? ?applets/applets.o
?LD ? ? ?applets/built-in.o
?DOC ? ? busybox.pod
?DOC ? ? BusyBox.txt
?DOC ? ? BusyBox.1
?DOC ? ? BusyBox.html
?CC ? ? ?loginutils/login.o
?CC ? ? ?libbb/appletlib.o
loginutils/login.c:23:32: error: security/pam_appl.h: No such file or directory
loginutils/login.c:24:32: error: security/pam_misc.h: No such file or directory
loginutils/login.c:25: error: variable 'conv' has initializer but
incomplete type
loginutils/login.c:26: error: 'misc_conv' undeclared here (not in a function)
loginutils/login.c:26: warning: excess elements in struct initializer
loginutils/login.c:26: warning: (near initialization for 'conv')
loginutils/login.c:28: warning: excess elements in struct initializer
loginutils/login.c:28: warning: (near initialization for 'conv')
loginutils/login.c: In function 'login_main':
loginutils/login.c:215: error: 'pam_handle_t' undeclared (first use in
this function)
loginutils/login.c:215: error: (Each undeclared identifier is reported only once
loginutils/login.c:215: error: for each function it appears in.)
loginutils/login.c:215: error: 'pamh' undeclared (first use in this function)
loginutils/login.c:216: warning: ISO C90 forbids mixed declarations and code
loginutils/login.c:273: warning: implicit declaration of function 'pam_start'
loginutils/login.c:274: error: 'PAM_SUCCESS' undeclared (first use in
this function)
loginutils/login.c:279: warning: implicit declaration of function 'pam_set_item'
loginutils/login.c:279: error: 'PAM_TTY' undeclared (first use in this function)
loginutils/login.c:284: warning: implicit declaration of function
'pam_authenticate'
loginutils/login.c:294: warning: implicit declaration of function
'pam_acct_mgmt'
loginutils/login.c:303: warning: implicit declaration of function 'pam_get_item'
loginutils/login.c:303: error: 'PAM_USER' undeclared (first use in
this function)
loginutils/login.c:317: warning: implicit declaration of function
'pam_open_session'
loginutils/login.c:322: warning: implicit declaration of function 'pam_setcred'
loginutils/login.c:322: error: 'PAM_ESTABLISH_CRED' undeclared (first
use in this function)
loginutils/login.c:333: warning: implicit declaration of function 'pam_strerror'
loginutils/login.c:333: warning: format '%s' expects type 'char *',
but argument 4 has type 'int'
make[2]: *** [loginutils/login.o] Error 1
make[1]: *** [loginutils] Error 2
make[1]: *** Waiting for unfinished jobs....
?AR ? ? ?libbb/lib.a
make[1]: Leaving directory
`/home/nrx/buildroot/buildroot-2010.08/output/build/busybox-1.17.1'
make: *** [/home/nrx/buildroot/buildroot-2010.08/output/build/busybox-1.17.1/.stamp_built]
Error 2


-- 
Marcelo Rodrigues Pinheiro
Tel: (61) 9117-5729
