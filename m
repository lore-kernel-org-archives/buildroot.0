From: Chrissy <c.pfindel@googlemail.com>
Date: Thu, 25 Feb 2010 13:04:31 +0100
Subject: [Buildroot] problem with hostname
Message-ID: <4B86674F.4040503@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm currently trying to make a buildroot system with the predefined i686-nptl-linux-gnu toolchain from crosstool-NG, means an external gnu toolchain. I selected no kernel and in package selection for
the target only the ones needed to build a development system. I'm using current rc2 on an Ubuntu 9.10.
When building the system I get following error, seems hostname is missing on the target.
...
Making install in gnulib-tests
make[3]: Entering directory `/media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/build/coreutils-7.4/gnulib-tests'
/usr/bin/make  install-recursive
make[4]: Entering directory `/media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/build/coreutils-7.4/gnulib-tests'
make[5]: Entering directory `/media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/build/coreutils-7.4/gnulib-tests'
make[6]: Entering directory `/media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/build/coreutils-7.4/gnulib-tests'
make[6]: Nothing to be done for `install-exec-am'.
make[6]: Nothing to be done for `install-data-am'.
make[6]: Leaving directory `/media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/build/coreutils-7.4/gnulib-tests'
make[5]: Leaving directory `/media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/build/coreutils-7.4/gnulib-tests'
make[4]: Leaving directory `/media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/build/coreutils-7.4/gnulib-tests'
make[3]: Leaving directory `/media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/build/coreutils-7.4/gnulib-tests'
make[3]: Entering directory `/media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/build/coreutils-7.4'
make[4]: Entering directory `/media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/build/coreutils-7.4'
make[4]: Nothing to be done for `install-exec-am'.
make[4]: Nothing to be done for `install-data-am'.
make[4]: Leaving directory `/media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/build/coreutils-7.4'
make[3]: Leaving directory `/media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/build/coreutils-7.4'
make[2]: Leaving directory `/media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/build/coreutils-7.4'
make[1]: Verlasse Verzeichnis '/media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/build/coreutils-7.4'
# some things go in root rather than usr
for f in cat chgrp chmod chown cp date dd df dir echo false hostname ln ls mkdir mknod mv pwd rm rmdir vdir sleep stty sync touch true uname; do \
		mv /media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/target/usr/bin/$f /media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/target/bin/$f; \
	done
mv: Aufruf von stat f?r ?/media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/target/usr/bin/hostname? nicht m?glich: No such file or directory
# link for archaic shells
ln -fs test /media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/target/usr/bin/[
# gnu thinks chroot is in bin, debian thinks it's in sbin
mv /media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/target/usr/bin/chroot /media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/target/usr/sbin/chroot
/media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/staging/usr/bin/i686-nptl-linux-gnu-sstrip /media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/target/usr/sbin/chroot > /dev/null 2>&1
make: *** [/media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/target/bin/vdir] Fehler 126


Also when I don't do a "make clean" after that error, I get:
make: stat: /media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/staging/usr/bin/i686-nptl-linux-gnu-sstrip: Too many levels of symbolic links
mkdir -p /media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/staging/usr/bin /media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/staging/usr/i686-nptl-linux-gnu/bin
/usr/bin/gcc -g -O2 /media/f_mp3/MiniFS/buildroot-2010.02-rc2/toolchain/sstrip/sstrip.c -o /media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/staging/usr/bin/i686-nptl-linux-gnu-sstrip
/usr/bin/ld: cannot open output file /media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/staging/usr/bin/i686-nptl-linux-gnu-sstrip: Too many levels of symbolic links
collect2: ld returned 1 exit status
make: *** [/media/f_mp3/MiniFS/buildroot-2010.02-rc2/output/staging/usr/bin/i686-nptl-linux-gnu-sstrip] Fehler 1


Does someone know about this error or can help anyway?
Would be nice.

Best regards
Chrissy
