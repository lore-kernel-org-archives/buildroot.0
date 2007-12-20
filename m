From: Hebbar <gururajakr@sanyo.co.in>
Date: Wed, 19 Dec 2007 17:31:22 -0800 (PST)
Subject: [Buildroot] error when building busybox (ash shell ) with latest
 snapshot
Message-ID: <14428945.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

I am trying to build amr926ejs toolchain with latest snapshot and the make
failed with below error (ash.c:(.text.ash_main+0xc4): undefined reference to
`INIT_G_alias'). I had built arm926ejs toolchains before with buildroot but
with latest snapshot i am getting this error. Kindly help me to solve the
same.

<snip>
<snip>

  CC      util-linux/switch_root.o
  CC      util-linux/umount.o
  AR      util-linux/lib.a
  LINK    busybox_unstripped
Trying libraries: crypt m
Failed: busybox_unstripped
/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc   
applets/built-in.o  archival/lib.a  archival/libunarchive/lib.a 
console-tools/lib.a  coreutils/lib.a  coreutils/libcoreutils/lib.a 
debianutils/lib.a  e2fsprogs/lib.a  editors/lib.a  findutils/lib.a 
init/lib.a  ipsvd/lib.a  libbb/lib.a  libpwdgrp/lib.a  loginutils/lib.a 
miscutils/lib.a  modutils/lib.a  networking/lib.a 
networking/libiproute/lib.a  networking/udhcp/lib.a  procps/lib.a 
runit/lib.a  selinux/lib.a  shell/lib.a  sysklogd/lib.a  util-linux/lib.a 
archival/built-in.o  archival/libunarchive/built-in.o 
console-tools/built-in.o  coreutils/built-in.o 
coreutils/libcoreutils/built-in.o  debianutils/built-in.o 
e2fsprogs/built-in.o  editors/built-in.o  findutils/built-in.o 
init/built-in.o  ipsvd/built-in.o  libbb/built-in.o  libpwdgrp/built-in.o 
loginutils/built-in.o  miscutils/built-in.o  modutils/built-in.o 
networking/built-in.o  networking/libiproute/built-in.o 
networking/udhcp/built-in.o  procps/built-in.o  runit/built-in.o 
selinux/built-in.o  shell/built-in.o  sysklogd/built-in.o 
util-linux/built-in.o  m crypt -Wl,--start-group -lcrypt -lm -Wl,--end-group
Output of:
/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc
-o busybox_unstripped -Wl,--sort-common -Wl,--sort-section -Wl,alignment
-Wl,--gc-sections -Wl,--start-group applets/built-in.o archival/lib.a
archival/libunarchive/lib.a console-tools/lib.a coreutils/lib.a
coreutils/libcoreutils/lib.a debianutils/lib.a e2fsprogs/lib.a editors/lib.a
findutils/lib.a init/lib.a ipsvd/lib.a libbb/lib.a libpwdgrp/lib.a
loginutils/lib.a miscutils/lib.a modutils/lib.a networking/lib.a
networking/libiproute/lib.a networking/udhcp/lib.a procps/lib.a runit/lib.a
selinux/lib.a shell/lib.a sysklogd/lib.a util-linux/lib.a
archival/built-in.o archival/libunarchive/built-in.o
console-tools/built-in.o coreutils/built-in.o
coreutils/libcoreutils/built-in.o debianutils/built-in.o
e2fsprogs/built-in.o editors/built-in.o findutils/built-in.o init/built-in.o
ipsvd/built-in.o libbb/built-in.o libpwdgrp/built-in.o loginutils/built-in.o
miscutils/built-in.o modutils/built-in.o networking/built-in.o
networking/libiproute/built-in.o networking/udhcp/built-in.o
procps/built-in.o runit/built-in.o selinux/built-in.o shell/built-in.o
sysklogd/built-in.o util-linux/built-in.o -Wl,--end-group -Wl,--start-group
-lcrypt -lm -Wl,--end-group
==========
shell/lib.a(ash.o): In function `ash_main':
ash.c:(.text.ash_main+0xc4): undefined reference to `INIT_G_alias'
collect2: ld returned 1 exit status
make[1]: *** [busybox_unstripped] Error 1
make[1]: Leaving directory
`/home/guru/project/original/bldrt/buildroot/project_build_arm/uclibc/busybox'
make: ***
[/home/guru/project/original/bldrt/buildroot/project_build_arm/uclibc/busybox/busybox]
Error 2


TIA.

Regards
Gururaja

-- 
View this message in context: http://www.nabble.com/error-when-building-busybox-%28ash-shell-%29-with-latest-snapshot-tp14428945p14428945.html
Sent from the BuildRoot mailing list archive at Nabble.com.
