From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Nov 2016 15:42:11 +0100
Subject: [Buildroot] [PATCH] config: bump linux kernel to 4.8.6 in
 synopsys defconfigs
In-Reply-To: <1479133987.4408.48.camel@synopsys.com>
References: <1478793207-31255-1-git-send-email-vzakhar@synopsys.com>
 <20161111151832.1649d24e@free-electrons.com>
 <1479126748.3874.28.camel@synopsys.com>
 <20161114150740.394bdd02@free-electrons.com>
 <1479133987.4408.48.camel@synopsys.com>
Message-ID: <20161114154211.66ff86bf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Nov 2016 14:34:01 +0000, Alexey Brodkin wrote:

> Obviously since we live in upstream everything that could not be applied to
> stable branches (i.e. is not a trivial fix and longer than 200 lines) get
> merged in newer kernels.
> 
> In particular following commit was not accepted in
> backports:
> 
> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=840c054fd0efb048df6fceb0c46385ec5b66dfe6
> 
> See discussion here?http://www.spinics.net/lists/stable/msg143544.html
> 
> The problem is in GCC v6.x newer ABI is used for ARCv2 and so only kernels v4.8+
> will work. I.e. existing 4.7 will fail to run user-space apps built with GCC 6.x.
> 
> Indeed we may add mentioned off-the-tree patch in BR for 4.7 but I'd rather bump
> kernel version here with which we get more fixes across the tree for our users.

Since gcc 6.x is now used for ARC if I'm correct, this means that
upgrading the defconfig to Linux 4.8 is mandatory to have them working.
So it's actually a bug fix, which means the update can be applied to
master.

Why hasn't this been explained in the commit log? The commit log is
essential in deciding to apply in master or in next. Since the commit
log was just "Let's bump to a newer kernel", I applied to the next
branch. If the commit log had been "Since gcc 6.x is now the default on
ARC, and gcc 6.x implements a newer ABI only supported by Linux 4.8
onwards, we must bump the kernel version of the ARC defconfigs in order
to have them work correctly".

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
