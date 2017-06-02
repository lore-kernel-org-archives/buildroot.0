From: skenton at ou.edu <skenton@ou.edu>
Date: Thu, 01 Jun 2017 22:11:10 -0500
Subject: [Buildroot] Grub2
Message-ID: <4482AAE9-D293-4E36-9675-74D5BE618A63@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A while back I tripped over a bug in Grub2 2.00 that sometimes made my 
embedded system unbootable so I've been running with the code fragment 
below in my build script. It still works with 2017.05 release FYI.

It builds just fine for me on x86_64 glibc but is not a general drop in 
because gfxterm_background and probably other commands which were built 
into the grub2 core in 2.00 are modules in 2.02 and required adjustments 
to my embedded modules list. What is the best way to upgrade versions in 
this sort of situation?

Steve Kenton

# To work around package bugs slip stream grub2
sed --in-place 's/2.00/2.02/' $buildrootdir/boot/grub2/grub2.mk
# Remove the hash file(s) to fool buildroot
rm --force $buildrootdir/boot/grub2/grub2.hash 
$buildrootdir/boot/grub2/*.patch

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170601/5597f629/attachment.html>
