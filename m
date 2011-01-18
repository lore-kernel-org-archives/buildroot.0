From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Tue, 18 Jan 2011 12:26:00 -0600
Subject: [Buildroot] Strange behaviour of inittab
In-Reply-To: <1295373920.16414.126.camel@worky>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1EF91EB1@EXV1.corp.adtran.com>
	<1295373920.16414.126.camel@worky>
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1EF91EF4@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

inittab ordering causes mount to fail on remount,rw.  inittab
changed to mount /proc first.

Signed-off-by:  Andy Kennedy <Andy.Kennedy@AdTran.com>
---
--- a/fs/skeleton/etc/inittab   2011-01-06 05:25:33.000000000 -0600
+++ b/fs/skeleton/etc/inittab   2011-01-18 12:16:18.000000000 -0600
@@ -14,8 +14,8 @@
 # process   == program to run
 
 # Startup the system
-null::sysinit:/bin/mount -o remount,rw /
 null::sysinit:/bin/mount -t proc proc /proc
+null::sysinit:/bin/mount -o remount,rw /
 null::sysinit:/bin/mkdir -p /dev/pts
 null::sysinit:/bin/mount -a
 null::sysinit:/bin/hostname -F /etc/hostname
