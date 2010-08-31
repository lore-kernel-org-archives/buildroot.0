From: mohammed dahdouh <meodou@hotmail.com>
Date: Tue, 31 Aug 2010 01:04:55 +0000
Subject: [Buildroot] No compiler is embedded to the file system.
Message-ID: <BLU118-W21A6465BFFC320F704EC54D68A0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all,
It s the first time I use buildroot. I m trying to use to build a toolchain for an sh4 target and using bionic (android libc).
I started with testing with sh4 cross compile toolchain using uclibc, I have followed the documentation  but in the generated file system there is no compiler (I cannot find a gcc, cc.. binaries ):
Here a listing of the target file system (same is the generated image after mounting)
"
ls output/target/usr/*

output/target/usr/bin:
[         bzcat    cut        eject       free     ipcrm     less     nohup     readlink     setsid     tee     traceroute  uudecode  whoami
[[        chrt     dc         env         fuser    ipcs      logger   nslookup  realpath     sha1sum    telnet  tty         uuencode  xargs
ar        chvt     deallocvt  ether-wake  head     killall   logname  od        renice       sha256sum  test    uniq        vlock     yes
arping    cksum    diff       expr        hexdump  killall5  lzmacat  openvt    reset        sha512sum  tftp    unix2dos    wc
awk       clear    dirname    fdformat    hostid   last      md5sum   passwd    resize       sort       time    unlzma      wget
basename  cmp      dos2unix   find        id       ldd       mesg     patch     seq          strings    top     unzip       which
bunzip2   crontab  du         fold        install  length    mkfifo   printf    setkeycodes  tail       tr      uptime      who

output/target/usr/lib:

output/target/usr/sbin:
chroot  crond  dnsd  inetd  loadfont  rdate  readprofile  setlogcons

output/target/usr/share:
udhcpc
"
I tested also running without modifying any thing in the make menuconfig (i386) but no way, the file system doesnt contain any compiler.
Am I missing something in the make menuconfig? I m sure to choose : Toolchain -> Toolchain type (Buildroot toolchain)-> Buildroot toolchain, then running a make, when it finished without errors but no c compiler is found.
Best Regards,
Mohammed

 		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100831/ce4b0d37/attachment.html>
