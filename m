From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jan 2013 09:30:35 +0100
Subject: [Buildroot] rebuilding a project on older commits
In-Reply-To: <51041908.1030803@googlemail.com>
References: <51041908.1030803@googlemail.com>
Message-ID: <20130127093035.5537b93f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carsten Schoenert,

On Sat, 26 Jan 2013 18:57:28 +0100, Carsten Schoenert wrote:

> is there a simple way to rebuild a project without the whole
> crosscompiler part?

The easiest way is to use an external toolchain. This way, your
toolchain is never rebuilt, but directly used pre-compiled.

> I have to search in my project why now the current output of Buildroot
> isn't startable via nfs. So I want to go back and try out which commit
> breaks the build, like I can do similar with git bisect in other Git
> repos. Probably the busybox here is miss configured in the between
> time because the current kernel config, which has also some little
> changes works with an older rootfs.tar.
> 
> The current kernel with an actual rootfs ended up with
> > [   10.890000] Looking up port of RPC 100003/3 on 192.168.136.4
> > [   10.910000] Looking up port of RPC 100005/3 on 192.168.136.4
> > [   10.920000] VFS: Mounted root (nfs filesystem) on device 0:12.
> > [   10.930000] Freeing init memory: 104K
> > [   10.940000] Kernel panic - not syncing: No init found.  Try
> > passing init= option to kernel. See Linux Documentation/init.txt
> > for guidance.

Does Busybox has the init applet enabled? Is /sbin/init a symbolic link
to /bin/busybox? Are the shared library loader and the C library both
available in /lib in your root filesystem?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
