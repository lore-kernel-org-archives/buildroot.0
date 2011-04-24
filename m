From: Charles Krinke <charles.krinke@gmail.com>
Date: Sun, 24 Apr 2011 12:25:24 -0700
Subject: [Buildroot] JFFS2 Question
Message-ID: <BANLkTi=WFMS9Uv-x6H8iHO-vDFwRvdS2hA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I seem to have gotten myself into a pickle (again) now that I have worked
out the details of mounting a buildroot generated rootfs.jffs2.

It boots on my MPC8323 target. I can "ls", "cd", "cat". But, .... when it
boots, it complains a bit

*Write of 68 bytes at 0x002fc498 failed. returned -30, retlen 67087004
Erase at 0x008a0000 failed immediately: -EROFS. Is the sector locked?*

A "df" shows it is 100% full and 13MByte in size (the entire balance of the
NOR flash) and I know that is not true.

And, after it boots, a "rm" of a file, gives me something like

# rm boa.conf
*Write error in obliterating obsoleted node at 0x000741b4: -30*

I am hoping for a spot of advice to help me research and figure out why I
seem to have a read only file system even though I did mount it with "rw" on
the kernel command line. Is this a mkfs.jffs2 issue? A kernel command line
issue? A kernel .config issue? Do I need to rotate my monitor 37 degrees
counter-clockwise to get it to work?

-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110424/fa3d8e53/attachment.html>
