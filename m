From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Thu, 30 Dec 2010 14:40:34 -0600
Subject: [Buildroot] inittab -- mount -o remount,rw / fails
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1EAEC036@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In inittab, the lines:

# Startup the system
null::sysinit:/bin/mount -o remount,rw /
null::sysinit:/bin/mount -t proc proc /proc

are supposed to remount the filesystem read-write enabled.  In my case
(mounting root via NFS) I don't get an error on console, but I do not
remount /.  So, what happens next is all the first boot stuff (making
the RSA keys, etc) fails.  My fix for this was to mount proc first.

Should mount be able to remount / without proc being mounted? 

If not, perhaps we should change fs/skeleton/etc/inittab to reflect the
below.

# Startup the system
null::sysinit:/bin/mount -t proc proc /proc
null::sysinit:/bin/mount -o remount,rw /


Cheers,
Andy
