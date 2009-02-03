From: QuickX <quickx@hotmail.com>
Date: Tue, 3 Feb 2009 13:15:44 -0800
Subject: [Buildroot] BR-2009.02-rc3 Make Error (./makedepend: 1: Syntax
	error: Unterminated quoted string)
Message-ID: <BAY124-DS4F2AA8AFF4C9516A055FDD2C20@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to build the at91sam9261ek_defconfig build on a Kubuntu 8.10 
machine.  I issue the following commands and get the following error:

Note: I notice it seems to be at a perl type section.  I do have perl 
v5.10.0 on the host machine, is there a package I'm missing?

$ tar xf buildroot-2009.02-rc3.tar.gz
$ cd buildroot-2009.02-rc3
$ make menuconfig ((SAVE EXIT))
$ make at91sam9261ek_defconfig
$ make
[[SNIP]]
What extensions do you wish to load dynamically?
[B ByteLoader Cwd Data/Dumper Devel/DProf Devel/PPPort Devel/Peek Digest/MD5 
Encode Fcntl File/Glob Filter/Util/Call I18N/Langinfo IO IPC/SysV List/Util 
MIME/Base64 Opcode POSIX PerlIO/encoding PerlIO/scalar PerlIO/via SDBM_File 
Socket Storable Sys/Hostname Sys/Syslog Time/HiRes Unicode/Normalize 
XS/APItest XS/Typemap attrs re threads threads/shared]
What extensions do you wish to load statically? [none]


End of configuration questions.


Stripping down executable paths...

Creating config.sh...

Doing variable substitutions on .SH files...
Extracting cflags (with variable substitutions)
Extracting config.h (with variable substitutions)
Extracting makeaperl (with variable substitutions)
Extracting makedepend (with variable substitutions)
Extracting makedir (with variable substitutions)
Extracting Makefile (with variable substitutions)
Extracting myconfig (with variable substitutions)
Extracting pod/Makefile (with variable substitutions)
Extracting Policy.sh (with variable substitutions)
Extracting writemain (with variable substitutions)
Extracting x2p/cflags (with variable substitutions)
Extracting x2p/Makefile (with variable substitutions)

Now you need to generate make dependencies by running "make depend".
You might prefer to run it in background: "make depend > makedepend.out &"
It can take a while, so you might not want to run it right now.

Run make depend now? [y]
make[1]: Entering directory 
`/home/dustin//buildroot-2009.02-rc3/build_arm/perl-5.8.8'
sh ./makedepend MAKE=make
make[2]: Entering directory 
`/home/dustin//buildroot-2009.02-rc3/build_arm/perl-5.8.8'
sh writemain lib/auto/DynaLoader/DynaLoader.a  > perlmain.c
rm -f opmini.c
cp op.c opmini.c
echo  av.c scope.c op.c doop.c doio.c dump.c hv.c mg.c reentr.c perl.c 
perly.c pp.c pp_hot.c pp_ctl.c pp_sys.c regcomp.c regexec.c utf8.c gv.c sv.c 
taint.c toke.c util.c deb.c run.c universal.c xsutils.c pad.c globals.c 
perlio.c perlapi.c numeric.c locale.c pp_pack.c pp_sort.c miniperlmain.c 
perlmain.c opmini.c | tr ' ' '\n' >.clist
make[2]: Leaving directory 
`/home/dustin//buildroot-2009.02-rc3/build_arm/perl-5.8.8'
./makedepend: 1: Syntax error: Unterminated quoted string
make[1]: *** [depend] Error 2
make[1]: Leaving directory 
`/home/dustin//buildroot-2009.02-rc3/build_arm/perl-5.8.8'

If you compile perl5 on a different machine or from a different object
directory, copy the Policy.sh file from this object directory to the
new one before you run Configure -- this will help you with most of
the policy defaults.

touch 
/home/dustin//buildroot-2009.02-rc3/build_arm/perl-5.8.8/.host_configured
/home/dustin//buildroot-2009.02-rc3/toolchain_build_arm/bin/sed -i -e 
's/^.*<command-line>.*//g' 
/home/dustin//buildroot-2009.02-rc3/build_arm/perl-5.8.8/makefile
/home/dustin//buildroot-2009.02-rc3/toolchain_build_arm/bin/sed -i -e 
's/^.*<command-line>.*//g' 
/home/dustin//buildroot-2009.02-rc3/build_arm/perl-5.8.8/x2p/makefile
/home/dustin//buildroot-2009.02-rc3/toolchain_build_arm/bin/sed: can't read 
/home/dustin//buildroot-2009.02-rc3/build_arm/perl-5.8.8/x2p/makefile: No 
such file or directory
make: *** 
[/home/dustin//buildroot-2009.02-rc3/build_arm/perl-5.8.8/.host_configured_and_fixed] 
Error 2
dustin at com186:~//buildroot-2009.02-rc3$
