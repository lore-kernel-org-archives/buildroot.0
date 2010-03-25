From: Yury Luneff <bitterman@ya.ru>
Date: Thu, 25 Mar 2010 18:28:03 +0300
Subject: [Buildroot] external toolchain and sysroot
Message-ID: <1272730299.20100325182803@ya.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

I'm warning, I'm new to buildroot.

I have built my toolchain with crosstool-NG with sysroot option 
enabled and i've chosen uclibc.

I'm trying to build my rootfs with this toolchain. I guess, I have 
proper buildroot configuration, but as soon as package has it 
dependency somewhere in new sysroot, I have linker problems:

/home/yury/toolchain/arm-indigo-linux-uclibcgnueabi/bin/arm-indigo-linux-uclibcgnueabi-gcc 
-Os -pipe -Os  --sysroot /home/yury/buildroot/output/staging/  -DAUTOCONF -DPOSIX -DUSG -c window.c

I see --sysroot here and everything is ok.

But in linking phase:
/home/yury/toolchain/arm-indigo-linux-uclibcgnueabi/bin/arm-indigo-linux-uclibcgnueabi-gcc 
-DAUTOCONF -DPOSIX -DUSG -o em ansi.o basic.o bind.o buffer.o crypt.o display.o eval.o exec.o 
file.o fileio.o ibmpc.o input.o isearch.o line.o lock.o main.o pklock.o posix.o random.o 
region.o search.o spawn.o tcap.o termio.o vmsvt.o vt52.o window.o word.o -lncurses
/home/yury/toolchain/arm-indigo-linux-uclibcgnueabi/lib/gcc/arm-indigo-linux-uclibcgnueabi/4.3.4/../..
/../../arm-indigo-linux-uclibcgnueabi/bin/ld: cannot find -lncurses

here --sysroot is omitted and thus I'm very sad :-)

I can't figure this out by myself. TARGET_LDFLAGS are good, 
TARGET_CFLAGS are too.

It is definetely not the problem of package as openvpn doesn't find 
openssl too and the corresponding .so files are in staging. Or it is 
a bug in both uemacs and openvpn which is unprobable. I know there 
were problems with openvpn and external toolchains but it was kinda at 
least a year ago.

Buildroot is both latest stable version and the current snapshot -- 
the same problem.

How should I find my way through?
