From: anders at acorn.pw <anders@acorn.pw>
Date: Fri, 29 Jul 2016 16:58:43 -0500
Subject: [Buildroot] Best way to have /var on a separate fs?
Message-ID: <64AD5204-D274-4F91-B15D-F3E5F90B5B32@acorn.pw>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

Many thanks for this great project.

I'm new to buildroot and working on a build for x86 (PC). My root fs is a readonly squashfs, but I need /var to be writable, so I'm thinking of putting it on a separate partition.

My best idea for how to do this is via a post-build script that first makes an image of the contents of ./output/target/var and then removes everything from there so that /var ends up empty in the rootfs image.

But since having /usr, /var, /tmp, etc in their own partitions is a very common setup I thought I'd ask whether there's already some other "best practice" for doing this in the buildroot world.

Any advice is appreciated!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160729/b763321f/attachment.html>
