From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 26 May 2012 19:50:24 +0200
Subject: [Buildroot] Erorr build buildroot-2012.05-rc3 (Microblaze)
In-Reply-To: <CAE8RAbcT2DCnFOyhJxg=e-50nzq1yTQnGx6MT_bbtH3j5sQkag@mail.gmail.com>
 (=?utf-8?B?ItCU0LzQuNGC0YDQuNC5INCT0YDQuNGG0LDQuSIncw==?= message of "Sat,
 26 May 2012 18:51:36 +0300")
References: <CAE8RAbcT2DCnFOyhJxg=e-50nzq1yTQnGx6MT_bbtH3j5sQkag@mail.gmail.com>
Message-ID: <87hav296hr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "???????" == ??????? ?????? <dmytriy.grytsay@gmail.com> writes:

Hi,

Please use the buildroot list rather than mailing me directly in the
future, thanks.

 ???????> Hello
 ???????> I would like to report a bug in Buildroot.

 ???????> When I build?buildroot-2012.05-rc3 for Microblaze
 ???????> architecture, i have the fallowing error:

 ???????> kruger at thinkpad:/media/elements/microblaze/buildroot-2012.05-rc3$ make
 ???????> /usr/bin/make -j2 ?HOSTCC="/usr/bin/gcc" HOSTCXX="/usr/bin/g++" silentoldconfig
 ???????> make[1]: Entering directory `/media/elements/microblaze/buildroot-2012.05-rc3'
 ???????> mkdir -p /media/elements/microblaze/buildroot-2012.05-rc3/output/build/
 ???????> buildroot-config/lxdialog
 ???????> /usr/bin/make CC="/usr/bin/gcc" HOSTCC="/usr/bin/gcc" obj=/media/elements/
 ???????> microblaze/buildroot-2012.05-rc3/output/build/buildroot-config -C support/
 ???????> kconfig -f Makefile.br conf
 ???????> make[2]: Entering directory `/media/elements/microblaze/buildroot-2012.05-rc3/
 ???????> support/kconfig'
 ???????> /usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE ?-I/media/elements/microblaze/
 ???????> buildroot-2012.05-rc3/output/build/buildroot-config ? /media/elements/
 ???????> microblaze/buildroot-2012.05-rc3/output/build/buildroot-config/conf.o /media/
 ???????> elements/microblaze/buildroot-2012.05-rc3/output/build/buildroot-config/
 ???????> zconf.tab.o ?-o /media/elements/microblaze/buildroot-2012.05-rc3/output/build/
 ???????> buildroot-config/conf
 ???????> make[2]: Leaving directory `/media/elements/microblaze/buildroot-2012.05-rc3/
 ???????> support/kconfig'
 ???????> KCONFIG_AUTOCONFIG=/media/elements/microblaze/buildroot-2012.05-rc3/output/
 ???????> build/buildroot-config/auto.conf KCONFIG_AUTOHEADER=/media/elements/microblaze/
 ???????> buildroot-2012.05-rc3/output/build/buildroot-config/autoconf.h KCONFIG_TRISTATE
 ???????> =/media/elements/microblaze/buildroot-2012.05-rc3/output/build/buildroot-config
 ???????> /tristate.config BUILDROOT_CONFIG=/media/elements/microblaze/
 ???????> buildroot-2012.05-rc3/.config /media/elements/microblaze/buildroot-2012.05-rc3/
 ???????> output/build/buildroot-config/conf --silentoldconfig Config.in
 ???????> #
 ???????> # configuration written to /media/elements/microblaze/buildroot-2012.05-rc3
 ???????> /.config
 ???????> #
 ???????> make[1]: Leaving directory `/media/elements/microblaze/buildroot-2012.05-rc3'
 ???????> mkdir -p /media/elements/microblaze/buildroot-2012.05-rc3/output/target
 ???????> if ! [ -d "/media/elements/microblaze/buildroot-2012.05-rc3/output/target/bin"
 ???????> ]; then \
 ???????> if [ -d "/media/elements/microblaze/buildroot-2012.05-rc3/fs/skeleton" ]; then
 ???????> \
 ???????> cp -fa /media/elements/microblaze/buildroot-2012.05-rc3/fs/skeleton/* /media/
 ???????> elements/microblaze/buildroot-2012.05-rc3/output/target/; \
 ???????> fi; \
 ???????> fi
 ???????> find /media/elements/microblaze/buildroot-2012.05-rc3/output/target -type d
 ???????> -name CVS -print0 -o -name .svn -print0 | xargs -0 rm -rf
 ???????> find /media/elements/microblaze/buildroot-2012.05-rc3/output/target -type f \(
 ???????> -name .empty -o -name '*~' \) -print0 | xargs -0 rm -rf
 ???????> touch /media/elements/microblaze/buildroot-2012.05-rc3/output/build/.root
 ???????> --2012-05-26 17:20:08-- ?http://git.xilinx.com/?p=xldk/microblaze_v2.0.git;a=
 ???????> blob;h=71e031ae990e063a5718f90d30cf97ad85e2f565;hb=
 ???????> 569081301f0f1d8d3b24335a364e8ff1774190d4;f=microblaze-unknown-linux-gnu.tgz
 ???????> Resolving git.xilinx.com... 149.199.60.191
 ???????> Connecting to git.xilinx.com|149.199.60.191|:80... connected.
 ???????> HTTP request sent, awaiting response... 200 OK
 ???????> Length: unspecified [application/x-gzip]
 ???????> Saving to: `/media/elements/microblaze/buildroot-2012.05-rc3/dl/
 ???????> microblaze-unknown-linux-gnu.tgz'

 ???????> ? ? [ ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?
 ???????> ? ? ? ? ? ? ? ? ? <=> ? ? ] 62,611,385 ?20.2K/s ? in 48m 27s ?

 ???????> 2012-05-26 18:08:40 (21.0 KB/s) - `/media/elements/microblaze/
 ???????> buildroot-2012.05-rc3/dl/microblaze-unknown-linux-gnu.tgz' saved [62611385]

 ???????> mkdir -p /media/elements/microblaze/buildroot-2012.05-rc3/output/host/opt/
 ???????> ext-toolchain
 ???????> gzip -d -c /media/elements/microblaze/buildroot-2012.05-rc3/dl/
 ???????> microblaze-unknown-linux-gnu.tgz | \
 ???????> tar --strip-components=1 --exclude='usr/lib/locale/*' -C /media/elements/
 ???????> microblaze/buildroot-2012.05-rc3/output/host/opt/ext-toolchain ?-xf -
 ???????> Checking external toolchain settings
 ???????> Cannot execute cross-compiler '/media/elements/microblaze/buildroot-2012.05-rc3

I guess you're on a 32bit PC? The Xilinx cross compiler is apparently a
64bit binary. There's not much to do about it exept for either build on
a 64bit machine or go back to the earlier v1 binary. There was a
dicussion about it on the list recently:

http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/41555/focus=41600


-- 
Bye, Peter Korsgaard
