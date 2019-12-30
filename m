From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2019 14:53:24 +0100
Subject: [Buildroot] [PATCH] board/qemu/sh4-r2d: fix sh4 kernel bug with
 Binutils 2.33
In-Reply-To: <20191230133640.9702-1-romain.naour@gmail.com>
References: <20191230133640.9702-1-romain.naour@gmail.com>
Message-ID: <20191230145324.4eb78299@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain,

On Mon, 30 Dec 2019 14:36:40 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> Remove the Binutils patch reverting [1] that trigger a sh4 kernel bug
> with Binutils >= 2.33.
> Add two kernel patch provided by Alan Modra [2] that fix alignment of rodata.
> 
> [1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ebd2263ba9a9124d93bbc0ece63d7e0fae89b40e
> [2] https://www.sourceware.org/ml/binutils/2019-12/msg00112.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Thanks a lot for those fixes. Have the kernel patches been submitted
upstream, and accepted?

One issue with your change is of course that now the fix only works
when building the specific qemu_sh4 defconfigs. When not using one of
those defconfigs, but simply building the regular Linux kernel for SH4,
will lead to a kernel that no longer boots.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
