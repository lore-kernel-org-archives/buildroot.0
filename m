From: Rolf Blindheim <rolf@elektronix.no>
Date: Tue, 21 Aug 2007 15:46:09 +0200
Subject: [Buildroot] Can't access tty; job control turned off.
Message-ID: <200708211546.13079.rolf@elektronix.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.
Not sure if this is the proper place to ask, but I'm getting nowhere with 
other forums, goggle, etc..
I've created a toolchain from todays buildroot-snapshot, leaving all the 
default settings just to make sure I'm not screwing up something. The image 
builds fine. I'm booting with a custom linux-2.6.21.5 kernel, which seems to 
work as expected too.
The image is supposed to work on an embedded device, running the AMD Geode x86 
CPU. The boot is working as intended, with switch_root and tmpfs, etc, but 
when init is initializing the problem is that I get no login prompt. sysinit 
can't pull /sbin/getty on /dev/tty1 with the default inittab which comes with 
buildroot/busybox. 
after adding ::sysinit:/bin/ash in /etc/inittab, I get a shell running 
on /dev/console, but along comes:

/bin/ash: can't access tty; job control turned off

I've read every post I can imagine on the subject, but there is something here 
I just don't get.
I'd really appreciate any hints, preferable solutions ;) on this.. I'm so 
stuck with this, and my time is running out soon..
All device nodes are created properly in /dev from /sys.
Please let me know if I've forget to include some information.


-- 
Rolf Blindheim
<rolf@elektronix.no>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070821/044db1db/attachment.pgp 
