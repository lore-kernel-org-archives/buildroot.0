From: Altunbas Sabri (DC-IA/EAH2) <sabri.altunbas@boschrexroth.de>
Date: Fri, 15 Nov 2013 10:38:55 +0100
Subject: [Buildroot] buildroot: gcc options
In-Reply-To: <CAAXf6LU1bamXyxhjhB5rTTHM-iHRbKrsTF5m1MUJLZjOaNXmuQ@mail.gmail.com>
References: <EADA2943BAC14C4AB625A3550A3BE980096DF2C30B@SI-MBX04.de.bosch.com>
 <CAAXf6LU1bamXyxhjhB5rTTHM-iHRbKrsTF5m1MUJLZjOaNXmuQ@mail.gmail.com>
Message-ID: <EADA2943BAC14C4AB625A3550A3BE980096DF2C345@SI-MBX04.de.bosch.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I defined 

....
BR2_TARGET_OPTIMIZATION="-pipe -mfmovd -mdalign"
.....

But I get following errors

....
....
editors/awk.c: In function 'my_strtod':
editors/awk.c:746:1: internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <https://support.codesourcery.com/GNUToolchain/> for instructions.
make[2]: *** [editors/awk.o] Error 1
make[1]: *** [editors] Error 2
make[1]: *** Waiting for unfinished jobs....
  CC      coreutils/hostid.o
  CC      coreutils/id.o
  CC      coreutils/install.o
  CC      coreutils/ln.o
  CC      coreutils/logname.o
  CC      coreutils/ls.o
  CC      coreutils/md5_sha1_sum.o
  CC      coreutils/mkdir.o
  CC      coreutils/mkfifo.o
  CC      coreutils/mknod.o
  CC      coreutils/mv.o
  CC      coreutils/nice.o
  CC      coreutils/nohup.o
  CC      coreutils/od.o
  CC      coreutils/printenv.o
  CC      coreutils/printf.o
coreutils/printf.c: In function 'print_direc':
coreutils/printf.c:248:1: internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <https://support.codesourcery.com/GNUToolchain/> for instructions.
make[2]: *** [coreutils/printf.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [coreutils] Error 2
make[1]: Leaving directory `/home/tux/aaa/buildroot/sh/output/build/busybox-1.21.1'
make: *** [/home/tux/aaa/buildroot/sh/output/build/busybox-1.21.1/.stamp_built] Error 2
tux at lmde ~/aaa/buildroot/sh $

Best regards,
Sabri
