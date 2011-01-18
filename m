From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Tue, 18 Jan 2011 11:55:38 -0600
Subject: [Buildroot] Strange behaviour of inittab
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1EF91EB1@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm on drugs, sorry if this post is illegible.

The original inittab included by BuildRoot looked like this:

# Startup the system
::sysinit:/bin/mount -o remount,rw /
::sysinit:/bin/mount -t proc proc /proc
::sysinit:/bin/mkdir -p /dev/pts
::sysinit:/bin/mount -a

Anyone else have a problem with this?  On my mips, I have an NFS mounted
RFS.  With the above configuration, I cannot get the system to remount
because proc is not mounted (apparently this version of BusyBox mount
requires proc????).

The fix I have done is to reverse the mounting/remounting of proc and
the RFS as follows:

# Startup the system
::sysinit:/bin/mount -t proc proc /proc
::sysinit:/bin/mount -o remount,rw /
::sysinit:/bin/mkdir -p /dev/pts
::sysinit:/bin/mount -a


The question I have is should we change the inittab from within
BuildRoot or is there really only a problem with something in my
configuration?


Andy
