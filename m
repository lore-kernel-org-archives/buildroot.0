From: Charles Krinke <charles.krinke@gmail.com>
Date: Mon, 9 Jul 2012 09:41:03 -0700
Subject: [Buildroot] A libtool question
Message-ID: <CALo-6+g5zr8MVVVjG9fEFo5sgsVOk2uxwxzkPbb=e=U0zNwcZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Genglemen:

The project I have been working on for a year and a half with a
PPC8321 is done, released and in formal testing. I appreciate all the
help from the buildroot group in getting this project done. Now, the
reward for finishing this project is a new project with a TI AM3517
and a color graphics display. So, I am starting with buildroot-2012.05
and have a couple of questions.

In trying my first compile of a root filesystem, I get bolloxed up a
bit in libtool and libqt. It looks like I may  need to run a special
.configure step and I wonder if my problem may be cockpit error and
would appreciate some guidance in figuring this out.


make[5]: Entering directory
`/home/ckrinke/buildroot-2012.05/output/build/host-pkg-config-0.25/glib-1.2.10'
/bin/sh ./libtool --tag=CC   --mode=compile /usr/bin/gcc
-DHAVE_CONFIG_H -I. -DG_LOG_DOMAIN=g_log_domain_glib     -O2
-I/home/ckrinke/buildroot-2012.05/output/host/include
-I/home/ckrinke/buildroot-2012.05/output/host/usr/include -Wall
-D_REENTRANT -MT garray.lo -MD -MP -MF .deps/garray.Tpo -c -o
garray.lo garray.c
/bin/sh ./libtool --tag=CC   --mode=compile /usr/bin/gcc
-DHAVE_CONFIG_H -I. -DG_LOG_DOMAIN=g_log_domain_glib     -O2
-I/home/ckrinke/buildroot-2012.05/output/host/include
-I/home/ckrinke/buildroot-2012.05/output/host/usr/include -Wall
-D_REENTRANT -MT gcache.lo -MD -MP -MF .deps/gcache.Tpo -c -o
gcache.lo gcache.c
libtool: Version mismatch error.  This is libtool 2.2.10, but the
libtool: definition of this LT_INIT comes from libtool 2.2.6b.
libtool: You should recreate aclocal.m4 with macros from libtool 2.2.10
libtool: and run autoconf again.
make[5]: *** [garray.lo] Error 63
make[5]: *** Waiting for unfinished jobs....
libtool: Version mismatch error.  This is libtool 2.2.10, but the
libtool: definition of this LT_INIT comes from libtool 2.2.6b.
libtool: You should recreate aclocal.m4 with macros from libtool 2.2.10
libtool: and run autoconf again.
make[5]: *** [gcache.lo] Error 63
make[5]: Leaving directory
`/home/ckrinke/buildroot-2012.05/output/build/host-pkg-config-0.25/glib-1.2.10'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory
`/home/ckrinke/buildroot-2012.05/output/build/host-pkg-config-0.25/glib-1.2.10'
make[3]: *** [all] Error 2
make[3]: Leaving directory
`/home/ckrinke/buildroot-2012.05/output/build/host-pkg-config-0.25/glib-1.2.10'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/ckrinke/buildroot-2012.05/output/build/host-pkg-config-0.25'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/ckrinke/buildroot-2012.05/output/build/host-pkg-config-0.25'
make: *** [/home/ckrinke/buildroot-2012.05/output/build/host-pkg-config-0.25/.stamp_built]
Error 2
ckrinke at dellx:~/buildroot-2012.05$

-- 
Charles Krinke
