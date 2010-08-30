From: James J. Dines <jdines@jdines.net>
Date: Mon, 30 Aug 2010 07:45:25 -0400
Subject: [Buildroot] package/atk/atk.mk:43: *** recipe commences before
 first target. Stop.
Message-ID: <4C7B99D5.9010703@jdines.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I am getting the error in the subject line.  I have tried this both from
a test branch in the git repository and by unpacking the 2010.05 tarball
with the same results.  Perhaps I am doing something stupid, but I
cannot imagine what it might be.  I searched the list for ANY "recipe
commences before first target" instances but it seems I am the first to
encounter it, or at least the first to report it here.

Does anyone know what might be causing this?


[jdines at hydra buildroot-2010.05 ] make menuconfig
make CC="/usr/bin/gcc" -C package/config mconf
make[1]: Entering directory
`/home/jdines/Build/buildroot-2010.05/package/config'
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE
 -g -O2 -MM *.c > .depend 2>/dev/null || :
make[1]: Leaving directory
`/home/jdines/Build/buildroot-2010.05/package/config'
make[1]: Entering directory
`/home/jdines/Build/buildroot-2010.05/package/config'
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE
 -g -O2  -c lxdialog/checklist.c -o lxdialog/checklist.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE
 -g -O2  -c lxdialog/inputbox.c -o lxdialog/inputbox.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE
 -g -O2  -c lxdialog/menubox.c -o lxdialog/menubox.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE
 -g -O2  -c lxdialog/textbox.c -o lxdialog/textbox.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE
 -g -O2  -c lxdialog/util.c -o lxdialog/util.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE
 -g -O2  -c lxdialog/yesno.c -o lxdialog/yesno.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE
 -g -O2  -c mconf.c -o mconf.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE
 -g -O2  mconf.o zconf.tab.o lxdialog/checklist.o lxdialog/util.o
lxdialog/inputbox.o lxdialog/textbox.o lxdialog/yesno.o
lxdialog/menubox.o -lncurses -o mconf
make[1]: Leaving directory
`/home/jdines/Build/buildroot-2010.05/package/config'
#
# configuration written to .config
#


*** End of Buildroot configuration.
*** Execute 'make' to build Buildroot or try 'make help'.

#
# make dependencies written to .auto.deps
# ATTENTION buildroot devels!
# See top of this file before playing with this auto-preprequisites!
#
[jdines at hydra buildroot-2010.05 ] cp .config
configs-make-menuconfig-no-changes
[jdines at hydra buildroot-2010.05 ] rm .config
rm: remove regular file `.config'? y
[jdines at hydra buildroot-2010.05 ] make defconfig
#
# configuration written to .config
#
#
# make dependencies written to .auto.deps
# ATTENTION buildroot devels!
# See top of this file before playing with this auto-preprequisites!
#
[jdines at hydra buildroot-2010.05 ] diff .config
configs-make-menuconfig-no-changes
3c3
< # Mon Aug 30 07:39:30 2010
- ---
> # Mon Aug 30 07:38:50 2010
[jdines at hydra buildroot-2010.05 ] make
package/atk/atk.mk:43: *** recipe commences before first target.  Stop.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMe5nJAAoJECSpOhdQESq6gdgIAIcKzSD/71L9mKosYOGyFJTb
VIf3UyADZnsUQC5JxrFel4EQEZdOzOUckbBJ/E3rvOgNbbhtIJH30hTZnWgbe5/4
bD4rlG1oUJAtqu65dPyrG5eGPANhA7U9Yca6//tU4xdy2Ecova35Fblw54AkWA+P
WhDyObVEjU/MagXP9KVlUlUKhcLJaDNFODdeBRe5UY2BiUtURBRJjz31+1BcBPPv
4lUrfYz6DrOoLc1iwh9ni2aICBDGd16exDAnvdqRbMeHoHKhCenzQagWlV7fGzdi
D1oyEYiQHraNxmJymXdTSQaBFynMVImWYAtDVQkd6r2bOwKdP/jRKYKT9spL568=
=3F3s
-----END PGP SIGNATURE-----
