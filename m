From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sat, 26 Jan 2013 18:57:28 +0100
Subject: [Buildroot] rebuilding a project on older commits
Message-ID: <51041908.1030803@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

is there a simple way to rebuild a project without the whole
crosscompiler part?

I have to search in my project why now the current output of Buildroot
isn't startable via nfs. So I want to go back and try out which commit
breaks the build, like I can do similar with git bisect in other Git
repos. Probably the busybox here is miss configured in the between time
because the current kernel config, which has also some little changes
works with an older rootfs.tar.

The current kernel with an actual rootfs ended up with
> [   10.890000] Looking up port of RPC 100003/3 on 192.168.136.4
> [   10.910000] Looking up port of RPC 100005/3 on 192.168.136.4
> [   10.920000] VFS: Mounted root (nfs filesystem) on device 0:12.
> [   10.930000] Freeing init memory: 104K
> [   10.940000] Kernel panic - not syncing: No init found.  Try passing init= option to kernel. See Linux Documentation/init.txt for guidance.

But after make <myproject>defconfig the complete crosscompiler is
rebuilded which I don't want to do because I don't have change something
on it. How to handle that?

Thanks and regards
Carsten
