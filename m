From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2011 08:58:47 +0200
Subject: [Buildroot] Building x86_64 Toolchain
In-Reply-To: <5ABE8A5E96C0364CAF2B4DC1DEB7CEAC490DDEFA@Mercury.usurf.usu.edu>
References: <5ABE8A5E96C0364CAF2B4DC1DEB7CEAC490DDEBC@Mercury.usurf.usu.edu>
	<5ABE8A5E96C0364CAF2B4DC1DEB7CEAC490DDEFA@Mercury.usurf.usu.edu>
Message-ID: <20110517085847.46aa97fc@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 May 2011 19:43:53 +0000
Jonathan Haws <Jonathan.Haws@sdl.usu.edu> wrote:

> (cd ./lib && tar -cf - *.so.*) | tar -xf - -C /home/jhaws/opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/sysroot/lib/
> tar: libpthread.so.0: no version information available (required by /lib64/librt.so.1)
> tar: libpthread.so.0: no version information available (required by /lib64/librt.so.1)
> /bin/sh: line 1: 17753 Segmentation fault      (core dumped) tar -cf - *.so.*
> tar: This does not look like a tar archive
> tar: Exiting with failure status due to previous errors

It seems like "tar" is segfaulting here, so it seems to be a problem
with the tar program of your distribution. Can you check the core dump
to see to which program it comes from ?

Can you share your Buildroot .config so that I can try to reproduce the
problem on a different distribution?

> In file included from libpthread/linuxthreads/sysdeps/pthread/errno-loc.c:23:0:
> ./libpthread/linuxthreads/sysdeps/unix/sysv/linux/x86_64/sysdep-cancel.h:20:20: fatal error: sysdep.h: No such file or directory
> compilation terminated.

I am not sure if LinuxThreads new is supposed to compile or not.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
