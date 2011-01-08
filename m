From: Divick Kishore <divick.kishore@gmail.com>
Date: Sun, 9 Jan 2011 03:29:41 +0530
Subject: [Buildroot] Linux kernel boot stops after NFS mount
In-Reply-To: <20110108190821.59d08d47@surf>
References: <AANLkTikz=zS_a315fwc=F+iUL=j2P43bTi8CeJPuoHG3@mail.gmail.com>
	<4D286E5A.1010209@sensortherm.de>
	<AANLkTingWO1X3b7dgBqh5FVM7q9oxAtyaOHP-J0WnpS-@mail.gmail.com>
	<20110108190821.59d08d47@surf>
Message-ID: <AANLkTikt7LVDGtr9LD2-eQodYYJyvUPWN7ow=METPXW7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI Thomas,


> Is your kernel compiled with CONFIG_AEABI ?

No the CONFIG_AEABI is not set in the config for my kernel.

Ahh..this is the catch. From what I am aware, I guess, both binaries
and kernel need to be built with either ABI or EABI. Since my
toolchain is arm-none-linux-gnueabi, which reflects the fact that all
binaries in my filesystem are built with EABI.

I tried building the kernel with CONFIG_AEABI enabled and now I do see
boot messages past the previous point(see boot log below). But it
looks like there are some problems with the default inittab settings.
Should I make a separate post to discuss these issues?

==============================================================
...
...
IP-Config: Got DHCP answer from 192.168.1.1, my address is 192.168.1.8
IP-Config: Complete:
      device=eth0, addr=192.168.1.8, mask=255.255.255.0, gw=192.168.1.1,
     host=unknown00000000005b, domain=local.lan, nis-domain=(none),
     bootserver=192.168.1.1, rootserver=192.168.1.4, rootpath=
Looking up port of RPC 100003/2 on 192.168.1.4
Looking up port of RPC 100005/1 on 192.168.1.4
VFS: Mounted root (nfs filesystem).
Freeing init memory: 104K

INIT: version 2.86 booting
INIT: /etc/inittab[18]: duplicate ID field "null"
INIT: /etc/inittab[19]: duplicate ID field "null"
INIT: /etc/inittab[20]: duplicate ID field "null"
INIT: /etc/inittab[21]: duplicate ID field "null"
INIT: /etc/inittab[23]: missing id field
INIT: /etc/inittab[26]: id field too long (max 4 characters)
INIT: /etc/inittab[33]: duplicate ID field "null"
INIT: /etc/inittab[34]: duplicate ID field "null"
INIT: /etc/inittab[35]: duplicate ID field "null"
INIT: /etc/inittab[39]: missing id field
INIT: /etc/inittab[42]: shutdown: unknown action field
INIT: /etc/inittab[43]: shutdown: unknown action field
INIT: /etc/inittab[44]: shutdown: unknown action field
INIT: /etc/inittab[45]: shutdown: unknown action field

Enter runlevel:

Enter runlevel: 3
INIT: Entering runlevel: 3
tail: can't open '/var/log/messages': No such file or directory
tail: no files
tail: can't open '/var/log/messages': No such file or directory
tail: no files
tail: can't open '/var/log/messages': No such file or directory
tail: no files
tail: can't open '/var/log/messages': No such file or directory
tail: no files
tail: can't open '/var/log/messages': No such file or directory
tail: no files
tail: can't open '/var/log/messages': No such file or directory
tail: no files
tail: can't open '/var/log/messages': No such file or directory
tail: no files
tail: can't open '/var/log/messages': No such file or directory
tail: no files
tail: can't open '/var/log/messages': No such file or directory
tail: no files
INIT: Id "tty3" respawning too fast: disabled for 5 minutes
==============================================================


Thank you all for your help,
Regards,
DivKis
