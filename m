From: Andrew Wiley <debio264@gmail.com>
Date: Sat, 16 Jan 2010 01:37:07 -0600
Subject: [Buildroot] Firmware Loading
Message-ID: <ecbbfeda1001152337n477893fcubb861dc425d9d704@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Okay, I'm back getting a more up to date setup working on my Cirrus Labs
EP9302, and things are mostly going well. Buildroot got me a working
filesystem the first time, and after some fun with kernels that were too
large for the flash partition I had set aside, the thing boots by itself.
Now I'm trying to get my USB wireless adapter to work. It's a ZyDas chipset
and uses the zd1211rw driver, which loads successfully, but fails to load
firmware. The firmware is in /lib/firmware (the driver requests
zd1211/zd1211_*, so it's actually in a subdirectory of /lib/firmware), but
when I try to do "ifconfig wlan0 up", I get a kernel message stating that
the firmware has been requested, a long wait, and an error -2 that the
loading the firmware failed.
I'm guessing this is user error, and from reading the lists, it looks like
mdev is supposed to do firmware loading, but echoing "/sbin/mdev" to
"/proc/sys/hotplug" (that second path is probably wrong; it was right when I
actually did the command) had no noticeable effect. What do I need to change
from the default configuration to get firmware loading to work? I've
verified that userspace firmware loading is enabled in my kernel.

Andrew Wiley
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100116/ade40cb4/attachment.htm>
