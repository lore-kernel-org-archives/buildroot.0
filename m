From: Jean-Claude Gervais <jc.gervais@videotron.ca>
Date: Fri, 23 Nov 2007 14:11:49 -0500
Subject: [Buildroot] arm build failing - 'fakeroot: preload library
	not	found'
In-Reply-To: <1195762733.20822.11.camel@mercury.sprymusic>
References: <1195762733.20822.11.camel@mercury.sprymusic>
Message-ID: <1195845109.5376.11.camel@mercury.sprymusic>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2007-11-22 at 15:18 -0500, Jean-Claude Gervais wrote:
> I am getting a build error:
> 
> >> buildroot/project_build_arm/uclibc/_fakeroot.rootfs.arm.jffs2
> chmod a
> +x buildroot/project_build_arm/uclibc/_fakeroot.rootfs.arm.jffs2
> buildroot/build_arm/staging_dir/usr/bin/fakeroot -- buildroot/project_build_arm/uclibc/_fakeroot.rootfs.arm.jffs2
> <stdin>:1097:2: warning: #warning syscall fadvise64 not implemented
> <stdin>:1265:2: warning: #warning syscall migrate_pages not implemented
> <stdin>:1321:2: warning: #warning syscall pselect6 not implemented
> <stdin>:1325:2: warning: #warning syscall ppoll not implemented
> <stdin>:1365:2: warning: #warning syscall epoll_pwait not implemented
> <stdin>:1385:2: warning: #warning syscall fallocate not implemented
> <stdin>:1097:2: warning: #warning syscall fadvise64 not implemented
> <stdin>:1265:2: warning: #warning syscall migrate_pages not implemented
> <stdin>:1321:2: warning: #warning syscall pselect6 not implemented
> <stdin>:1325:2: warning: #warning syscall ppoll not implemented
> <stdin>:1365:2: warning: #warning syscall epoll_pwait not implemented
> <stdin>:1385:2: warning: #warning syscall fallocate not implemented
> <stdin>:1097:2: warning: #warning syscall fadvise64 not implemented
> <stdin>:1265:2: warning: #warning syscall migrate_pages not implemented
> <stdin>:1321:2: warning: #warning syscall pselect6 not implemented
> <stdin>:1325:2: warning: #warning syscall ppoll not implemented
> <stdin>:1365:2: warning: #warning syscall epoll_pwait not implemented
> <stdin>:1385:2: warning: #warning syscall fallocate not implemented
> compr_lzo.c: In function 'jffs2_lzo_cmpr':
> compr_lzo.c:54: warning: passing argument 4 of 'lzo1x_999_compress' from
> incompatible pointer type
> compr_lzo.c: In function 'jffs2_lzo_decompress':
> compr_lzo.c:74: warning: passing argument 4 of 'lzo1x_decompress_safe'
> from incompatible pointer type
> fakeroot: preload library not found, aborting.
> make: ***
> [buildroot/binaries/uclibc/rootfs.arm.jffs2] Error 1
> 
> What does the error message mean?
> Which library is it looking for?

Finally, I discovered that buildroot needs the host to have fakeroot
installed.

I'm afraid I don't understand why that is: In my project configuration,
I do NOT have 'mark all files as owned by root' selected, so I assume
that fakeroot is not necessary in such a case. I may be wrong. Can
anyone clarify?

In any case, installing fakeroot (v1.8.1) didn't solve the problem, I am
now getting a different error message:

buildroot/build_arm/staging_dir/usr/bin/fakeroot: line  131:
buildroot/build_arm/staging_dir/usr/bin/faked: No such file or directory
fakeroot: error while starting the `faked' daemon.

Yet, the file ('faked') in question does exist:

-rwxr-xr-x 1 jg jg 42984 Nov 20 12:50
 build_arm/staging_dir/usr/bin/faked

Thank you for any help.
J
