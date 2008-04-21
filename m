From: John Voltz <john.voltz@gmail.com>
Date: Mon, 21 Apr 2008 14:45:40 -0400
Subject: [Buildroot] Linking on x86
Message-ID: <46a136670804211145h7a05e2e0n4cfffaa36fb0b02f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've been working on an x86 filesystem in buildroot, and I'm having some
issues with linking. Some packages, gtk in particular, are linking against
the host libraries. When I attempt to run anything gtk based on the target,
it complains that it can't find libc.so.6, libm.so.6, libdl.so.2, etc. If I
create the links, then I get "could not resolve __lxstat64 in
libgtk-x11.so.2" (obviously, it got linked against the glibc on the host)

What I would like to know is, is there an easy way to prevent the linker
from being able to see /lib and /usr/lib when it is linking? Maybe a patch
to binutils or something?

Thanks,

John Voltz
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080421/74a32a42/attachment.htm 
