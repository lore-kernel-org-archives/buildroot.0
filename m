From: James J. Dines <jdines@jdines.net>
Date: Mon, 30 Aug 2010 16:21:55 -0400
Subject: [Buildroot] Make 3.82 does behave differently than make
 3.81	for sure, but ...
In-Reply-To: <8739tvyip6.fsf@macbook.be.48ers.dk>
References: <4C7B99D5.9010703@jdines.net>
	<87bp8kxlve.fsf@macbook.be.48ers.dk>	<4C7BC441.3010006@jdines.net>	<201008301701.22856.yann.morin.1998@anciens.enib.fr>	<4C7BD1D6.5070100@jdines.net>	<20100830163153.GA12776@merkur.ravnborg.org>
	<8739tvyip6.fsf@macbook.be.48ers.dk>
Message-ID: <4C7C12E3.30005@jdines.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/30/2010 04:00 PM, Peter Korsgaard wrote:
>>>>>> "Sam" == Sam Ravnborg <sam@ravnborg.org> writes:
> 
> Hi,
> 
>  Sam> make 3.81 accept the following:
> 
>  Sam> foo foo%: bar
>  Sam> 	command
> 
>  Sam> With make 3.82 you need to split this up as:
> 
>  Sam> foo: bar
>  Sam> 	command
> 
>  Sam> foo%: bar
>  Sam> 	command
> 
> Yeah, saw the kernel changes passing by. I haven't had time to test
> building with make 3.82 yet though (it's not in Debian yet), so we might
> have something similar lingering around somewhere ..
> 

I am really interested to hear your results, because I just bought this
new 8 core machine and set it up this weekend.  So far everything has
worked great, but there is always this nagging worry that I have
something set up wrong and I will have to post back to the list stating
that I was an idiot and missed something :-)

In any case, untarring buildroot-2010.05, doing a make defconfig
followed by a make clean seems like a set of steps that should go off
without a hitch (it certainly does on my other machine) but it fails
with make 3.82 for me anyway :-(



jdines at hydra buildroot-2010.05 ] ls
CHANGES    configs/  docs/  Makefile  scripts/  TODO
Config.in  COPYING   fs/    package/  target/   toolchain/
[jdines at hydra buildroot-2010.05 ] make defconfig
make CC="/usr/bin/gcc" -C package/config conf
make[1]: Entering directory
`/home/jdines/Build/buildroot-2010.05/package/config'
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE
 -g -O2 -MM *.c > .depend 2>/dev/null || :
make[1]: Leaving directory
`/home/jdines/Build/buildroot-2010.05/package/config'
make[1]: Entering directory
`/home/jdines/Build/buildroot-2010.05/package/config'
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE
 -g -O2  -c conf.c -o conf.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE
 -g -O2  -c kxgettext.c -o kxgettext.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE
 -g -O2 -I. -c zconf.tab.c -o zconf.tab.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE
 -g -O2  conf.o  zconf.tab.o -lncurses -o conf
make[1]: Leaving directory
`/home/jdines/Build/buildroot-2010.05/package/config'
#
# configuration written to .config
#
#
# make dependencies written to .auto.deps
# ATTENTION buildroot devels!
# See top of this file before playing with this auto-preprequisites!
#
[jdines at hydra buildroot-2010.05 ] make clean
package/atk/atk.mk:43: *** recipe commences before first target.  Stop.
[jdines at hydra buildroot-2010.05 ] view Makefile
[jdines at hydra buildroot-2010.05 ] ls
CHANGES    configs/  docs/  Makefile  package/  target/  toolchain/
Config.in  COPYING   fs/    output/   scripts/  TODO
[jdines at hydra buildroot-2010.05 ] make clean
package/atk/atk.mk:43: *** recipe commences before first target.  Stop.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMfBLYAAoJECSpOhdQESq66n4IAJ86+yxdo+MbQjsWAvnVuLwr
Dbd6DRg0SjOO/ScxxOm5cdRa501lDOFqwWh1Pz09NKGMbGz7flw7BagE6+/dLfCe
S+75uhXkbI4hTvvpspd7XIaqXUr6FQmlmWQvIerDyaTjRxwNHCjeoRaWXo2/AnpY
rfHcUSOYUfw+1akIPu9Z0/5wwMRB7DlVpecChQ88ePhiMWmQ6PFrKDiXZkCJJfDq
R0gxrWasjbVf0F3429d3NUneseJLjXxUqnhcZt1aNOri+oFR0OBlElPaHuCjTTPJ
Kml2qSrSkylGGEVieP93YCY3P4EalpnHwGWWBPQLBSjAlWs4/ZYVM6dzlSOpTew=
=KCGa
-----END PGP SIGNATURE-----
