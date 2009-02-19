From: QuickX <quickx@hotmail.com>
Date: Thu, 19 Feb 2009 13:01:13 -0800
Subject: [Buildroot] BR-2009.01 U-Boot not working on my AT91SAM9261ek
	Board
In-Reply-To: <871vtubrym.fsf@macbook.be.48ers.dk>
References: <BAY124-DS7756E1F27FE5A88524B2BD2B20@phx.gbl>
	<871vtubrym.fsf@macbook.be.48ers.dk>
Message-ID: <BAY124-DS3880CEEDD3A85799470A2D2B20@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Details please (miniperl)
It's very similar to the problem with the rc4'ish post I made 
(http://lists.busybox.net/pipermail/buildroot/2009-February/025793.html). 
Not 100% exactly the same, here is a snip of the last few lines.

---------------------------------------------
---------------------------------------------
[[SNIP]]
Run make depend now? [y]
make[1]: Entering directory `/home/dustin/BR-microperl/build_arm/perl-5.8.8'
sh ./makedepend MAKE=make
make[2]: Entering directory `/home/dustin/BR-microperl/build_arm/perl-5.8.8'
sh writemain lib/auto/DynaLoader/DynaLoader.a  > perlmain.c
rm -f opmini.c
cp op.c opmini.c
echo  av.c scope.c op.c doop.c doio.c dump.c hv.c mg.c reentr.c perl.c 
perly.c pp.c pp_hot.c pp_ctl.c pp_sys.c regcomp.c regexec.c utf8.c gv.c sv.c 
taint.c toke.c util.c deb.c run.c universal.c xsutils.c pad.c globals.c 
perlio.c perlapi.c numeric.c locale.c pp_pack.c pp_sort.c miniperlmain.c 
perlmain.c opmini.c | tr ' ' '\n' >.clist
make[2]: Leaving directory `/home/dustin/BR-microperl/build_arm/perl-5.8.8'
./makedepend: 1: Syntax error: Unterminated quoted string
make[1]: *** [depend] Error 2
make[1]: Leaving directory `/home/dustin/BR-microperl/build_arm/perl-5.8.8'

If you compile perl5 on a different machine or from a different object
directory, copy the Policy.sh file from this object directory to the
new one before you run Configure -- this will help you with most of
the policy defaults.

touch /home/dustin/BR-microperl/build_arm/perl-5.8.8/.host_configured
/home/dustin/BR-microperl/toolchain_build_arm/bin/sed -i -e 
's/^.*<command-line>.*//g' 
/home/dustin/BR-microperl/build_arm/perl-5.8.8/makefile
/home/dustin/BR-microperl/toolchain_build_arm/bin/sed -i -e 
's/^.*<command-line>.*//g' 
/home/dustin/BR-microperl/build_arm/perl-5.8.8/x2p/makefile
/home/dustin/BR-microperl/toolchain_build_arm/bin/sed: can't read 
/home/dustin/BR-microperl/build_arm/perl-5.8.8/x2p/makefile: No such file or 
directory
make: *** 
[/home/dustin/BR-microperl/build_arm/perl-5.8.8/.host_configured_and_fixed] 
Error 2
---------------------------------------------
---------------------------------------------


> Details please (php)
It complains that "*/dl/php-5.2.8.tar.bz2" doesn't exist (it doesn't), but I 
can't see anywhere where it attempted to download...  It would probably work 
if I manually got php-5.2.8.tar.bz2 file and put it in my download 
*guessing*.  I don't use either php or miniperl on my board, I was just 
testing the default settings.
---------------------------------------------
---------------------------------------------
[[SNIP]]
cp -f /home/dustin/BR-php/build_arm/mtd_orig/docfdisk 
/home/dustin/BR-php/project_build_arm/at91sam9261ek/root/usr/sbin/docfdisk
/home/dustin/BR-php/build_arm/staging_dir/usr/bin/arm-linux-uclibc-strip --remove-section=.comment 
 --remove-section=.note 
/home/dustin/BR-php/project_build_arm/at91sam9261ek/root/usr/sbin/docfdisk
cp -f /home/dustin/BR-php/build_arm/mtd_orig/doc_loadbios 
/home/dustin/BR-php/project_build_arm/at91sam9261ek/root/usr/sbin/doc_loadbios
/home/dustin/BR-php/build_arm/staging_dir/usr/bin/arm-linux-uclibc-strip --remove-section=.comment 
 --remove-section=.note 
/home/dustin/BR-php/project_build_arm/at91sam9261ek/root/usr/sbin/doc_loadbios
bzcat /home/dustin/BR-php/dl/php-5.2.8.tar.bz2 | tar -C 
/home/dustin/BR-php/build_arm   -xf -
bzcat: Can't open input file /home/dustin/BR-php/dl/php-5.2.8.tar.bz2: No 
such file or directory.
tar: This does not look like a tar archive
tar: Error exit delayed from previous errors
make: *** [/home/dustin/BR-php/build_arm/php-5.2.8/.unpacked] Error 2
---------------------------------------------
---------------------------------------------



> Sigh, Ulf - This is your mess, please sort it out.
I'm not sure what the AT91 u-boot patch adds but I haven't run into any 
problems with u-boot on my at91sam9261ek board, when the patch disabled. 
