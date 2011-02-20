From: =?UTF-8?Q?Zden=C4=9Bk_Materna?= <zdenek.materna@gmail.com>
Date: Sun, 20 Feb 2011 14:03:15 +0100
Subject: [Buildroot] nfs-utils build failed
Message-ID: <AANLkTi=HTAaDcQJJW1e+A_RPHEdgQX=4sA7Lw3nh7bcn@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm back with another problem which I can't solve. I'm using buildroot from
git, uclibc 0.9.31 and there is some problem with building nfs-utils (build
log at bottom). If I understand it right rpcgen is used to generate mount.h.
But rpcgen is compiled for target and can't be run on host. Then it's little
bit strange that mount.h missing error is produced before "rpcgen: cannot
execute binary file" error.

Can anybody explain it for me? I'm quite confused with it. And any tips what
to do to compile nfs-utils?

Thanks a lot!

Regards,
Zdenek Materna

....
In file included from auth.c:20:0:
mountd.h:16:19: fatal error: mount.h: No such file or directory
compilation terminated.
make[3]: *** [mountd-auth.o] Error 1
make[3]: *** Waiting for unfinished jobs....
In file included from mount_dispatch.c:15:0:
mountd.h:16:19: fatal error: mount.h: No such file or directory
compilation terminated.
make[3]: *** [mountd-mount_dispatch.o] Error 1
In file included from mountd.c:27:0:
mountd.h:16:19: fatal error: mount.h: No such file or directory
compilation terminated.
make[3]: *** [mountd-mountd.o] Error 1
......
showmount.c:35:19: fatal error: mount.h: No such file or directory
compilation terminated.
make[3]: *** [showmount-showmount.o] Error 1
.......
/bin/bash: ../../tools/rpcgen/rpcgen: cannot execute binary file
make[3]: *** [sm_inter_xdr.c] Error 126
make[3]: *** Waiting for unfinished jobs....
/bin/bash: ../../tools/rpcgen/rpcgen: cannot execute binary file
/bin/bash: ../../tools/rpcgen/rpcgen: cannot execute binary file
make[3]: *** [sm_inter_clnt.c] Error 126
make[3]: *** [sm_inter_svc.c] Error 126
.......
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110220/96228256/attachment.html>
