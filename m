From: =?iso-8859-2?Q?Jir=E1sek_Jaroslav?= <jirasek@sauron.cz>
Date: Sat, 10 May 2008 13:22:34 +0200
Subject: [Buildroot] problem with builded buildroot
Message-ID: <000901c8b290$252c3cb0$f2999258@ch3mik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have problem with compiled buildroot. I use latest snapshot, in "make 
menuconfig" I checked
"Generic development system", "Enable WCHAR support" and "development files 
in target filesystem".

I succesfully compiled buildroot, then I mount this, copy tree in another 
location on harddisk,
chroot to this. Now I want to compile uClibc-0.9.29 in my new buildroot. 
After "make menuconfig"
i got errors:

[root at development uClibc-0.9.29]# make menuconfig
gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c kxgettext.c -o kxgettext.o
gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c lxdialog/checklist.c -o 
lxdialog/checklist.o
gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c lxdialog/inputbox.c -o 
lxdialog/inputbox.o
gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c lxdialog/menubox.c -o 
lxdialog/menubox.o
gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c lxdialog/textbox.c -o 
lxdialog/textbox.o
gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c lxdialog/util.c -o 
lxdialog/util.o
lxdialog/util.c: In function 'print_autowrap':

another "make menuconfig" (on newly copied source on uClibc)

[root at development uClibc-0.9.29]# make menuconfig
install -d include/bits
gcc  -DLOCALE  -MM *.c > .depend 2>/dev/null || :
gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c conf.c -o conf.o
gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c kxgettext.c -o kxgettext.o
gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c lxdialog/checklist.c -o 
lxdialog/checklist.o
make[1]: *** [lxdialog/checklist.o] Segmentation fault
make: *** [extra/config/mconf] Error 2


Errors discovers randomly ... Sometimes sooner, sometimes later. "make 
clean" ends with "Segmentation fault".
Similar errors produce "make menuconfig" on kernel source. But "make config, 
make dep, make" works.
My computer is running CentOS 5 with latest updates. I tested this on 
another computer with x64 CentOS 5 with
the same errors. I tested many changes in compiling buildroot (gcc-4.1.2, 
daily snapshot of uClibc, another version
of binutils....) with no success.

I have old buildroot (I compiled this before 2 years, it is based on 
uClibc-0.9.27, and this works without problems
- I can "make menuconfg" uClibc-0.9.29


I compiled buildroot perhaps 50 times, now I am despairing, please help me


Thank you, Jaroslav Jirasek
