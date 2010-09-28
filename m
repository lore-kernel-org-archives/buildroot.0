From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Tue, 28 Sep 2010 09:54:19 +0200
Subject: [Buildroot] menuconfig fails to compile
In-Reply-To: <4CA19CB9.2040107@gmail.com>
References: <4CA19CB9.2040107@gmail.com>
Message-ID: <AANLkTinKz3nXR7pd64NDUoiX+JA5GUr9H4nFErrwt4rE@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Again, this is due to the kconfig update, you have to cleanup your
repository to fix that.

Regards,

--
Lionel Landwerlin

On Tue, Sep 28, 2010 at 9:43 AM, Paulius Zaleckas
<paulius.zaleckas@gmail.com> wrote:
> I have just did git pull and now menuconfig fails to compile:
>
> [paulius at pauliusz buildroot]$ make
> /usr/bin/make -j2 ?silentoldconfig
> make[1]: Entering directory `/home/paulius/buildroot'
> mkdir -p /home/paulius/buildroot/output/build/buildroot-config/lxdialog
> /usr/bin/make CC="/usr/bin/gcc"
> obj=/home/paulius/buildroot/output/build/buildroot-config -C package/config
> -f Makefile.br conf
> make[2]: Entering directory `/home/paulius/buildroot/package/config'
> /usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE
> ?-I/home/paulius/buildroot/output/build/buildroot-config -g -O2 -MM *.c >
> /home/paulius/buildroot/output/build/buildroot-config/.depend 2>/dev/null ||
> :
> make[2]: Leaving directory `/home/paulius/buildroot/package/config'
> make[2]: Entering directory `/home/paulius/buildroot/package/config'
> /usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE
> ?-I/home/paulius/buildroot/output/build/buildroot-config -g -O2 ?-c conf.c
> -o /home/paulius/buildroot/output/build/buildroot-config/conf.o
> /usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE
> ?-I/home/paulius/buildroot/output/build/buildroot-config -g -O2 ?-c
> kxgettext.c -o
> /home/paulius/buildroot/output/build/buildroot-config/kxgettext.o
> /usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE
> ?-I/home/paulius/buildroot/output/build/buildroot-config -g -O2 -I. -c
> zconf.tab.c -o
> /home/paulius/buildroot/output/build/buildroot-config/zconf.tab.o
> zconf.tab.c:181: error: conflicting types for ?symbol_hash?
> lkc_proto.h:27: note: previous declaration of ?symbol_hash? was here
> make[2]: ***
> [/home/paulius/buildroot/output/build/buildroot-config/zconf.tab.o] Error 1
> make[2]: Leaving directory `/home/paulius/buildroot/package/config'
> make[1]: *** [/home/paulius/buildroot/output/build/buildroot-config/conf]
> Error 2
> make[1]: Leaving directory `/home/paulius/buildroot'
> make: *** [/home/paulius/buildroot/output/build/buildroot-config/auto.conf]
> Error 2
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
