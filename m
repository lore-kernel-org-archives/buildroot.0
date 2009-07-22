From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2009 23:24:15 +0200
Subject: [Buildroot] [git commit] linux26: do not set CFLAGS_KERNEL to
 TARGET_CFLAGS
In-Reply-To: <20090722204437.752507781D@busybox.osuosl.org>
References: <20090722204437.752507781D@busybox.osuosl.org>
Message-ID: <20090722232415.1a437f3a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 22 Jul 2009 22:43:51 +0200,
Peter Korsgaard <jacmet@sunsite.dk> a ?crit :

> Using TARGET_CFLAGS breaks the kernel build for the arm platform. The
> result is a kernel that can not be booted. So simply do not fiddle
> with the CFLAGS on a kernel build and the kernel build system will do
> the right thing (TM).

I'm not using Buildroot to build kernels, so I'm not sure, but I think
that this commit might break the kernel build with external toolchain.
With external toolchain, the --sysroot option must be passed to allow
gcc to find the headers and libraries. And the --sysroot option is
precisely inside $(TARGET_CFLAGS).

But:
 1. I'm not sure it actually breaks the build, it's a pure supposition
    that will have to be verified ;
 2. We can add the necessary code in the kernel specific Makefile to
    handle that particular situation.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
