From: QuickX <quickx@hotmail.com>
Date: Wed, 4 Feb 2009 12:00:48 -0800
Subject: [Buildroot] BR-2009.02-rc3 Make Error (./makedepend: 1: Syntax
	error: Unterminated quoted string)
In-Reply-To: <87d4dyck50.fsf@macbook.be.48ers.dk>
References: <BAY124-DS4F2AA8AFF4C9516A055FDD2C20@phx.gbl>
	<87d4dyck50.fsf@macbook.be.48ers.dk>
Message-ID: <BAY124-DS5AFF5B0225EE12DF753D3D2C30@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changing the "x2p/makefile" to "x2p/Makefile" in the following file still 
resulted in a make error for me
--package/microperl/microperl.mk--
$(MICROPERL_DIR)/.host_configured_and_fixed: 
$(MICROPERL_DIR)/.host_configured
        $(SED) 's/^.*<command-line>.*//g' $(MICROPERL_DIR)/makefile
        $(SED) 's/^.*<command-line>.*//g' $(MICROPERL_DIR)/x2p/Makefile
        touch $@
--microperl.mk end--



$ tar xf buildroot-2009.02-rc3.tar.gz
$ cd buildroot-2009.02-rc3
$ make menuconfig ((SAVE EXIT))
$ make at91sam9261ek_defconfig
$ nano package/microperl/microperl.mk  ((EDIT SAVE EXIT))
$ make
[[SNIP]]
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
`/home/dustin/buildroot-2009.02-rc3/build_arm/perl-5.8.8'
sh ./makedepend MAKE=make
make[2]: Entering directory 
`/home/dustin/buildroot-2009.02-rc3/build_arm/perl-5.8.8'
sh writemain lib/auto/DynaLoader/DynaLoader.a  > perlmain.c
rm -f opmini.c
cp op.c opmini.c
echo  av.c scope.c op.c doop.c doio.c dump.c hv.c mg.c reentr.c perl.c 
perly.c pp.c pp_hot.c pp_ctl.c pp_sys.c regcomp.c regexec.c utf8.c gv.c sv.c 
taint.c toke.c util.c deb.c run.c universal.c xsutils.c pad.c globals.c 
perlio.c perlapi.c numeric.c locale.c pp_pack.c pp_sort.c miniperlmain.c 
perlmain.c opmini.c | tr ' ' '\n' >.clist
make[2]: Leaving directory 
`/home/dustin/buildroot-2009.02-rc3/build_arm/perl-5.8.8'
./makedepend: 1: Syntax error: Unterminated quoted string
make[1]: *** [depend] Error 2
make[1]: Leaving directory 
`/home/dustin/buildroot-2009.02-rc3/build_arm/perl-5.8.8'

If you compile perl5 on a different machine or from a different object
directory, copy the Policy.sh file from this object directory to the
new one before you run Configure -- this will help you with most of
the policy defaults.

touch 
/home/dustin/buildroot-2009.02-rc3/build_arm/perl-5.8.8/.host_configured
/home/dustin/buildroot-2009.02-rc3/toolchain_build_arm/bin/sed -i -e 
's/^.*<command-line>.*//g' 
/home/dustin/buildroot-2009.02-rc3/build_arm/perl-5.8.8/makefile
/home/dustin/buildroot-2009.02-rc3/toolchain_build_arm/bin/sed -i -e 
's/^.*<command-line>.*//g' 
/home/dustin/buildroot-2009.02-rc3/build_arm/perl-5.8.8/x2p/Makefile
touch 
/home/dustin/buildroot-2009.02-rc3/build_arm/perl-5.8.8/.host_configured_and_fixed
/usr/bin/make -j2 -C /home/dustin/buildroot-2009.02-rc3/build_arm/perl-5.8.8 
|| echo "An error is expected on make"
make[1]: Entering directory 
`/home/dustin/buildroot-2009.02-rc3/build_arm/perl-5.8.8'
`sh  cflags "optimize='-O2'" miniperlmain.o`  miniperlmain.c
`sh  cflags "optimize='-O2'" perl.o`  perl.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" gv.o`  gv.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" toke.o`  toke.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" perly.o`  perly.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" op.o`  op.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" pad.o`  pad.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" regcomp.o`  regcomp.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" dump.o`  dump.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" util.o`  util.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
util.c: In function ?Perl_safesysmalloc?:
util.c:87: warning: ignoring return value of ?write?, declared with 
attribute warn_unused_result
util.c: In function ?Perl_safesysrealloc?:
util.c:136: warning: ignoring return value of ?write?, declared with 
attribute warn_unused_result
util.c: In function ?Perl_safesyscalloc?:
util.c:189: warning: ignoring return value of ?write?, declared with 
attribute warn_unused_result
util.c: In function ?Perl_savesharedpv?:
util.c:820: warning: ignoring return value of ?write?, declared with 
attribute warn_unused_result
`sh  cflags "optimize='-O2'" mg.o`  mg.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" reentr.o`  reentr.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" hv.o`  hv.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" av.o`  av.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" run.o`  run.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" pp_hot.o`  pp_hot.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" sv.o`  sv.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
sv.c: In function ?Perl_sv_2pv_flags?:
sv.c:3005: warning: ignoring return value of ?gcvt?, declared with attribute 
warn_unused_result
sv.c:3222: warning: ignoring return value of ?gcvt?, declared with attribute 
warn_unused_result
sv.c: In function ?Perl_sv_clear?:
sv.c:5222: warning: ignoring return value of ?Perl_io_close?, declared with 
attribute warn_unused_result
sv.c: In function ?Perl_sv_vcatpvfn?:
sv.c:8552: warning: ignoring return value of ?gcvt?, declared with attribute 
warn_unused_result
sv.c:9315: warning: ignoring return value of ?gcvt?, declared with attribute 
warn_unused_result
`sh  cflags "optimize='-O2'" pp.o`  pp.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" scope.o`  scope.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" pp_ctl.o`  pp_ctl.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" pp_sys.o`  pp_sys.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
proto.h:1732: warning: ?S_emulate_eaccess? declared ?static? but never 
defined
`sh  cflags "optimize='-O2'" doop.o`  doop.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" doio.o`  doio.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
doio.c: In function ?Perl_nextargv?:
doio.c:914: warning: ignoring return value of ?fchown?, declared with 
attribute warn_unused_result
doio.c: In function ?Perl_do_aexec5?:
doio.c:1496: warning: ignoring return value of ?write?, declared with 
attribute warn_unused_result
doio.c: In function ?Perl_do_exec3?:
doio.c:1641: warning: ignoring return value of ?write?, declared with 
attribute warn_unused_result
`sh  cflags "optimize='-O2'" regexec.o`  regexec.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" utf8.o`  utf8.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" taint.o`  taint.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" deb.o`  deb.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" universal.o`  universal.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" xsutils.o`  xsutils.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" globals.o`  globals.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" perlio.o`  perlio.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" perlapi.o`  perlapi.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
perlio.c: In function ?PerlIO_debug?:
perlio.c:489: warning: ignoring return value of ?write?, declared with 
attribute warn_unused_result
`sh  cflags "optimize='-O2'" numeric.o`  numeric.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" locale.o`  locale.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" pp_pack.o`  pp_pack.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" pp_sort.o`  pp_sort.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" opmini.o`  -DPERL_EXTERNAL_GLOB opmini.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
`sh  cflags "optimize='-O2'" perlmain.o`  perlmain.c
          CCCMD = 
 /usr/bin/gcc -DPERL_CORE -c -fno-strict-aliasing -pipe -Wdeclaration-after-statement 
 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
rm -f libperl.a
/usr/bin/ar rcu libperl.a perl.o  gv.o toke.o perly.o op.o pad.o regcomp.o 
dump.o util.o mg.o reentr.o hv.o av.o run.o pp_hot.o sv.o pp.o scope.o 
pp_ctl.o pp_sys.o doop.o doio.o regexec.o utf8.o taint.o deb.o universal.o 
xsutils.o globals.o perlio.o perlapi.o numeric.o locale.o pp_pack.o 
pp_sort.o
/usr/bin/gcc -L/usr/local/lib -o miniperl \
            miniperlmain.o opmini.o 
libperl.a -lnsl -ldl -lm -lcrypt -lutil -lc
./miniperl -w -Ilib -MExporter -e '<?>' || /usr/bin/make minitest
./miniperl -Ilib configpm --heavy=lib/Config_heavy.pl lib/Config.pm
make[1]: [extra.pods] Error 1 (ignored)
./miniperl -Ilib lib/lib_pm.PL
Extracting lib.pm (with variable substitutions)
./miniperl minimod.pl > lib/ExtUtils/Miniperl.pm
cd lib/unicore &&  ../../miniperl -I../../lib mktables -w
cd x2p;  /usr/bin/make s2p
make[2]: Entering directory 
`/home/dustin/buildroot-2009.02-rc3/build_arm/perl-5.8.8/x2p'
../miniperl -I../lib s2p.PL
Extracting s2p (with variable substitutions)
Linking s2p to psed.
make[2]: Leaving directory 
`/home/dustin/buildroot-2009.02-rc3/build_arm/perl-5.8.8/x2p'

        Making x2p stuff
make[2]: Entering directory 
`/home/dustin/buildroot-2009.02-rc3/build_arm/perl-5.8.8/x2p'
You haven't done a "make depend" yet!
make[2]: *** [hash.o] Error 1
make[2]: Leaving directory 
`/home/dustin/buildroot-2009.02-rc3/build_arm/perl-5.8.8/x2p'
make[1]: *** [translators] Error 2
make[1]: *** Waiting for unfinished jobs....
touch uni.data
make[1]: Leaving directory 
`/home/dustin/buildroot-2009.02-rc3/build_arm/perl-5.8.8'
An error is expected on make
touch /home/dustin/buildroot-2009.02-rc3/build_arm/perl-5.8.8/.host_make
/home/dustin/buildroot-2009.02-rc3/toolchain_build_arm/bin/sed -i -e 
's#^.*<asm/page.h>.*##g' 
/home/dustin/buildroot-2009.02-rc3/build_arm/perl-5.8.8/ext/IPC/SysV/SysV.c
/home/dustin/buildroot-2009.02-rc3/toolchain_build_arm/bin/sed: can't read 
/home/dustin/buildroot-2009.02-rc3/build_arm/perl-5.8.8/ext/IPC/SysV/SysV.c: 
No such file or directory
make: *** 
[/home/dustin/buildroot-2009.02-rc3/build_arm/perl-5.8.8/.host_make_fixed] 
Error 2
dustin at com186:~/buildroot-2009.02-rc3$
 
