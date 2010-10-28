From: Sasha Yohananov <yohananov@gmail.com>
Date: Thu, 28 Oct 2010 14:07:37 +0200
Subject: [Buildroot] Is there any chance to compile old buildroot on new
	distro
In-Reply-To: <AANLkTimOVKA5nq2rKDo_cJBHWCDFuh2tgYNNhAYQcD7i@mail.gmail.com>
References: <AANLkTi=CA_91mHxqKye2wPsRVGkOe2Zm2W1LnMGdk_OA@mail.gmail.com>
	<AANLkTi=j+qQ7Gq+pA1T4ANRLP_J7ZmEwytKCKx9-MF74@mail.gmail.com>
	<AANLkTikejZmUR+QPFOHKDM4W0nhB-yxkDX8+KX5LLLzr@mail.gmail.com>
	<AANLkTimOVKA5nq2rKDo_cJBHWCDFuh2tgYNNhAYQcD7i@mail.gmail.com>
Message-ID: <AANLkTi=cTgMHSB+u7R-gT_yBQ30dokTLd5TQFnLPx=s0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 28, 2010 at 1:53 PM, Sasha Yohananov <yohananov@gmail.com>wrote:

>
>
> On Thu, Oct 28, 2010 at 10:09 AM, Paulius Zaleckas <
> paulius.zaleckas at gmail.com> wrote:
>
>> On Thu, Oct 28, 2010 at 11:00 AM, Sasha Yohananov <yohananov@gmail.com>
>> wrote:
>> >
>> > Dear buildroot experts,
>> > For about 2 years I work on some commercial project (access control)
>> based
>> > on buildroot-2008.11.
>> > HW details are:
>> > CPU - ARM926EJ-S rev 5 (v5l)
>> > Board - Atmel AT91SAM9260-EK
>> > Former Host - Fedora 9.
>> > Current Host - Fedora 13
>> > After some initial tuning it compiled and produced everything that
>> needed
>> > (all images) excellently, but recently I was silly enough to upgrade my
>> > host's distribution to Fedora 13.
>> > Now I'm in trouble, I can't compile it at all. It fails at the beginning
>> of
>> > the process, I guess the are conflicts between old kernel's headers and
>> new
>> > glibc definitions.
>> > I understand that my buildroot is quite old but unfortunately I have to
>> > continue with it for some time.
>> > Is there any chance to compile it on new distribution?
>> > There are some details of my configuration and new distro tools:
>> > uname -a
>> > Linux riln-ls 2.6.33.3-85.fc13.i686.PAE #1 SMP Thu May 6 18:27:11 UTC
>> 2010
>> > i686 i686 i386 GNU/Linux
>> > gcc --version
>> > gcc (GCC) 4.4.4 20100503 (Red Hat 4.4.4-2)
>> > Copyright (C) 2010 Free Software Foundation, Inc.
>> > This is free software; see the source for copying conditions.  There is
>> NO
>> > warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
>> PURPOSE.
>> > gcc -###
>> > Using built-in specs.
>> > Target: i686-redhat-linux
>> > Configured with: ../configure --prefix=/usr --mandir=/usr/share/man
>> > --infodir=/usr/share/info --with-bugurl=
>> http://bugzilla.redhat.com/bugzilla
>> > --enable-bootstrap --enable-shared --enable-threads=posix
>> > --enable-checking=release --with-system-zlib --enable-__cxa_atexit
>> > --disable-libunwind-exceptions --enable-gnu-unique-object
>> > --enable-languages=c,c++,objc,obj-c++,java,fortran,ada
>> --enable-java-awt=gtk
>> > --disable-dssi --with-java-home=/usr/lib/jvm/java-1.5.0-gcj-1.5.0.0/jre
>> > --enable-libgcj-multifile --enable-java-maintainer-mode
>> > --with-ecj-jar=/usr/share/java/eclipse-ecj.jar
>> --disable-libjava-multilib
>> > --with-ppl --with-cloog --with-tune=generic --with-arch=i686
>> > --build=i686-redhat-linux
>> > Thread model: posix
>> > gcc version 4.4.4 20100503 (Red Hat 4.4.4-2) (GCC)
>> >
>> > /lib/libc.so.6
>> > GNU C Library stable release version 2.12.1, by Roland McGrath et al.
>> > Copyright (C) 2010 Free Software Foundation, Inc.
>> > This is free software; see the source for copying conditions.
>> > There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
>> > PARTICULAR PURPOSE.
>> > Compiled by GNU CC version 4.4.4 20100630 (Red Hat 4.4.4-10).
>> > Compiled on a Linux 2.6.34 system on 2010-10-19.
>> > Available extensions:
>> > The C stubs add-on version 2.1.2.
>> > crypt add-on version 2.1 by Michael Glad and others
>> > GNU Libidn by Simon Josefsson
>> > Native POSIX Threads Library by Ulrich Drepper et al
>> > BIND-8.2.3-T5B
>> > RT using linux kernel aio
>> > libc ABIs: UNIQUE IFUNC
>> > For bug reporting instructions, please see:
>> > <http://www.gnu.org/software/libc/bugs.html>.
>> >
>> > Config and build log files are attached.
>> > Thank you in advance,
>> > Sasha.
>>
>> You need a patch for kernel:
>>
>> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=patch;h=d15bd1067b1fcb2b7250d22bc0c7c7fea0b759f7
>>
>
>
>
> Paulius, thank you a lot for your quick response.
>
> I patched the kernel and then I could proceed up to module-init-tools-3.2.2
> compilation.
> Now the linker complains on absence of 'c' library.
> I'm getting confused, is it standard c library, it is looking for?
> Is there any way to fix it?
>
> ...
>
> bzcat
> /home/sasha/work/3rdparty/buildroot/dl/module-init-tools-3.2.2.tar.bz2 | tar
> -C /home/sasha/work/3rdparty/buildroot/toolchain_build_arm -xvf -
> module-init-tools-3.2.2/
> module-init-tools-3.2.2/doc/
> module-init-tools-3.2.2/doc/modprobe.conf.sgml
> module-init-tools-3.2.2/doc/modules.dep.sgml
> module-init-tools-3.2.2/doc/depmod.sgml
>
> ....
>
> module-init-tools-3.2.2/modules.dep.5
> module-init-tools-3.2.2/depmod.8
> module-init-tools-3.2.2/insmod.8
> module-init-tools-3.2.2/lsmod.8
> module-init-tools-3.2.2/rmmod.8
> module-init-tools-3.2.2/modprobe.8
> module-init-tools-3.2.2/modinfo.8
> toolchain/patch-kernel.sh
> /home/sasha/work/3rdparty/buildroot/toolchain_build_arm/module-init-tools-3.2.2
> package/module-init-tools \*.patch
>
> Applying module-init-tools.patch using plaintext:
> patching file Makefile.in
> Hunk #1 succeeded at 616 (offset 3 lines).
> Hunk #2 succeeded at 758 with fuzz 2 (offset -2 lines).
> Hunk #3 succeeded at 769 (offset -2 lines).
>
> Applying module-init-tools-remove-index.patch using plaintext:
> patching file modprobe.c
> cp -f package/gnuconfig/config.sub package/gnuconfig/config.guess
> /home/sasha/work/3rdparty/buildroot/toolchain_build_arm/module-init-tools-3.2.2
> touch
> /home/sasha/work/3rdparty/buildroot/toolchain_build_arm/module-init-tools-3.2.2/.source
> (cd
> /home/sasha/work/3rdparty/buildroot/toolchain_build_arm/module-init-tools-3.2.2;
> \
>         CC="/usr/lib/ccache/gcc" \
>         ./configure \
>         --target=arm-linux \
>         --host=i386-pc-linux-gnu \
>         --build=i386-pc-linux-gnu \
>         --sysconfdir=/etc \
>         --program-transform-name='' \
>     )
> checking build system type... i386-pc-linux-gnu
> checking host system type... i386-pc-linux-gnu
> checking target system type... arm-unknown-linux-gnu
> checking for a BSD-compatible install... /usr/bin/install -c
> checking whether build environment is sane... yes
> checking for gawk... gawk
> checking whether make sets $(MAKE)... yes
> checking for i386-pc-linux-gnu-gcc... /usr/lib/ccache/gcc
> checking for C compiler default output file name... a.out
> checking whether the C compiler works... yes
> checking whether we are cross compiling... no
> checking for suffix of executables...
> checking for suffix of object files... o
> checking whether we are using the GNU C compiler... yes
> checking whether /usr/lib/ccache/gcc accepts -g... yes
> checking for /usr/lib/ccache/gcc option to accept ANSI C... none needed
> checking for style of include used by make... GNU
> checking dependency style of /usr/lib/ccache/gcc... gcc3
> configure: Adding gcc options: -g -O2 -Wunused -Wall
> configure: creating ./config.status
> config.status: creating Makefile
> config.status: executing depfiles commands
> touch
> /home/sasha/work/3rdparty/buildroot/toolchain_build_arm/module-init-tools-3.2.2/.configured
> /usr/bin/make -j2 -C
> /home/sasha/work/3rdparty/buildroot/toolchain_build_arm/module-init-tools-3.2.2
> make[1]: Entering directory
> `/home/sasha/work/3rdparty/buildroot/toolchain_build_arm/module-init-tools-3.2.2'
> source='lsmod.c' object='lsmod.o' libtool=no \
>     depfile='.deps/lsmod.Po' tmpdepfile='.deps/lsmod.TPo' \
>     depmode=gcc3 /bin/sh ./depcomp \
>     /usr/lib/ccache/gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\"
> -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\"
> -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\"  -I. -I.     -g -O2
> -Wunused -Wall -c `test -f 'lsmod.c' || echo './'`lsmod.c
> source='insmod.c' object='insmod.o' libtool=no \
>     depfile='.deps/insmod.Po' tmpdepfile='.deps/insmod.TPo' \
>     depmode=gcc3 /bin/sh ./depcomp \
>     /usr/lib/ccache/gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\"
> -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\"
> -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\"  -I. -I.     -g -O2
> -Wunused -Wall -c `test -f 'insmod.c' || echo './'`insmod.c
> source='modprobe.c' object='modprobe.o' libtool=no \
>     depfile='.deps/modprobe.Po' tmpdepfile='.deps/modprobe.TPo' \
>     depmode=gcc3 /bin/sh ./depcomp \
>     /usr/lib/ccache/gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\"
> -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\"
> -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\"  -I. -I.     -g -O2
> -Wunused -Wall -c `test -f 'modprobe.c' || echo './'`modprobe.c
> source='zlibsupport.c' object='zlibsupport.o' libtool=no \
>     depfile='.deps/zlibsupport.Po' tmpdepfile='.deps/zlibsupport.TPo' \
>     depmode=gcc3 /bin/sh ./depcomp \
>     /usr/lib/ccache/gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\"
> -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\"
> -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\"  -I. -I.     -g -O2
> -Wunused -Wall -c `test -f 'zlibsupport.c' || echo './'`zlibsupport.c
> source='rmmod.c' object='rmmod.o' libtool=no \
>     depfile='.deps/rmmod.Po' tmpdepfile='.deps/rmmod.TPo' \
>     depmode=gcc3 /bin/sh ./depcomp \
>     /usr/lib/ccache/gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\"
> -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\"
> -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\"  -I. -I.     -g -O2
> -Wunused -Wall -c `test -f 'rmmod.c' || echo './'`rmmod.c
> source='depmod.c' object='depmod.o' libtool=no \
>     depfile='.deps/depmod.Po' tmpdepfile='.deps/depmod.TPo' \
>     depmode=gcc3 /bin/sh ./depcomp \
>     /usr/lib/ccache/gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\"
> -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\"
> -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\"  -I. -I.     -g -O2
> -Wunused -Wall -c `test -f 'depmod.c' || echo './'`depmod.c
> source='moduleops.c' object='moduleops.o' libtool=no \
>     depfile='.deps/moduleops.Po' tmpdepfile='.deps/moduleops.TPo' \
>     depmode=gcc3 /bin/sh ./depcomp \
>     /usr/lib/ccache/gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\"
> -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\"
> -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\"  -I. -I.     -g -O2
> -Wunused -Wall -c `test -f 'moduleops.c' || echo './'`moduleops.c
> source='tables.c' object='tables.o' libtool=no \
>     depfile='.deps/tables.Po' tmpdepfile='.deps/tables.TPo' \
>     depmode=gcc3 /bin/sh ./depcomp \
>     /usr/lib/ccache/gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\"
> -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\"
> -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\"  -I. -I.     -g -O2
> -Wunused -Wall -c `test -f 'tables.c' || echo './'`tables.c
> source='modinfo.c' object='modinfo.o' libtool=no \
>     depfile='.deps/modinfo.Po' tmpdepfile='.deps/modinfo.TPo' \
>     depmode=gcc3 /bin/sh ./depcomp \
>     /usr/lib/ccache/gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\"
> -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\"
> -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\"  -I. -I.     -g -O2
> -Wunused -Wall -c `test -f 'modinfo.c' || echo './'`modinfo.c
> modinfo.c: In function ?main?:
> modinfo.c:338: warning: ?infosize? may be used uninitialized in this
> function
> /usr/lib/ccache/gcc  -g -O2 -Wunused -Wall   -o insmod.static -static
> insmod.o
> /usr/bin/ld: cannot find -lc
> collect2: ld returned 1 exit status
> make[1]: *** [insmod.static] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make[1]: Leaving directory
> `/home/sasha/work/3rdparty/buildroot/toolchain_build_arm/module-init-tools-3.2.2'
> make: ***
> [/home/sasha/work/3rdparty/buildroot/toolchain_build_arm/module-init-tools-3.2.2/depmod]
> Error 2
> make: Leaving directory `/home/sasha/work/3rdparty/buildroot'
>
>
>
> Thank you again, Sasha.
>
>



By the way module-init-tools is not set to be built in my config.


# BR2_PACKAGE_LTT is not set
# BR2_PACKAGE_MODULE_INIT_TOOLS is not set
# BR2_PACKAGE_MODUTILS is not set
# BR2_PACKAGE_NG_SPICE_REWORK is not set
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101028/a76738a7/attachment-0001.html>
