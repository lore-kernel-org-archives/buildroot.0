From: John Schimandle <john_schimandle@hotmail.com>
Date: Fri, 17 Oct 2008 17:07:51 -0700
Subject: [Buildroot] Atmel file system skeleton missing /sys directory
Message-ID: <COL0-DAV4103F240DBC50EEFAE20318D2D0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm still working through my issues with programming on the at91sam9263ek
board and discovered a bug in the Atmel root file system skeleton directory.
The  root file system was missing the /sys directory and that caused sysfs
to not mount at boot time. I manually added the sys directory to
target/device/Atmel/root/target_skeleton. removed the
target_build_arm/at91sam9263ek/.root file, rebuilt buildroot and that fixed
the problem.
 
I would like to propogate the patch into the buildroot system but I don't
know the appropriate place to fix the problem.
 
Any help would be appreciated. Just trying to fix things so other people
don't run into the same problem.
 
Regards,
 
John
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081017/7ffa0f06/attachment.htm 
