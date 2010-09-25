From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 25 Sep 2010 15:49:17 +0200
Subject: [Buildroot] "make menuconfig" possibly broken in git master
In-Reply-To: <AANLkTimzWbLUWA+28XdSa+28oPDHdpJnVODso_VTRv9m@mail.gmail.com>
References: <AANLkTimzWbLUWA+28XdSa+28oPDHdpJnVODso_VTRv9m@mail.gmail.com>
Message-ID: <1285422557.27944.15.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I had this too. You have to clean your repository well.

Regards,

--
Lionel Landwerlin

Le samedi 25 septembre 2010 ? 13:21 +0200, Bj?rn Forsman a ?crit :
> Hi all,
> 
> My buildroot git master tree fails to "make menuconfig" because of
> "zconf.tab.c:181: error: conflicting types for ?symbol_hash?":
> 
> $ make distclean && make menuconfig
> rm -rf     \
> 		 /home/bjornfor/raid/forks/buildroot/output/build
> rm -rf output
> rm -rf /media/raid/bjornfor/forks/buildroot/.config
> /media/raid/bjornfor/forks/buildroot/.config.old
> /media/raid/bjornfor/forks/buildroot/.config.cmd
> /media/raid/bjornfor/forks/buildroot/.auto.deps
> mkdir -p /home/bjornfor/raid/forks/buildroot/output/build/buildroot-config/lxdialog
> make CC="/usr/bin/gcc"
> obj=/home/bjornfor/raid/forks/buildroot/output/build/buildroot-config
> -C package/config -f Makefile.br mconf
> make[1]: Entering directory
> `/media/raid/bjornfor/forks/buildroot/package/config'
> /usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE
> -I/home/bjornfor/raid/forks/buildroot/output/build/buildroot-config -g
> -O2 -MM *.c > /home/bjornfor/raid/forks/buildroot/output/build/buildroot-config/.depend
> 2>/dev/null || :
> make[1]: Leaving directory `/media/raid/bjornfor/forks/buildroot/package/config'
> make[1]: Entering directory
> `/media/raid/bjornfor/forks/buildroot/package/config'
> /usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE
> -I/home/bjornfor/raid/forks/buildroot/output/build/buildroot-config -g
> -O2  -c conf.c -o
> /home/bjornfor/raid/forks/buildroot/output/build/buildroot-config/conf.o
> /usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE
> -I/home/bjornfor/raid/forks/buildroot/output/build/buildroot-config -g
> -O2  -c kxgettext.c -o
> /home/bjornfor/raid/forks/buildroot/output/build/buildroot-config/kxgettext.o
> /usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE
> -I/home/bjornfor/raid/forks/buildroot/output/build/buildroot-config -g
> -O2  -c lxdialog/checklist.c -o
> /home/bjornfor/raid/forks/buildroot/output/build/buildroot-config/lxdialog/checklist.o
> /usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE
> -I/home/bjornfor/raid/forks/buildroot/output/build/buildroot-config -g
> -O2  -c lxdialog/inputbox.c -o
> /home/bjornfor/raid/forks/buildroot/output/build/buildroot-config/lxdialog/inputbox.o
> /usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE
> -I/home/bjornfor/raid/forks/buildroot/output/build/buildroot-config -g
> -O2  -c lxdialog/menubox.c -o
> /home/bjornfor/raid/forks/buildroot/output/build/buildroot-config/lxdialog/menubox.o
> /usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE
> -I/home/bjornfor/raid/forks/buildroot/output/build/buildroot-config -g
> -O2  -c lxdialog/textbox.c -o
> /home/bjornfor/raid/forks/buildroot/output/build/buildroot-config/lxdialog/textbox.o
> /usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE
> -I/home/bjornfor/raid/forks/buildroot/output/build/buildroot-config -g
> -O2  -c lxdialog/util.c -o
> /home/bjornfor/raid/forks/buildroot/output/build/buildroot-config/lxdialog/util.o
> /usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE
> -I/home/bjornfor/raid/forks/buildroot/output/build/buildroot-config -g
> -O2  -c lxdialog/yesno.c -o
> /home/bjornfor/raid/forks/buildroot/output/build/buildroot-config/lxdialog/yesno.o
> /usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE
> -I/home/bjornfor/raid/forks/buildroot/output/build/buildroot-config -g
> -O2  -c mconf.c -o
> /home/bjornfor/raid/forks/buildroot/output/build/buildroot-config/mconf.o
> /usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE
> -I/home/bjornfor/raid/forks/buildroot/output/build/buildroot-config -g
> -O2 -I. -c zconf.tab.c -o
> /home/bjornfor/raid/forks/buildroot/output/build/buildroot-config/zconf.tab.o
> zconf.tab.c:181: error: conflicting types for ?symbol_hash?
> lkc_proto.h:27: note: previous declaration of ?symbol_hash? was here
> make[1]: *** [/home/bjornfor/raid/forks/buildroot/output/build/buildroot-config/zconf.tab.o]
> Error 1
> make[1]: Leaving directory `/media/raid/bjornfor/forks/buildroot/package/config'
> make: *** [/home/bjornfor/raid/forks/buildroot/output/build/buildroot-config/mconf]
> Error 2
> 
> Is anyone else seeing this?
> 
> I "git bisected'ed" until I found the bad commit:
> 
> commit 52a142a6314905422f14f05fccafdce35bea7f08
> Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Date:   Sat Aug 21 17:00:49 2010 +0200
> 
>     Bump package/config to 2.6.36-rc1
> 
>     The goal is to be able to use savedefconfig to generate minimal
>     defconfig files.
> 
>     Four of our patches are removed since the modifications have been
>     merged upstream. The new nconf configuration utility has appeared.
> 
> I briefly looked at the commit diff but I didn't understand what
> caused the breakage.
> Any suggestions?
> 
> Best regards,
> Bj?rn Forsman
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
