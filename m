From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Nov 2008 09:31:10 +0100
Subject: [Buildroot] External toolchain support improvements
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909C2916F@mi8nycmail19.Mi8.com>
References: <20081030094501.66983ff9@surf>
	<BD79186B4FD85F4B8E60E381CAEE1909C2916F@mi8nycmail19.Mi8.com>
Message-ID: <20081103093110.13e43438@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 31 Oct 2008 14:42:14 -0400,
"hartleys" <hartleys@visionengravers.com> a ?crit :

> What are the side effects if you use an external toolchain that was
> built with a given kernel version, say 2.6.20.4, but use a newer
> kernel, say 2.6.27.3?

The kernel <-> userspace interface is backward compatible. So if you
use a toolchain that was compiled against the headers of kernel
2.6.20.4 and run the binaries under 2.6.27.3, them it will work
perfectly fine. The only thing is that you won't be able to use the new
system calls, data structures, headers, defines, that have been added
in the kernel between 2.6.20.4 and 2.6.27.3.

The reverse side: if you generate binaries with a toolchain that has
been compiled against the headers of kernel 2.6.27.3 and run it on a
2.6.20.4 kernel, then there are two cases :

 * You don't use any of the new features of the kernel <-> userspace
   interface added between 2.6.20.4 and 2.6.27.3 : everything will work
   correctly ;

 * You use one of these new features: your binary might fail to run
   properly (for example if they use a new system call, that isn't
   available in your kernel).

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
