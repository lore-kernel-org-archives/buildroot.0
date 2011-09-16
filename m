From: Rico Bachmann <bachmann@tofwerk.com>
Date: Fri, 16 Sep 2011 17:33:47 +0200
Subject: [Buildroot] add fcgi-2.4.0 package to buildroot
Message-ID: <000301cc7486$0778f8f0$166aead0$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi at all

I'm trying to add the fcgi-2.4.0 package to buildroot. I'm new in doing
this.

For my advantage this package works already with automake/autoconfig.

 

I added the package with the help from this side:
http://buildroot.uclibc.org/buildroot.html#autotools-tutorial 


Here is my libfcgi.mk file:

 
############################################################################
##

                #

                # libfcgi

                #

                # makefile for automake/autoconf by Rico Bachmann

                #

 
############################################################################
##

                LIBFCGI_VERSION = 2.4.0

                LIBFCGI_SOURCE = fcgi-$(LIBFCGI_VERSION).tar.gz

                LIBFCGI_SITE = http://www.fastcgi.com/dist

                LIBFCGI_INSTALL_STAGING = YES

                LIBFCGI_INSTALL_TARGET= YES

                LIBFCGI_CONF_OPT = --enable-shared

 

$(eval $(call AUTOTARGETS,package,libfcgi))

 

and here is my Config.in file:



                config BR2_PACKAGE_LIBFCGI

                                bool "libfcgi"

                                help

                                               This is a fcgi developer
librarz to use in C.

                                               http://www.fastcgi.com/

 

My problem is if i try to build my rootfs with this packag, i got some
errors, and i don't see how to fix them.

 

Here is my output from the make (the last lines):

 

                Making all in cgi-fcgi

                make[3]: Entering directory
`/mnt/clfs/buildroot-2011.08/output/build/libfcgi-2.4.0/cgi-fcgi'

                source='cgi-fcgi.c' object='cgi-fcgi.o' libtool=no \

                                depfile='.deps/cgi-fcgi.Po'
tmpdepfile='.deps/cgi-fcgi.TPo' \

                                depmode=gcc3 /bin/sh ../depcomp \

 
/mnt/clfs/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibcgnue
abi-gcc -DHAVE_CONFIG_H -I. -I. -I..   -I../include  -pipe -Os  -Wall -c
`test -f cgi-fcgi.c || echo './'`cgi-fcgi.c

                /bin/sh ../libtool --mode=link
/mnt/clfs/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibcgnue
abi-gcc  -pipe -Os  -Wall   -o cgi-fcgi  cgi-fcgi.o ../libfcgi/libfcgi.la
-lnsl 

                mkdir .libs

 
/mnt/clfs/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibcgnue
abi-gcc -pipe -Os -Wall -o .libs/cgi-fcgi cgi-fcgi.o
../libfcgi/.libs/libfcgi.so -lnsl

                ../libfcgi/.libs/libfcgi.so: warning: gethostbyname is
obsolescent, use getnameinfo() instead.

                ../libfcgi/.libs/libfcgi.so: undefined reference to `frexp'

                collect2: ld returned 1 exit status

                make[3]: *** [cgi-fcgi] Fehler 1

                make[3]: Leaving directory
`/mnt/clfs/buildroot-2011.08/output/build/libfcgi-2.4.0/cgi-fcgi'

                make[2]: *** [all-recursive] Fehler 1

                make[2]: Leaving directory
`/mnt/clfs/buildroot-2011.08/output/build/libfcgi-2.4.0'

                make[1]: *** [all] Fehler 2

                make[1]: Leaving directory
`/mnt/clfs/buildroot-2011.08/output/build/libfcgi-2.4.0'

                make: ***
[/mnt/clfs/buildroot-2011.08/output/build/libfcgi-2.4.0/.stamp_built] Fehler
2

 

if it would help i can upload the hole output from make.

 

I see that i need the 'frexp' but how do i link this? If I'm not wrong,
thats a function of math.h
And are there some other errors i don't see myself? I'm happy about every
hint.

 

greez bluefire

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110916/8713a057/attachment-0001.html>
