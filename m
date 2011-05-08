From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 May 2011 19:04:00 +0200
Subject: [Buildroot] [PATCH] external toolchain: add arbitrary arguments
 to sysroot discovery and toolchain wrapper
In-Reply-To: <4DC46EC4.2060000@rossvideo.com>
References: <4DC46EC4.2060000@rossvideo.com>
Message-ID: <20110508190400.43407143@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mathias,

On Fri, 06 May 2011 17:57:24 -0400
Matias Garcia <mgarcia@rossvideo.com> wrote:

> CodeSourcery uses non-standard arguments to determine which sysroot
> to use and to set other optimizations (e.g. which floating point ABI
> to use). This patch allows one to pass an arbitrary argument to the
> sysroot discovery in ext-tool.mk and adds the same option to the
> argument list in ext-toolchain-wrapper.c. I have not tested it with
> an empty option. Use at your own risk as this is my first open-source
> patch ever... (Am I supposed to write 'signed-off by...'?)

While the goal is correct, I don't like this implementation. The
toolchain wrapper should just make use of the flags in
BR2_TARGET_OPTIMIZATION configuration option, and not only -march,
-mtune, -mabi, etc. options which are currently being used.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
