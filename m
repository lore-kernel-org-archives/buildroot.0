From: Willy Lambert <lambert.willy@gmail.com>
Date: Wed, 12 Dec 2012 10:20:33 +0100
Subject: [Buildroot] buildroot 2012.11 large file support
In-Reply-To: <20121211171008.3b869509@skate>
References: <NDBBKLDECLOIHFJKBINACEFAFPAA.Berns@BEKA-Elektronik.de>
 <CAKvQZ_0BrzUShzUyvM50CVabtw5BUM=1CupzD0-R1mfBuc3Adg@mail.gmail.com>
 <87d2yhsoh8.fsf@dell.be.48ers.dk>
 <CAKvQZ_1KXZcriA+RTjaz1=15UEUahu=Qvq5ovA7GeVvwDyxmVw@mail.gmail.com>
 <878v95skvm.fsf@dell.be.48ers.dk>
 <CAKvQZ_2MzciYPnYw0rCv_pzhHTzOS+vn=sry7nubtHd+sha3cw@mail.gmail.com>
 <CAKvQZ_3sog-JnwOYiJWE6a8eCk-LcjSZ-txr0Z_AHTiC8NnRgw@mail.gmail.com>
 <20121211171008.3b869509@skate>
Message-ID: <CAKvQZ_3FxwmGNtfO1GiOOVhzbaayeKoBG7BDNaVgNvNjRiJt2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/12/11 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Willy Lambert,
>
> On Tue, 11 Dec 2012 16:09:46 +0100, Willy Lambert wrote:
>
>> I did this again from another machine
>> (silvie at silvie-VirtualBox:~/buildroot-2012.11$ uname -a
>> Linux silvie-VirtualBox 3.2.0-34-generic-pae #53-Ubuntu SMP Thu Nov 15
>> 11:11:12 UTC 2012 i686 i686 i386 GNU/Linux)
>>
>> In short :
>> wget buildroot, tar -xf, make, a menuconfig pops, I exit and save
>> config, make, wait a bit ... and it fails with the above error about
>> large file system.
>>
>> So I'm sure now that the default config has a problem with largefiles.
>> I'm sorry I'm too new to investigate further. Should I open a bug
>> ticket ?
>>
>> I did not try other versions of gcc as proposed by Berns. But my gcc
>> version is :
>> ard at ard-host(10.0):/opt/buildroot/output/host/usr$
>> ./x86_64-buildroot-linux-uclibc/bin/gcc --version
>> gcc (Buildroot 2012.11-svn2-dirty) 4.6.3
>> I wonder about the "svn2-dirty" tag.
>
> Can you do:
>
>         make clean
>         rm .config
>         make menuconfig / exit / save
>         env > buildroot-fails.env
>         make 2>&1 | tee buildroot-fails.log
>         cp output/toolchain/uClibc-0.9.33.2/.config buildroot-fails.uClibc.config
>

all my precedent try were on a virtual machines i386. One is latest
Ubuntu, the other is a not-updated Dedian Squeeze from early 2011.

Logs will come in private mail, because I don't know how to share them easily.


Here is the other command results (that you probably don't need) :

silvie at silvie-VirtualBox:~/buildroot-2012.11$ make clean
rm -rf /home/silvie/buildroot-2012.11/output/host/usr/i586-buildroot-linux-uclibc/sysroot
/home/silvie/buildroot-2012.11/output/target
/home/silvie/buildroot-2012.11/output/images
/home/silvie/buildroot-2012.11/output/host \
		/home/silvie/buildroot-2012.11/output/stamps
/home/silvie/buildroot-2012.11/output/build
/home/silvie/buildroot-2012.11/output/toolchain
/home/silvie/buildroot-2012.11/output/staging \
		/home/silvie/buildroot-2012.11/output/legal-info
silvie at silvie-VirtualBox:~/buildroot-2012.11$ rm .config
silvie at silvie-VirtualBox:~/buildroot-2012.11$ make menuconfig
mkdir -p /home/silvie/buildroot-2012.11/output/build/buildroot-config/lxdialog
make CC="/usr/bin/gcc" HOSTCC="/usr/bin/gcc"
obj=/home/silvie/buildroot-2012.11/output/build/buildroot-config -C
support/kconfig -f Makefile.br mconf
make[1]: entrant dans le r?pertoire ?
/home/silvie/buildroot-2012.11/support/kconfig ?
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE
-I/home/silvie/buildroot-2012.11/output/build/buildroot-config  -MM
*.c > /home/silvie/buildroot-2012.11/output/build/buildroot-config/.depend
2>/dev/null || :
make[1]: quittant le r?pertoire ?
/home/silvie/buildroot-2012.11/support/kconfig ?
make[1]: entrant dans le r?pertoire ?
/home/silvie/buildroot-2012.11/support/kconfig ?
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE
-I/home/silvie/buildroot-2012.11/output/build/buildroot-config   -c
conf.c -o /home/silvie/buildroot-2012.11/output/build/buildroot-config/conf.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE
-I/home/silvie/buildroot-2012.11/output/build/buildroot-config   -c
lxdialog/checklist.c -o
/home/silvie/buildroot-2012.11/output/build/buildroot-config/lxdialog/checklist.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE
-I/home/silvie/buildroot-2012.11/output/build/buildroot-config   -c
lxdialog/inputbox.c -o
/home/silvie/buildroot-2012.11/output/build/buildroot-config/lxdialog/inputbox.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE
-I/home/silvie/buildroot-2012.11/output/build/buildroot-config   -c
lxdialog/menubox.c -o
/home/silvie/buildroot-2012.11/output/build/buildroot-config/lxdialog/menubox.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE
-I/home/silvie/buildroot-2012.11/output/build/buildroot-config   -c
lxdialog/textbox.c -o
/home/silvie/buildroot-2012.11/output/build/buildroot-config/lxdialog/textbox.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE
-I/home/silvie/buildroot-2012.11/output/build/buildroot-config   -c
lxdialog/util.c -o
/home/silvie/buildroot-2012.11/output/build/buildroot-config/lxdialog/util.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE
-I/home/silvie/buildroot-2012.11/output/build/buildroot-config   -c
lxdialog/yesno.c -o
/home/silvie/buildroot-2012.11/output/build/buildroot-config/lxdialog/yesno.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE
-I/home/silvie/buildroot-2012.11/output/build/buildroot-config   -c
mconf.c -o /home/silvie/buildroot-2012.11/output/build/buildroot-config/mconf.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE
-I/home/silvie/buildroot-2012.11/output/build/buildroot-config  -I. -c
/home/silvie/buildroot-2012.11/output/build/buildroot-config/zconf.tab.c
-o /home/silvie/buildroot-2012.11/output/build/buildroot-config/zconf.tab.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE
-I/home/silvie/buildroot-2012.11/output/build/buildroot-config
/home/silvie/buildroot-2012.11/output/build/buildroot-config/mconf.o
/home/silvie/buildroot-2012.11/output/build/buildroot-config/zconf.tab.o
/home/silvie/buildroot-2012.11/output/build/buildroot-config/lxdialog/checklist.o
/home/silvie/buildroot-2012.11/output/build/buildroot-config/lxdialog/util.o
/home/silvie/buildroot-2012.11/output/build/buildroot-config/lxdialog/inputbox.o
/home/silvie/buildroot-2012.11/output/build/buildroot-config/lxdialog/textbox.o
/home/silvie/buildroot-2012.11/output/build/buildroot-config/lxdialog/yesno.o
/home/silvie/buildroot-2012.11/output/build/buildroot-config/lxdialog/menubox.o
-lncurses -o /home/silvie/buildroot-2012.11/output/build/buildroot-config/mconf
rm /home/silvie/buildroot-2012.11/output/build/buildroot-config/zconf.tab.c
make[1]: quittant le r?pertoire ?
/home/silvie/buildroot-2012.11/support/kconfig ?
#
# configuration written to /home/silvie/buildroot-2012.11/.config
#


*** End of the configuration.
*** Execute 'make' to start the build or try 'make help'.

silvie at silvie-VirtualBox:~/buildroot-2012.11$




> And then put somewhere online (do *NOT* send them by e-mail on the
> list, it will be too large) the buildroot-fails.env,
> buildroot-fails.log and buildroot-fails.uClibc.config files.
>

even compressed ? It is just 200ko.


> I have just built the default Buildroot configuration on two Ubuntu
> 12.04 machines, with zero problem.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
