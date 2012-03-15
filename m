From: Charles Krinke <charles.krinke@gmail.com>
Date: Thu, 15 Mar 2012 10:31:24 -0700
Subject: [Buildroot] compiling microperl
Message-ID: <CALo-6+gEPp06RGrwt-0dYPJY+-q7-CX3vF8R-duaYVe4XBup+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to add microperl to an MPC8321 project and having a
compilation error. I have been using buildroot-2011.03 for the last
year and am nearing the end of this project and today we need to add
perl.

We are using the CodeSourcery external glibc toolchain and it has been
working fine for a long time. This is the first package we are unable
to build.

Here are the errors I am seeing:
make[1]: Entering directory
`/home/ckrinke/asvn/trunk/buildroot-glibc/output/build/perl-5.8.8'
/usr/bin/gcc -L/usr/local/lib -o miniperl \
	    miniperlmain.o opmini.o libperl.a
libperl.a(pp.o): In function `Perl_pp_pow':
pp.c:(.text+0x283a): undefined reference to `pow'
libperl.a(pp.o): In function `Perl_pp_modulo':
pp.c:(.text+0x361f): undefined reference to `fmod'
libperl.a(pp.o): In function `Perl_pp_atan2':
pp.c:(.text+0x7e49): undefined reference to `atan2'
libperl.a(pp.o): In function `Perl_pp_sin':
pp.c:(.text+0x7f2a): undefined reference to `sin'
libperl.a(pp.o): In function `Perl_pp_cos':
pp.c:(.text+0x806a): undefined reference to `cos'
libperl.a(pp.o): In function `Perl_pp_exp':
pp.c:(.text+0x834a): undefined reference to `exp'
libperl.a(pp.o): In function `Perl_pp_log':
pp.c:(.text+0x8490): undefined reference to `log'
libperl.a(pp.o): In function `Perl_pp_sqrt':
pp.c:(.text+0x8768): undefined reference to `sqrt'

I wonder if someone would be so kind as to offer a clue, or at least a
bread crumb to figuring this out.

-- 
Charles "Noob for the Day" Krinke
