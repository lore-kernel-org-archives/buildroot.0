From: Jonathan and Caroline Moore <jandcmoore@gmail.com>
Date: Tue, 29 Jul 2008 22:20:18 +0100
Subject: [Buildroot] Bash failing
In-Reply-To: <488F09C3.2090205@cetrtapot.si>
References: <8bf7d05b0807260046q35afd439kf3d0a8b950dc5344@mail.gmail.com>
	<488D8691.6070904@cetrtapot.si>
	<8bf7d05b0807280413t58506a27jcfcf36ae301de559@mail.gmail.com>
	<488DC095.7000303@cetrtapot.si>
	<8bf7d05b0807280833x7cace636xa2b41176d306b6be@mail.gmail.com>
	<488EC7EF.4090203@cetrtapot.si>
	<8bf7d05b0807290449t58e05508yc8fe48edf12400a2@mail.gmail.com>
	<488F09C3.2090205@cetrtapot.si>
Message-ID: <8bf7d05b0807291420n407ca0fn3fc4e01d43545ab7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Still no joy and it is all rather frustrating. Aren't these things
meant to "work out of the box"? Are you able to send me the .config
you have managed to get working and tell me the buildroot snapshot you
used please?

The patch generates this error:

make[2]: Leaving directory
`/home/jm/git/Arm.2410/buildroot/build_arm/bash-3.2/lib/tilde'
rm -f bash
/opt/crosstool/gcc-4.1.0-glibc-2.3.2/arm-unknown-linux-gnu/bin/arm-unknown-linux-gnu-gcc
-L./builtins -L./lib/readline -L./lib/readline -L./lib/glob
-L./lib/tilde  -L./lib/sh  -rdynamic
-I/home/jm/git/Arm.2410/buildroot/build_arm/staging_dir/usr/include -o
bash shell.o eval.o y.tab.o general.o make_cmd.o print_cmd.o
dispose_cmd.o execute_cmd.o variables.o copy_cmd.o error.o expr.o
flags.o nojobs.o subst.o hashcmd.o hashlib.o mailcheck.o trap.o
input.o unwind_prot.o pathexp.o sig.o test.o version.o alias.o array.o
arrayfunc.o braces.o bracecomp.o bashhist.o bashline.o  list.o
stringlib.o locale.o findcmd.o redir.o pcomplete.o pcomplib.o syntax.o
xmalloc.o signames.o -lbuiltins -lsh -lreadline -lhistory -lcurses
-lglob -ltilde    -ldl
/opt/crosstool/gcc-4.1.0-glibc-2.3.2/arm-unknown-linux-gnu/lib/gcc/arm-unknown-linux-gnu/4.1.0/../../../../arm-unknown-linux-gnu/bin/ld:
cannot find -lcurses
collect2: ld returned 1 exit status
make[1]: *** [bash] Error 1
make[1]: Leaving directory `/home/jm/git/Arm.2410/buildroot/build_arm/bash-3.2'
make: *** [/home/jm/git/Arm.2410/buildroot/build_arm/bash-3.2/bash] Error 2

and trying to build a buildroot toolchain causes this error

config.status: creating po/Makefile.in
config.status: executing depfiles commands
config.status: executing libtool commands
config.status: executing default-1 commands
config.status: executing bfd_stdint.h commands
config.status: executing default commands
make[4]: Leaving directory
`/home/jm/git/Arm.2410/buildroot/toolchain_build_arm/binutils-2.18-build/bfd/po'
make[4]: Entering directory
`/home/jm/git/Arm.2410/buildroot/toolchain_build_arm/binutils-2.18-build/bfd/po'
make[4]: Nothing to be done for `info'.
make[4]: Leaving directory
`/home/jm/git/Arm.2410/buildroot/toolchain_build_arm/binutils-2.18-build/bfd/po'
make[4]: Entering directory
`/home/jm/git/Arm.2410/buildroot/toolchain_build_arm/binutils-2.18-build/bfd'
make[4]: Nothing to be done for `info-am'.
make[4]: Leaving directory
`/home/jm/git/Arm.2410/buildroot/toolchain_build_arm/binutils-2.18-build/bfd'
make[3]: *** [info-recursive] Error 1
make[3]: Leaving directory
`/home/jm/git/Arm.2410/buildroot/toolchain_build_arm/binutils-2.18-build/bfd'
make[2]: *** [all-bfd] Error 2
make[2]: Leaving directory
`/home/jm/git/Arm.2410/buildroot/toolchain_build_arm/binutils-2.18-build'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/jm/git/Arm.2410/buildroot/toolchain_build_arm/binutils-2.18-build'
make: *** [/home/jm/git/Arm.2410/buildroot/toolchain_build_arm/binutils-2.18-build/binutils/objdump]
Error 2

Jonathan

2008/7/29 Hinko Kocevar <hinko.kocevar@cetrtapot.si>:
> Jonathan and Caroline Moore wrote:
>> Here is my output - it seems it is not looking in the right places.
>
> Just as I though so.
>
>>
>> Is there a way to correct this or do I need to try and get buildroot
>> to make a cross-compiler too?
>
> Try attached patch.
>
> HTH,
> Hinko
>
> --
> ?ETRTA POT, d.o.o., Kranj
> Planina 3
> 4000 Kranj
> Slovenia, Europe
> Tel. +386 (0) 4 280 66 03
> E-mail: hinko.kocevar at cetrtapot.si
> Http: www.cetrtapot.si
>
>



-- 
Jonathan (and Caroline)

Jonathan and Caroline Moore
JandCMoore at gmail.com (Jonathan)
CandJMoore at gmail.com (Caroline)
http://jandcmoore.googlepages.com/
