From: Brad House <brad@mainstreetsoftworks.com>
Date: Mon, 06 Aug 2007 20:35:45 -0400
Subject: [Buildroot] [patch] udev broken, update and fix
Message-ID: <46B7BE61.5060107@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

/etc/udev/rules.d/ is empty with the current udev.  It should be
populated by default with one of the examples provided with udev.
Also, /dev/pts should be mounted by default from the udev (S10udev)
start script, otherwise 'dropbear' won't allow logins as it requires
/dev/pts...  (and this shouldn't be done automatically in fstab since
udev creates a tmpfs which would mount over it).

Also, udev_root isn't configured by default in /etc/udev/udev.conf as
the start script requires.

I've attached a patch which fixes those and goes ahead and bumps the
version to 114 (from 101).  Also, you can remove the
'udev-install.patch', as I've modified the makefile to do the same
thing...

-Brad
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: udev-114.patch
Url: http://busybox.net/lists/buildroot/attachments/20070806/bbc9d7b2/attachment.diff 
