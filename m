From: Daniel Mack <daniel@caiaq.de>
Date: Sun, 7 Jun 2009 20:48:43 +0200
Subject: [Buildroot] /dev nodes files
Message-ID: <20090607184843.GK26148@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This has been discussed before, but I don't know if there was any
result, so I'm asking again.

After each build, the ixnodes in project_build_arm/uclibc/root/dev are
regular files rather than inodes, which prevents users from exporting
that directory directly as NFS root. Most people run custom scripts to
fix that, but I wonder whether there is any change to get that fixed in
BR2 directly.

The problem is that mknod can't create the nodes when not run as root,
and fakeroot doesn't help much in this case. Would it be an option to

 a) move the invocation of makedevs from target/*/*mk to some higher
    level. Actually, all fs deployment targets do the same thing, and
    that could be simplified.
 b) Let users choose whether to use 'fakeroot' or 'sudo' to create the
    inodes. The latter would need some augmented system priviledges, but
    as an option, that shouldn't harm.

Any oppinion about such an approach?

Daniel
