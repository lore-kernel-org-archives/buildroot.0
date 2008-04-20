From: Christopher Taylor <chtaylo3@gmail.com>
Date: Sun, 20 Apr 2008 01:17:34 -0400
Subject: [Buildroot] r21760 and device_table.txt problems
In-Reply-To: <20080419145815.GB12780@cloud.net.au>
References: <2590773a0804181647y4200320du60683223dd30a1d4@mail.gmail.com>
	<20080419145815.GB12780@cloud.net.au>
Message-ID: <2590773a0804192217i61a6fe1ct7801f800e3afdd39@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hamish,

Yes, that makes sense. Unfortunately, I'm not even seeing regular files.
Your response leads me to conclude that while the device nodes are not
currently present in the fs tree (for the reasons you specified), they
_will_ be created during boot.

In a desktop environment this is usually handled by devfs or udev
these days.  How is it usually done within buildroot? I don't remember
enabling devfs or udev in buildroot or the kernel, but I'll look on
Monday.  If it's a static listings like before devfs, how should I go
about creating the device nodes for my target fs ... just mknod as
root before I make an image?

Would simply running make as root fix this and create the device nodes
per the deivce_table?

Respectfully,
Chris


>  Once the build finishes the device nodes will look like regular files.
>  This is because they are created within a fakeroot session. They can't
>  be real device nodes because that would require root priviledges at
>  build-time.
>
>  Hamish
>  --
>  Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
>  _______________________________________________
