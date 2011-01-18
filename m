From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Tue, 18 Jan 2011 18:05:20 +0000
Subject: [Buildroot] Strange behaviour of inittab
In-Reply-To: <9AC3F0E75060224C8BBC5BA2DDC8853A1EF91EB1@EXV1.corp.adtran.com>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1EF91EB1@EXV1.corp.adtran.com>
Message-ID: <1295373920.16414.126.camel@worky>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2011-01-18 at 11:55 -0600, ANDY KENNEDY wrote:
> I'm on drugs, sorry if this post is illegible.
> 
> The original inittab included by BuildRoot looked like this:
> 
> # Startup the system
> ::sysinit:/bin/mount -o remount,rw /
> ::sysinit:/bin/mount -t proc proc /proc
> ::sysinit:/bin/mkdir -p /dev/pts
> ::sysinit:/bin/mount -a
> 
> Anyone else have a problem with this?  On my mips, I have an NFS mounted
> RFS.  With the above configuration, I cannot get the system to remount
> because proc is not mounted (apparently this version of BusyBox mount
> requires proc????).

All the busybox versions I've used required /proc to be mounted. In
particular /proc/filesystem which is parsed by busybox to guess the
available filesystems supported by the kernel when mounting with "-t
auto".

> 
> The fix I have done is to reverse the mounting/remounting of proc and
> the RFS as follows:
> 
> # Startup the system
> ::sysinit:/bin/mount -t proc proc /proc
> ::sysinit:/bin/mount -o remount,rw /
> ::sysinit:/bin/mkdir -p /dev/pts
> ::sysinit:/bin/mount -a
> 
> 
> The question I have is should we change the inittab from within
> BuildRoot or is there really only a problem with something in my
> configuration?
> 
> 
> Andy
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
