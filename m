From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 20 Jan 2009 23:39:22 +0100
Subject: [Buildroot] svn revision 24928 make menuconfig error
In-Reply-To: <49764A16.7050402@walsimou.com>
References: <49764A16.7050402@walsimou.com>
Message-ID: <1232491162.4539.32.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2009-01-20 klockan 23:03 +0100 skrev Gaye Abdoulaye Walsimou:
> Hello list,
> svn revision 24928 "make menuconfig" generates the following error:
> 
> 
OK, Fixed in 24930
BR
Ulf Samuelsson

> 
> walsimou at wks001:~/buildroot$ make menuconfig
> make CC="/usr/bin/gcc" -C package/config conf mconf
> make[1]: Entering directory `/home/walsimou/buildroot/package/config'
> /usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2 -MM *.c > 
> .depend 2>/dev/null || :
> make[1]: Leaving directory `/home/walsimou/buildroot/package/config'
> make[1]: Entering directory `/home/walsimou/buildroot/package/config'
> /usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2 -c conf.c -o conf.o
> conf.c: In function ?conf_askvalue?:
> conf.c:112: warning: ignoring return value of ?fgets?, declared with 
> attribute warn_unused_result
> conf.c: In function ?conf_choice?:
> conf.c:363: warning: ignoring return value of ?fgets?, declared with 
> attribute warn_unused_result
> /usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2 -c kxgettext.c 
> -o kxgettext.o
> /usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2 -c 
> lxdialog/checklist.c -o lxdialog/checklist.o
> /usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2 -c 
> lxdialog/inputbox.c -o lxdialog/inputbox.o
> /usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2 -c 
> lxdialog/menubox.c -o lxdialog/menubox.o
> /usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2 -c 
> lxdialog/textbox.c -o lxdialog/textbox.o
> /usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2 -c 
> lxdialog/util.c -o lxdialog/util.o
> /usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2 -c 
> lxdialog/yesno.c -o lxdialog/yesno.o
> /usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2 -c mconf.c -o 
> mconf.o
> /usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2 -I. -c 
> zconf.tab.c -o zconf.tab.o
> In file included from zconf.tab.c:2475:
> confdata.c: In function ?conf_write?:
> confdata.c:500: warning: ignoring return value of ?fwrite?, declared 
> with attribute warn_unused_result
> confdata.c: In function ?conf_write_autoconf?:
> confdata.c:749: warning: ignoring return value of ?fwrite?, declared 
> with attribute warn_unused_result
> confdata.c:750: warning: ignoring return value of ?fwrite?, declared 
> with attribute warn_unused_result
> In file included from zconf.tab.c:2476:
> expr.c: In function ?expr_print_file_helper?:
> expr.c:1084: warning: ignoring return value of ?fwrite?, declared with 
> attribute warn_unused_result
> /usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2 conf.o 
> zconf.tab.o -lncursesw -o conf
> /usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2 mconf.o 
> zconf.tab.o lxdialog/checklist.o lxdialog/util.o lxdialog/inputbox.o 
> lxdialog/textbox.o lxdialog/yesno.o lxdialog/menubox.o -lncursesw -o mconf
> make[1]: Leaving directory `/home/walsimou/buildroot/package/config'
> package/dbus-glib/Config.in:2:error: found recursive dependency: 
> BR2_PACKAGE_DBUS_GLIB -> BR2_PACKAGE_EXPAT -> BR2_PACKAGE_DBUS -> 
> BR2_PACKAGE_DBUS_GLIB
> -> BR2_PACKAGE_LIBGLIB2 -> BR2_PACKAGE_GETTEXT -> 
> BR2_PACKAGE_PKGCONFIGwalsimou at wks001:~/buildroot$
> 
> 
> Regards
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
