From: Giovanni Balestrieri <balestrieri.gepp@gmail.com>
Date: Mon, 21 Jul 2014 19:03:04 +0200
Subject: [Buildroot]  Raspberry Pi Compilation Error
Message-ID: <CALRX=SHNnea4sVXWa7W_4yYNa47n9HUKs9xBJwEce_=xpBXRqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

<http://unix.stackexchange.com/questions/145737/busybox-compilation-fails-networking-nslookup-c-error#>

I'm trying to compile Busybox with Buildroot Cross-Compiler.

Here are the steps:

   -

   Download Busybox and untar it

   *wget http://www.busybox.net/downloads/busybox-1.22.1.tar.bz2
   <http://www.busybox.net/downloads/busybox-1.22.1.tar.bz2> && tar xjf
   busybox-1.22.1.tar.bz2*
   -

   Configure BusyBox and compile

   *make menuconfig*

   *make CROSS_COMPILE=/usr/local/cross-rpi/usr/bin/arm-linux-*

(The path to the Cross-Compiler is correct)

The compilation returns the following error:

CC      networking/nslookup.o
networking/nslookup.c: In function ?server_print?:
networking/nslookup.c:123:37: error: ?struct <anonymous>? has no
member named ?nsaddrs?
networking/nslookup.c: In function ?set_default_dns?:
networking/nslookup.c:163:15: error: ?struct <anonymous>? has no
member named ?nsaddrs?
make[1]: *** [networking/nslookup.o] Error 1
make: *** [networking] Error 2

If I don't use the Cross-Compiler everything builds fine.

Do you have any advice?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140721/f2c1d2c6/attachment.html>
