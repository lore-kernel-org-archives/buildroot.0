From: Jigar SOLANKI <jigar.solanki@labri.fr>
Date: Wed, 11 Jan 2012 12:46:51 +0100
Subject: [Buildroot] Cant type anything into Serial Console login
Message-ID: <4F0D76AB.7000508@labri.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all and happy new year :-)

I'm trying to build a Linux Environment using buildroot on a Leon3
architecture.

I've managed to compile and successfully run the Linux image with
initramfs.
At boot prompt, welcomme tobuildroot, buildroot login, I can't type
anything in there. The serial console client (I've tried Kermit,
Minicom, GTKTerm) just hangs, my keyboard is useless at that time.

For what I have googled, I already checked the following :

1- the kernel command line (console=/dev/ttyS0,115200)

2- and also checked in target options->generic serial config->put a
getty on ttyS0, 115200.

3- I checked the inittab :

# Set up a couple of getty's
tty1::respawn:/sbin/getty 115200 tty1
tty2::respawn:/sbin/getty 115200 tty2

# Put a getty on the serial port
ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL


4- and I checked the /etc/securetty file too (ttyS0 is there).

What am I missing here?


-- 
Jigar SOLANKI

LaBRI - UMR 5800
Universit? Bordeaux 1
351 Cours de la Lib?ration
F-33405 Talence Cedex
Phone : (+33) 5 4000 24 87
Fax   : (+33) 5 4000 66 69
Web   : http://www.labri.fr/perso/solanki

* Please do not print this e-mail unless it's really necessary *
---


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 554 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120111/0b1a6022/attachment-0001.asc>
