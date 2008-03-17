From: Perry Hung <iperry@gmail.com>
Date: Mon, 17 Mar 2008 00:55:37 -0400
Subject: [Buildroot] Errors Linking/Compiling Busybox
Message-ID: <ae16bd8c0803162155k16ebce9fv3bc3a8e31d8d8ec9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to build a file system with busybox, uclibc, tinyx and matchbox.

While linking busybox, it appears to fail linking against some libraries:


LINK    busybox_unstripped
Trying libraries: crypt m
Failed: busybox_unstripped
/local/perry/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc
   applets/built-in.o  archival/lib.a  archival/libunarchive/lib.a
console-tools/lib.a  coreutils/lib.a  coreutils/libcoreutils/lib.a
debianutils/lib.a  e2fsprogs/lib.a  editors/lib.a  findutils/lib.a
init/lib.a  ipsvd/lib.a  libbb/lib.a  libpwdgrp/lib.a
loginutils/lib.a  miscutils/lib.a  modutils/lib.a  networking/lib.a
networking/libiproute/lib.a  networking/udhcp/lib.a  procps/lib.a
runit/lib.a  selinux/lib.a  shell/lib.a  sysklogd/lib.a
util-linux/lib.a  archival/built-in.o
archival/libunarchive/built-in.o  console-tools/built-in.o
coreutils/built-in.o  coreutils/libcoreutils/built-in.o
debianutils/built-in.o  e2fsprogs/built-in.o  editors/built-in.o
findutils/built-in.o  init/built-in.o  ipsvd/built-in.o
libbb/built-in.o  libpwdgrp/built-in.o  loginutils/built-in.o
miscutils/built-in.o  modutils/built-in.o  networking/built-in.o
networking/libiproute/built-in.o  networking/udhcp/built-in.o
procps/built-in.o  runit/built-in.o  selinux/built-in.o
shell/built-in.o  sysklogd/built-in.o  util-linux/built-in.o  m crypt
-Wl,--start-group -lcrypt -lm -Wl,--end-group
Output of:
/local/perry/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc
-o busybox_unstripped -Wl,--sort-common -Wl,--sort-section
-Wl,alignment -Wl,--gc-sections -Wl,--start-group applets/built-in.o
archival/lib.a archival/libunarchive/lib.a console-tools/lib.a
coreutils/lib.a coreutils/libcoreutils/lib.a debianutils/lib.a
e2fsprogs/lib.a editors/lib.a findutils/lib.a init/lib.a ipsvd/lib.a
libbb/lib.a libpwdgrp/lib.a loginutils/lib.a miscutils/lib.a
modutils/lib.a networking/lib.a networking/libiproute/lib.a
networking/udhcp/lib.a procps/lib.a runit/lib.a selinux/lib.a
shell/lib.a sysklogd/lib.a util-linux/lib.a archival/built-in.o
archival/libunarchive/built-in.o console-tools/built-in.o
coreutils/built-in.o coreutils/libcoreutils/built-in.o
debianutils/built-in.o e2fsprogs/built-in.o editors/built-in.o
findutils/built-in.o init/built-in.o ipsvd/built-in.o libbb/built-in.o
libpwdgrp/built-in.o loginutils/built-in.o miscutils/built-in.o
modutils/built-in.o networking/built-in.o
networking/libiproute/built-in.o networking/udhcp/built-in.o
procps/built-in.o runit/built-in.o selinux/built-in.o shell/built-in.o
sysklogd/built-in.o util-linux/built-in.o -Wl,--end-group
-Wl,--start-group -lcrypt -lm -Wl,--end-group
==========
procps/lib.a(top.o): In function `top_main':
top.c:(.text.top_main+0x518): undefined reference to
`display_topmem_process_list'
top.c:(.text.top_main+0x6c8): undefined reference to `topmem_sort'
collect2: ld returned 1 exit status

This is the the 316 snapshot of buildroot. Any ideas?

thanks,
-perry
