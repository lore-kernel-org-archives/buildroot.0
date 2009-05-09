From: daniele_dll <d.albano@gmail.com>
Date: Sun, 10 May 2009 01:18:15 +0200
Subject: [Buildroot] Problem compiling microperl package for a virtex ii pro
	xc2vp30 (using a ppc405 no fpu)
Message-ID: <159a01660905091618t2b347c53mc361a9091b981c9b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi to all,

i'm trying to set up a development platform on a virtex ii board
(ppc405 no fpu based board) but i getting some problems. I'm tryng to
compile all the stuff but when it should compiler microperl package
give an error!

I've seen on archives that there was a problem related to this on
2009.02-rc3 build of buildroot but there wasn't any solution.

Here there is some output:
------------------------
[SNIP]
Now you need to generate make dependencies by running "make depend".
You might prefer to run it in background: "make depend > makedepend.out &"
It can take a while, so you might not want to run it right now.

Run make depend now? [y]
make[1]: ingresso nella directory
?/home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8?
sh ./makedepend MAKE=make
make[2]: Entering directory
`/home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8'
sh writemain lib/auto/DynaLoader/DynaLoader.a  > perlmain.c
rm -f opmini.c
cp op.c opmini.c
echo  av.c scope.c op.c doop.c doio.c dump.c hv.c mg.c reentr.c perl.c
perly.c pp.c pp_hot.c pp_ctl.c pp_sys.c regcomp.c regexec.c utf8.c
gv.c sv.c taint.c toke.c util.c deb.c run.c universal.c xsutils.c
pad.c globals.c perlio.c perlapi.c numeric.c locale.c pp_pack.c
pp_sort.c miniperlmain.c perlmain.c opmini.c | tr ' ' '\n' >.clist
make[2]: Leaving directory
`/home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8'
./makedepend: 1: Syntax error: Unterminated quoted string
make[1]: *** [depend] Errore 2
make[1]: uscita dalla directory
?/home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8?

If you compile perl5 on a different machine or from a different object
directory, copy the Policy.sh file from this object directory to the
new one before you run Configure -- this will help you with most of
the policy defaults.

touch /home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8/.host_configured
/home/daniele/Development/Projects/xupv2p/Buildroot/toolchain_build_powerpc/bin/sed
-i -e 's/^.*<command-line>.*//g'
/home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8/makefile
/home/daniele/Development/Projects/xupv2p/Buildroot/toolchain_build_powerpc/bin/sed
-i -e 's/^.*<command-line>.*//g'
/home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8/x2p/makefile
/home/daniele/Development/Projects/xupv2p/Buildroot/toolchain_build_powerpc/bin/sed:
impossibile leggere
/home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8/x2p/makefile:
Nessun file o directory
make: *** [/home/daniele/Development/Projects/xupv2p/Buildroot/build_powerpc/perl-5.8.8/.host_configured_and_fixed]
Errore 2
------------------------

makefile in x2p directory is missing!

I need to add the development tools to the root filesystem, someone
has a solution or a suggestion?

Attached there is my .config file!

Thank you for this great work!!!
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 19424 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090510/a03a89ce/attachment-0001.obj>
