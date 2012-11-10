From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 10 Nov 2012 21:21:13 +0100
Subject: [Buildroot] Various problem using buildroot-2012.05
References: <1340005565.16617.YahooMailClassic@web161402.mail.bf1.yahoo.com>
 <20120618103657.721db39b@skate> <qaol7k.eta.ln@bernd-kuhls.de>
 <509E69FD.2000804@petroprogram.com>
Message-ID: <pvcm7k.fkn.ln@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Stefan Fr?berg <stefan.froberg@petroprogram.com>
wrote in news:509E69FD.2000804 at petroprogram.com: 

> If you try to use buildroot-made target gcc to compile perl, that is,
> you use buildroot to cross-compile gcc to run natively inside
> uClibc (?) environment, then you might encounter problems.

yes, I am trying exactly that with uClibc. I copied the buildroot-created 
toolchain along with some needed cross-compiled libs (z, openssl, db, ...) 
to my target and could successfully compile perl:


fli4l 3.9.0-rev24280 # perl -V
Summary of my perl5 (revision 5 version 16 subversion 2) configuration:

  Platform:
    osname=linux, osvers=3.6.6-nonfree, archname=i686-linux
    uname='linux fli4l 3.6.6-nonfree #1 smp tue nov 6 16:59:31 cet 2012 
i686 gnulinux '
    config_args='-des -Dprefix=/usr -Duseshrplib -Dusedl -
Ddlsrc=dl_dlopen.xs -Duselargefiles -Accflags=-fno-stack-protector -
Dperllibs=-ldl -lm -Dlibs=-ldl -lm -Dpager=/usr/bin/less -d'
    hint=recommended, useposix=true, d_sigaction=define
    useithreads=undef, usemultiplicity=undef
    useperlio=define, d_sfio=undef, uselargefiles=define, usesocks=undef
    use64bitint=undef, use64bitall=undef, uselongdouble=undef
    usemymalloc=n, bincompat5005=undef
  Compiler:
    cc='cc', ccflags ='-fno-stack-protector -fno-strict-aliasing -pipe -
D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64',
    optimize='-O2',
    cppflags='-fno-stack-protector -fno-strict-aliasing -pipe'
    ccversion='', gccversion='4.6.3', gccosandvers=''
    intsize=4, longsize=4, ptrsize=4, doublesize=8, byteorder=1234
    d_longlong=define, longlongsize=8, d_longdbl=define, longdblsize=12
    ivtype='long', ivsize=4, nvtype='double', nvsize=8, Off_t='off_t', 
lseeksize=8
    alignbytes=4, prototype=define
  Linker and Libraries:
    ld='cc', ldflags =''
    libpth=/lib /usr/lib
    libs=-ldl -lm
    perllibs=-ldl -lm
    libc=/lib/libc.so.0, so=so, useshrplib=true, libperl=libperl.so
    gnulibc_version=''
  Dynamic Linking:
    dlsrc=dl_dlopen.xs, dlext=so, d_dlsymun=undef, ccdlflags='-Wl,-E -Wl,-
rpath,/usr/lib/perl5/5.16.2/i686-linux/CORE'
    cccdlflags='-fPIC', lddlflags='-shared -O2'


Characteristics of this binary (from libperl):
  Compile-time options: HAS_TIMES PERLIO_LAYERS PERL_DONT_CREATE_GVSV
                        PERL_MALLOC_WRAP PERL_PRESERVE_IVUV USE_LARGE_FILES
                        USE_LOCALE USE_LOCALE_COLLATE USE_LOCALE_CTYPE
                        USE_LOCALE_NUMERIC USE_PERLIO USE_PERL_ATOF
  Built under linux
  Compiled at Nov 10 2012 15:51:03
  @INC:
    /usr/lib/perl5/site_perl/5.16.2/i686-linux
    /usr/lib/perl5/site_perl/5.16.2
    /usr/lib/perl5/5.16.2/i686-linux
    /usr/lib/perl5/5.16.2


Keep up the fine work with buildroot!

Kind regards, Bernd
