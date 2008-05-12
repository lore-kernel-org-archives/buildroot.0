From: Arun Reddy <reddyac@gmail.com>
Date: Mon, 12 May 2008 07:08:21 -0700
Subject: [Buildroot] problem with builded buildroot
In-Reply-To: <000901c8b290$252c3cb0$f2999258@ch3mik>
References: <000901c8b290$252c3cb0$f2999258@ch3mik>
Message-ID: <326f33790805120708r373dab7fga1e52312fced46f5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jaroslav,

Just to be clear, you said that you want to compile uClibc-0.9.29 in your
buildroot that you just chroot-ed into. This may be trivial, but did you try
compiling buildroot from the beginning with 0.9.29 runtime library instead
of compiling with the older version first and then trying to compile the new
uClibc version within your root fs afterwards?

I am a new user to Buildroot and have found that I have been stuck many
times because I have been using specific snapshots of buildroot rather than
keeping up with the latest stable version using svn. Considering you have
been compiling so many times I doubt neither of these are the real issues
for you but I thought I would throw them out there anyway. Hopefully someone
will come in to give a complete answer.

On Sat, May 10, 2008 at 4:22 AM, Jir?sek Jaroslav <jirasek@sauron.cz> wrote:

> Hi,
>
> I have problem with compiled buildroot. I use latest snapshot, in "make
> menuconfig" I checked
> "Generic development system", "Enable WCHAR support" and "development
> files
> in target filesystem".
>
> I succesfully compiled buildroot, then I mount this, copy tree in another
> location on harddisk,
> chroot to this. Now I want to compile uClibc-0.9.29 in my new buildroot.
> After "make menuconfig"
> i got errors:
>
> [root at development uClibc-0.9.29]# make menuconfig
> gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c kxgettext.c -o kxgettext.o
> gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c lxdialog/checklist.c -o
> lxdialog/checklist.o
> gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c lxdialog/inputbox.c -o
> lxdialog/inputbox.o
> gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c lxdialog/menubox.c -o
> lxdialog/menubox.o
> gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c lxdialog/textbox.c -o
> lxdialog/textbox.o
> gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c lxdialog/util.c -o
> lxdialog/util.o
> lxdialog/util.c: In function 'print_autowrap':
>
> another "make menuconfig" (on newly copied source on uClibc)
>
> [root at development uClibc-0.9.29]# make menuconfig
> install -d include/bits
> gcc  -DLOCALE  -MM *.c > .depend 2>/dev/null || :
> gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c conf.c -o conf.o
> gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c kxgettext.c -o kxgettext.o
> gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c lxdialog/checklist.c -o
> lxdialog/checklist.o
> make[1]: *** [lxdialog/checklist.o] Segmentation fault
> make: *** [extra/config/mconf] Error 2
>
>
> Errors discovers randomly ... Sometimes sooner, sometimes later. "make
> clean" ends with "Segmentation fault".
> Similar errors produce "make menuconfig" on kernel source. But "make
> config,
> make dep, make" works.
> My computer is running CentOS 5 with latest updates. I tested this on
> another computer with x64 CentOS 5 with
> the same errors. I tested many changes in compiling buildroot (gcc-4.1.2,
> daily snapshot of uClibc, another version
> of binutils....) with no success.
>
> I have old buildroot (I compiled this before 2 years, it is based on
> uClibc-0.9.27, and this works without problems
> - I can "make menuconfg" uClibc-0.9.29
>
>
> I compiled buildroot perhaps 50 times, now I am despairing, please help me
>
>
> Thank you, Jaroslav Jirasek
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080512/f7c03d99/attachment-0001.htm 
