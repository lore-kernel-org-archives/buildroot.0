From: <bogus@does.not.exist.com>
Date: Mon, 14 Jul 2008 13:16:20 -0000
Subject: No subject
Message-ID: <mailman.4.1219477498.1340.buildroot@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ttymxc0 device. If so, then the reason why you cannot login is that
you don't have ttymxc0 listed in /etc/securetty.

The file comes from target/generic/target_skeleton/etc, but you can
simply edit it under project_build_arm/uclibc/root/etc and rerun make
to regenerate your filesystem image.

I don't see any mention of /dev/ttymxcN in Documentation/devices.txt
in the kernel sources? I take it that the serial driver isn't in the
mainline kernel?

 > THe other thing I tried to do was pass init=/dev/sh and
 > init=/dev/bash to try to get a direct shell prompt. I don't think
 > it was connecting to the MX31's serial port because I never saw any
 > outputs after the filesystem was mounted. Is there a recommended
 > way to force /dev/sh to appear on a ttyS0 (or actually ttymxc0 for
 > the MX31)

I take it you mean /bin/sh not /dev/sh?

Strange. And you do get output from init and login with the same
filesystem if you boot without init=/bin/sh?

-- 
Bye, Peter Korsgaard
