From: Diego Iastrubni <diegoiast@gmail.com>
Date: Tue, 17 May 2011 16:19:36 +0300
Subject: [Buildroot] Slow boots caused by
	ca520507fc15a8213334a76339a3e6d567e91ea0 (udev, inittab)
Message-ID: <BANLkTi=cikrdVk_mikRhpLYZtgDarZCukw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am seeing that my boot is now ~60 seconds, and hte boots hangs ~40 secs
while starting udev.

This is caused by ca520507fc15a8213334a76339a3e6d567e91ea0 which claims that
/sys/ and friends are moutned by inittab. I found no such code in the
ininttab installed is my unit,  and the inittab available in the head
(59af9a8..ce1ae87)  in fs/skeleton/etc/inittab does not mount /sys/ at boot
time. Reverting the inittab to the one before this change fixes the boot
time.

What am I missing?

I am using busybox's init, code sourcry ARM toolkit, and bootinsg from NFS
into an OMAP3.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110517/ed29e5de/attachment.html>
