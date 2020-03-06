From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 6 Mar 2020 14:12:30 +0100
Subject: [Buildroot] liboping compilation error
In-Reply-To: <20200306132357.51daa26a@gmx.net>
References: <VE1PR03MB5197A376BAD29ECDC5C828F3A0E20@VE1PR03MB5197.eurprd03.prod.outlook.com>
 <20200306132357.51daa26a@gmx.net>
Message-ID: <20200306141230.01f7ea37@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Maik,

On Fri, 6 Mar 2020 13:23:57 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Maik,
> 
> On Thu, 5 Mar 2020 18:57:23 +0000, "Brenke, Maik" <Maik.Brenke@continental-corporation.com> wrote:
> 
> > Hello,
> > 
> > 
> > I noticed that the "ping" command (depending on "liboping") could not be build using "*-gcc" on my system (see [0]). I discovered the bug in [1] and fixed it with the commit from [2]. The result can be found under [3]. But afterwards I got the error in [4] (wrong automake version). Sould we maybe change to sources providing "autogen.sh"?
> > 
> > 
> > [0]:  
> > >>> liboping 1.10.0 Building    
> > PATH="/home/brenkem/git/STACC-100BaseT1-1CH/output/host/bin:/home/brenkem/git/STACC-100BaseT1-1CH/output/host/sbin:/home/brenkem/bin:/home/brenkem/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/opt/puppetlabs/bin:/usr/local/arm/fs-toolchain-8.3-armv7ahf/bin"  /usr/bin/make -j5  -C /home/brenkem/git/STACC-100BaseT1-1CH/output/build/liboping-1.10.0/
> > make[1]: Verzeichnis ?/home/brenkem/git/STACC-100BaseT1-1CH/output/build/liboping-1.10.0? wird betreten
> > Making all in src
> > make[2]: Verzeichnis ?/home/brenkem/git/STACC-100BaseT1-1CH/output/build/liboping-1.10.0/src? wird betreten
> > /usr/bin/make  all-recursive
> > make[3]: Verzeichnis ?/home/brenkem/git/STACC-100BaseT1-1CH/output/build/liboping-1.10.0/src? wird betreten
> > Making all in mans
> > make[4]: Verzeichnis ?/home/brenkem/git/STACC-100BaseT1-1CH/output/build/liboping-1.10.0/src/mans? wird betreten
> > make[4]: F?r das Ziel ?all? ist nichts zu tun.
> > make[4]: Verzeichnis ?/home/brenkem/git/STACC-100BaseT1-1CH/output/build/liboping-1.10.0/src/mans? wird verlassen
> > make[4]: Verzeichnis ?/home/brenkem/git/STACC-100BaseT1-1CH/output/build/liboping-1.10.0/src? wird betreten
> > /bin/sh ../libtool  --tag=CC   --mode=compile /home/brenkem/git/STACC-100BaseT1-1CH/output/host/bin/arm-linux-gcc -DHAVE_CONFIG_H -I.   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -Werror -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3   -c -o liboping_la-liboping.lo `test -f 'liboping.c' || echo './'`liboping.c
> > libtool: compile:  /home/brenkem/git/STACC-100BaseT1-1CH/output/host/bin/arm-linux-gcc -DHAVE_CONFIG_H -I. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -Werror -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O3 -c liboping.c  -fPIC -DPIC -o .libs/liboping_la-liboping.o
> > liboping.c: In function 'ping_set_ttl':
> > liboping.c:207:9: error: '%s' directive output may be truncated writing up to 255 bytes into a region of size 242 [-Werror=format-truncation=]
> >     "%s: %s", function, message);
> >          ^~
> > liboping.c:829:6:
> >       sstrerror (ret, errbuf, sizeof (errbuf)));
> >       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > liboping.c:206:2: note: 'snprintf' output between 15 and 270 bytes into a destination of size 256
> >   snprintf (obj->errmsg, sizeof (obj->errmsg),
> >   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >     "%s: %s", function, message);
> >     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > liboping.c:207:9: error: '%s' directive output may be truncated writing up to 255 bytes into a region of size 242 [-Werror=format-truncation=]
> >     "%s: %s", function, message);
> >          ^~
> > liboping.c:842:6:
> >       sstrerror (ret, errbuf, sizeof (errbuf)));
> >       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > liboping.c:206:2: note: 'snprintf' output between 15 and 270 bytes into a destination of size 256
> >   snprintf (obj->errmsg, sizeof (obj->errmsg),
> >   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >     "%s: %s", function, message);
> >     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > liboping.c: In function 'ping_set_qos':
> > liboping.c:207:9: error: '%s' directive output may be truncated writing up to 255 bytes into a region of size 242 [-Werror=format-truncation=]
> >     "%s: %s", function, message);
> >          ^~
> > liboping.c:869:6:
> >       sstrerror (ret, errbuf, sizeof (errbuf)));
> >       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > liboping.c:206:2: note: 'snprintf' output between 15 and 270 bytes into a destination of size 256
> >   snprintf (obj->errmsg, sizeof (obj->errmsg),
> >   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >     "%s: %s", function, message);
> >     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > liboping.c:207:9: error: '%s' directive output may be truncated writing up to 255 bytes into a region of size 242 [-Werror=format-truncation=]
> >     "%s: %s", function, message);
> >          ^~
> > liboping.c:885:6:
> >       sstrerror (ret, errbuf, sizeof (errbuf)));
> >       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > liboping.c:206:2: note: 'snprintf' output between 15 and 270 bytes into a destination of size 256
> >   snprintf (obj->errmsg, sizeof (obj->errmsg),
> >   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >     "%s: %s", function, message);
> >     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > cc1: all warnings being treated as errors
> > Makefile:582: die Regel f?r Ziel ?liboping_la-liboping.lo? scheiterte
> > make[4]: *** [liboping_la-liboping.lo] Fehler 1
> > make[4]: Verzeichnis ?/home/brenkem/git/STACC-100BaseT1-1CH/output/build/liboping-1.10.0/src? wird verlassen
> > Makefile:645: die Regel f?r Ziel ?all-recursive? scheiterte
> > make[3]: *** [all-recursive] Fehler 1
> > make[3]: Verzeichnis ?/home/brenkem/git/STACC-100BaseT1-1CH/output/build/liboping-1.10.0/src? wird verlassen
> > Makefile:419: die Regel f?r Ziel ?all? scheiterte
> > make[2]: *** [all] Fehler 2
> > make[2]: Verzeichnis ?/home/brenkem/git/STACC-100BaseT1-1CH/output/build/liboping-1.10.0/src? wird verlassen
> > Makefile:382: die Regel f?r Ziel ?all-recursive? scheiterte
> > make[1]: *** [all-recursive] Fehler 1
> > make[1]: Verzeichnis ?/home/brenkem/git/STACC-100BaseT1-1CH/output/build/liboping-1.10.0? wird verlassen
> > package/pkg-generic.mk:238: die Regel f?r Ziel ?/home/brenkem/git/STACC-100BaseT1-1CH/output/build/liboping-1.10.0/.stamp_built? scheiterte
> > make: *** [/home/brenkem/git/STACC-100BaseT1-1CH/output/build/liboping-1.10.0/.stamp_built] Fehler 2
> > 
> > 
> > [1]:
> > https://bugs.gentoo.org/675344
> > 
> > 
> > [2]:
> > https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=c23d497c3fbdadf86cdc785f5806a36116101e5e
> > 
> > 
> > [3]:
> > From f784858a0bd5f7e5dd2ad681a2a8463fa4b3fc8f Mon Sep 17 00:00:00 2001
> > From: Maik Brenke <Maik.Brenke@continental-corporation.com>
> > Date: Thu, 5 Mar 2020 18:11:19 +0100
> > Subject: [PATCH] fix-truncated-writing-error-by-removing-werror-option
> > 
> > ---
> >  src/Makefile.am | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/src/Makefile.am b/src/Makefile.am
> > index b8571aa..acd652c 100644
> > --- a/src/Makefile.am
> > +++ b/src/Makefile.am
> > @@ -2,10 +2,6 @@ AUTOMAKE_OPTIONS = foreign no-dependencies
> > 
> >  SUBDIRS = mans
> > 
> > -if COMPILER_IS_GCC
> > -AM_CFLAGS = -Wall -Werror
> > -endif
> > -
> >  include_HEADERS = oping.h
> >  lib_LTLIBRARIES = liboping.la
> > 
> > --
> > 2.7.4
> > 
> > 
> > [4]:  
> > >>> liboping 1.10.0 Building    
> > PATH="/home/brenkem/git/STACC-100BaseT1-1CH/output/host/bin:/home/brenkem/git/STACC-100BaseT1-1CH/output/host/sbin:/home/brenkem/bin:/home/brenkem/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/opt/puppetlabs/bin:/usr/local/arm/fs-toolchain-8.3-armv7ahf/bin"  /usr/bin/make -j5  -C /home/brenkem/git/STACC-100BaseT1-1CH/output/build/liboping-1.10.0/
> > make[1]: Verzeichnis ?/home/brenkem/git/STACC-100BaseT1-1CH/output/build/liboping-1.10.0? wird betreten
> > Making all in src
> > make[2]: Verzeichnis ?/home/brenkem/git/STACC-100BaseT1-1CH/output/build/liboping-1.10.0/src? wird betreten
> >  cd .. && /bin/sh /home/brenkem/git/STACC-100BaseT1-1CH/output/build/liboping-1.10.0/missing automake-1.14 --foreign src/Makefile
> > /home/brenkem/git/STACC-100BaseT1-1CH/output/build/liboping-1.10.0/missing: Zeile 81: automake-1.14: Befehl nicht gefunden
> > WARNING: 'automake-1.14' is missing on your system.
> >          You should only need it if you modified 'Makefile.am' or
> >          'configure.ac' or m4 files included by 'configure.ac'.
> >          The 'automake' program is part of the GNU Automake package:
> >          <http://www.gnu.org/software/automake>
> >          It also requires GNU Autoconf, GNU m4 and Perl in order to run:
> >          <http://www.gnu.org/software/autoconf>
> >          <http://www.gnu.org/software/m4/>
> >          <http://www.perl.org/>
> > Makefile:424: die Regel f?r Ziel ?Makefile.in? scheiterte
> > make[2]: *** [Makefile.in] Fehler 127
> > make[2]: Verzeichnis ?/home/brenkem/git/STACC-100BaseT1-1CH/output/build/liboping-1.10.0/src? wird verlassen
> > Makefile:382: die Regel f?r Ziel ?all-recursive? scheiterte
> > make[1]: *** [all-recursive] Fehler 1
> > make[1]: Verzeichnis ?/home/brenkem/git/STACC-100BaseT1-1CH/output/build/liboping-1.10.0? wird verlassen
> > package/pkg-generic.mk:238: die Regel f?r Ziel ?/home/brenkem/git/STACC-100BaseT1-1CH/output/build/liboping-1.10.0/.stamp_built? scheiterte
> > make: *** [/home/brenkem/git/STACC-100BaseT1-1CH/output/build/liboping-1.10.0/.stamp_built] Fehler 2
> > 
> >   
> 
> Maybe
> 
> LIBOPING_AUTORECONF=YES
> 
> missing from package/liboping/liboping.mk (needed in case configure.ac or
> Makefile.am is patched, see [1])...

And maybe 'Mitigated snprintf truncation warning (-wError) #50' [2] is the better
fix than disabling -Werror?

Regards,
Peter

[2] https://github.com/octo/liboping/pull/50/commits/664414123a3fe89984abfa0917946c513bf47163

> 
> Regards,
> Peter
> 
> [1] http://nightly.buildroot.org/manual.html#_infrastructure_for_autotools_based_packages
> 
> > 
> > 
> > Mit freundlichen Gr??en / Best regards
> > 
> > Maik Brenke
> > Embedded Linux Developer
> > BU ADAS
> > 
> > Continental
> > Division Chassis & Safety
> > Ringlerstrasse 17, 85057 Ingolstadt
> > Germany
> > 
> > Phone: +49-841-881-12401  
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
