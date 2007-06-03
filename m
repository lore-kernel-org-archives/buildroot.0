From: Gernot Kvas <gernot@kvas.at>
Date: Sun, 03 Jun 2007 22:00:47 +0200
Subject: [Buildroot] udev/grep problems
Message-ID: <1180900847.6330.10.camel@eve>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Prerequisities:

I've been setting up a system (arm926) with an older version of
buildroot, ca. December 2006. However I changed the respective packages
(udev/grep) to version as of yesterday, just to be sure.

Problem:

1.) No grep - udev complains

udev seems to complain about missing grep. I checked, and for sure, I do
have egrep and fgrep, but no "grep". I selected it as an indivdual
package. The package grep compiles, but it seems the binaries dont get
copied to root. Strange. I then selected it as busybox binaries and
again, no grep. What am I missing?

2.) udev_root not set and defaults to empty string

udev trouble continues, as it seems that out of the box, $udev_root is
set to "". The man page states it defaults to "/dev", which is fine,
however I have to add it explicitly ("udev_root=/dev") to udev.conf in
the root file system. Is this supposed to happen that way or is the
package missing that entries in the config file?

udev works with me manually copying egrep to grep and editing the
udev.conf file on the target. Shouldnt that be automated? Or don't I see
the bigger picture?

Cheers,

Gernot
