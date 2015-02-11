From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 11 Feb 2015 19:08:11 +0100
Subject: [Buildroot] [Bug 7772] libxml-parser-perl build failure:
 missing dependency ExtUtils/MakeMaker
In-Reply-To: <54DB328F.1070603@imgtec.com>
References: <bug-7772-163@https.bugs.busybox.net/>
 <20150210153136.C133880E35@busybox.osuosl.org>
 <CAB0FRsuumK_7m-4Sy5mO3cJ4e89GXHeaPfgti-Aoccdf_XqqcA@mail.gmail.com>
 <54DB328F.1070603@imgtec.com>
Message-ID: <CAB0FRssXCmnp8jzW6rN888Mdr32OMkk4mAq_-CYDJHyWM8AzyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-02-11 11:44 GMT+01:00 Vicente Olivert Riera <Vincent.Riera@imgtec.com>:
> Hello Francois,
>
> below are the outputs of the commands you suggested. You said
> ExtUtils-MakeMaker comes with the perl installation, but that's not true
> for CentOS (I guess RedHat and Fedora as well) and Gentoo.

Ok, I see.

ExtUtils-MakeMaker could be upgraded from CPAN, but not installed from
CPAN (bootstrapping problem).
So, it must be installed by the distribution tool like the system perl package.

The logic of the proposed patch looks good for me. The message could
be more specific.
     `yum install perl-ExtUtils-MakeMaker`

Fran?ois

>
> $ perl -V
> Summary of my perl5 (revision 5 version 16 subversion 3) configuration:
>
>   Platform:
>     osname=linux, osvers=2.6.32-220.17.1.el6.x86_64,
> archname=x86_64-linux-thread-multi
>     uname='linux worker1.bsys.centos.org 2.6.32-220.17.1.el6.x86_64 #1
> smp wed may 16 00:01:37 bst 2012 x86_64 x86_64 x86_64 gnulinux '
>     config_args='-des -Doptimize=-O2 -g -pipe -Wall
> -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong
> --param=ssp-buffer-size=4 -grecord-gcc-switches   -m64 -mtune=generic
> -Dccdlflags=-Wl,--enable-new-dtags -Dlddlflags=-shared -O2 -g -pipe
> -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong
> --param=ssp-buffer-size=4 -grecord-gcc-switches   -m64 -mtune=generic
> -Wl,-z,relro  -DDEBUGGING=-g -Dversion=5.16.3 -Dmyhostname=localhost
> -Dperladmin=root at localhost -Dcc=gcc -Dcf_by=Red Hat, Inc. -Dprefix=/usr
> -Dvendorprefix=/usr -Dsiteprefix=/usr/local
> -Dsitelib=/usr/local/share/perl5 -Dsitearch=/usr/local/lib64/perl5
> -Dprivlib=/usr/share/perl5 -Dvendorlib=/usr/share/perl5/vendor_perl
> -Darchlib=/usr/lib64/perl5 -Dvendorarch=/usr/lib64/perl5/vendor_perl
> -Darchname=x86_64-linux-thread-multi -Dlibpth=/usr/local/lib64 /lib64
> /usr/lib64 -Duseshrplib -Dusethreads -Duseithreads
> -Dusedtrace=/usr/bin/dtrace -Duselargefiles -Dd_semctl_semun -Di_db
> -Ui_ndbm -Di_gdbm -Di_shadow -Di_syslog -Dman3ext=3pm -Duseperlio
> -Dinstallusrbinperl=n -Ubincompat5005 -Uversiononly
> -Dpager=/usr/bin/less -isr -Dd_gethostent_r_proto -Ud_endhostent_r_proto
> -Ud_sethostent_r_proto -Ud_endprotoent_r_proto -Ud_setprotoent_r_proto
> -Ud_endservent_r_proto -Ud_setservent_r_proto -Dscriptdir=/usr/bin
> -Dusesitecustomize'
>     hint=recommended, useposix=true, d_sigaction=define
>     useithreads=define, usemultiplicity=define
>     useperlio=define, d_sfio=undef, uselargefiles=define, usesocks=undef
>     use64bitint=define, use64bitall=define, uselongdouble=undef
>     usemymalloc=n, bincompat5005=undef
>   Compiler:
>     cc='gcc', ccflags ='-D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing
> -pipe -fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE
> -D_FILE_OFFSET_BITS=64',
>     optimize='-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions
> -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches
> -m64 -mtune=generic',
>     cppflags='-D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe
> -fstack-protector -I/usr/local/include'
>     ccversion='', gccversion='4.8.2 20140120 (Red Hat 4.8.2-16)',
> gccosandvers=''
>     intsize=4, longsize=8, ptrsize=8, doublesize=8, byteorder=12345678
>     d_longlong=define, longlongsize=8, d_longdbl=define, longdblsize=16
>     ivtype='long', ivsize=8, nvtype='double', nvsize=8, Off_t='off_t',
> lseeksize=8
>     alignbytes=8, prototype=define
>   Linker and Libraries:
>     ld='gcc', ldflags =' -fstack-protector'
>     libpth=/usr/local/lib64 /lib64 /usr/lib64
>     libs=-lresolv -lnsl -lgdbm -ldb -ldl -lm -lcrypt -lutil -lpthread
> -lc -lgdbm_compat
>     perllibs=-lresolv -lnsl -ldl -lm -lcrypt -lutil -lpthread -lc
>     libc=, so=so, useshrplib=true, libperl=libperl.so
>     gnulibc_version='2.17'
>   Dynamic Linking:
>     dlsrc=dl_dlopen.xs, dlext=so, d_dlsymun=undef,
> ccdlflags='-Wl,--enable-new-dtags -Wl,-rpath,/usr/lib64/perl5/CORE'
>     cccdlflags='-fPIC', lddlflags='-shared -O2 -g -pipe -Wall
> -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong
> --param=ssp-buffer-size=4 -grecord-gcc-switches -m64 -mtune=generic
> -Wl,-z,relro '
>
>
> Characteristics of this binary (from libperl):
>   Compile-time options: HAS_TIMES MULTIPLICITY PERLIO_LAYERS
>                         PERL_DONT_CREATE_GVSV PERL_IMPLICIT_CONTEXT
>                         PERL_MALLOC_WRAP PERL_PRESERVE_IVUV USE_64_BIT_ALL
>                         USE_64_BIT_INT USE_ITHREADS USE_LARGE_FILES
>                         USE_LOCALE USE_LOCALE_COLLATE USE_LOCALE_CTYPE
>                         USE_LOCALE_NUMERIC USE_PERLIO USE_PERL_ATOF
>                         USE_REENTRANT_API USE_SITECUSTOMIZE
>   Locally applied patches:
>         Fedora Patch1: Removes date check, Fedora/RHEL specific
>         Fedora Patch3: support for libdir64
>         Fedora Patch4: use libresolv instead of libbind
>         Fedora Patch5: USE_MM_LD_RUN_PATH
>         Fedora Patch6: Skip hostname tests, due to builders not being network
> capable
>         Fedora Patch7: Dont run one io test due to random builder failures
>         Fedora Patch9: Fix find2perl to translate ? glob properly (RT#113054)
>         Fedora Patch10: Fix broken atof (RT#109318)
>         Fedora Patch13: Clear $@ before "do" I/O error (RT#113730)
>         Fedora Patch14: Do not truncate syscall() return value to 32 bits
> (RT#113980)
>         Fedora Patch15: Override the Pod::Simple::parse_file (CPANRT#77530)
>         Fedora Patch16: Do not leak with attribute on my variable (RT#114764)
>         Fedora Patch17: Allow operator after numeric keyword argument (RT#105924)
>         Fedora Patch18: Extend stack in File::Glob::glob, (RT#114984)
>         Fedora Patch19: Do not crash when vivifying $|
>         Fedora Patch20: Fix misparsing of maketext strings (CVE-2012-6329)
>         Fedora Patch21: Add NAME headings to CPAN modules (CPANRT#73396)
>         Fedora Patch22: Fix leaking tied hashes (RT#107000) [1]
>         Fedora Patch23: Fix leaking tied hashes (RT#107000) [2]
>         Fedora Patch24: Fix leaking tied hashes (RT#107000) [3]
>         Fedora Patch25: Fix dead lock in PerlIO after fork from thread (RT#106212)
>         Fedora Patch26: Make regexp safe in a signal handler (RT#114878)
>         Fedora Patch27: Update h2ph(1) documentation (RT#117647)
>         Fedora Patch28: Update pod2html(1) documentation (RT#117623)
>         Fedora Patch29: Document Math::BigInt::CalcEmu requires Math::BigInt
> (CPAN RT#85015)
>   Built under linux
>   Compiled at Jun 17 2014 17:36:59
>   @INC:
>     /usr/local/lib64/perl5
>     /usr/local/share/perl5
>     /usr/lib64/perl5/vendor_perl
>     /usr/share/perl5/vendor_perl
>     /usr/lib64/perl5
>     /usr/share/perl5
>     .
>
>
> $ perl -e "use ExtUtils::MakeMaker; print qq{ok\n};"
> Can't locate ExtUtils/MakeMaker.pm in @INC (@INC contains:
> /usr/local/lib64/perl5 /usr/local/share/perl5
> /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl
> /usr/lib64/perl5 /usr/share/perl5 .) at -e line 1.
> BEGIN failed--compilation aborted at -e line 1.
>
>
> $ make host-libxml-parser-perl-dirclean
> rm -Rf /buildroot/output/build/host-libxml-parser-perl-2.41
>
>
> $ make host-libxml-parser-perl-configure
> [...]
> Can't locate ExtUtils/MakeMaker.pm in @INC (@INC contains:
> /buildroot/output/host/usr/lib/perl /usr/local/lib64/perl5
> /usr/local/share/perl5 /usr/lib64/perl5/vendor_perl
> /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5 .) at
> Makefile.PL line 3.
> BEGIN failed--compilation aborted at Makefile.PL line 3.
>
>
> $ cat /etc/redhat-release
> CentOS Linux release 7.0.1406 (Core)
>
> Regards,
> --
> Vincent
>
> On 10/02/15 20:34, Fran?ois Perrad wrote:
>> 2015-02-10 16:31 GMT+01:00  <bugzilla@busybox.net>:
>>> https://bugs.busybox.net/show_bug.cgi?id=7772
>>>
>>> --- Comment #3 from Vicente Olivert Riera <vincent.riera@imgtec.com> 2015-02-10 15:31:36 UTC ---
>>> (In reply to comment #2)
>>>> Vicente, saiberion: would you mind sending the proposed patch to the mailing
>>>> list?
>>>
>>> Hello Thomas,
>>>
>>> shouldn't we have an agreement on what would be the solution to this?
>>>
>>> a) adding the perl-ExtUtils-MakeMaker package to Buildroot
>>> b) adding a dependency check as saiberion did
>>>
>>> I personally don't like the option b), because I like to be able to use
>>> Buildroot having the minimum packages installed. And, if we keep doing this, we
>>> could end with a loooong list of dependencies to use Buildroot. I think it's
>>> better to add the perl-ExtUtils-MakeMaker instead.
>>>
>>> Maybe Francois Perrad has something to say about this since he seems to be the
>>> perl maintaner in Buildroot.
>>>
>>
>> libxml-parser-perl works with the system perl (not a host-perl built by BR).
>> ExtUtils-MakeMaker is a core Perl module, especially the module which
>> allows to install other modules.
>> So, it comes with the system perl package of your distribution.
>> The Makefile.PL of XML-Parser 2.41 uses ExtUtils-MakeMaker without a
>> specific version requirement,
>> so the system ExtUtils-MakeMaker module doesn't require an update.
>>
>> Could you post the full output of following commands (outside BR environment):
>>     $ perl -V
>>     $ perl -e "use ExtUtils::MakeMaker; print qq{ok\n};"
>>
>> and in BR environment:
>>     $ make libxml-parser-perl-dirclean
>>     $ make libxml-parser-perl-configure
>>
>> Fran?ois
>>
>>> --
>>> Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
>>> ------- You are receiving this mail because: -------
>>> You are on the CC list for the bug.
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
