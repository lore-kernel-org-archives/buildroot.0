From: Riko Ho <antonius.riko@gmail.com>
Date: Tue, 23 May 2017 12:56:26 +0800
Subject: [Buildroot] post-build.sh
Message-ID: <2354cca7-62d1-ddce-3ac0-d17dbd6e2091@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hallo Thomas,

I read from your book :
http://elinux.org/images/2/2a/Using-buildroot-real-project.pdf
page 24,
=============
Create a post-build script in
board/<company>/<project>/post-build.sh
and tell
Buildroot to run it with the
BR2
ROOTFS
POST
BUILD
SCRIPT
.
I
This script is executed from the Buildroot main directory and
receives the target filesystem directory as argument.
I
Typically, my script does:
I
Tune the
/etc/inittab

/etc/fstab
or
/etc/securetty
files
I
Copy the contents of
board/<company>/<project>/rootfs-additions/
*into the*
*target root filesystem.*
In this directory, I put additional init scripts, configuration files
for network services, or override existing files.
=============================
Is "buildroot/output/target" = target root filesystem ?
So if I have a file "init" to be copied to buildroot/output/target,
1. I put "init" on buildroot/board/<company>/<project>/rootfs-additions
2. Inside post-build.sh, cp 
board/<company>/<project>/rootfs-additions/init buildroot/output/target/.

Please let me know if it's not right way, thanks
-- 
*

/*******/
Sent by Ubuntu LTS 16.04,
??,
Regards,
Riko Ho
/*******/

*
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170523/08eec82d/attachment.html>
