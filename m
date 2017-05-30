From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 May 2017 23:31:39 +0200
Subject: [Buildroot] [PATCH v2] package/xen: Backport a header include
 fix for makedev
In-Reply-To: <20170530172613.12571-1-alistair.francis@xilinx.com>
References: <20170530172613.12571-1-alistair.francis@xilinx.com>
Message-ID: <20170530233139.22835773@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 May 2017 10:26:13 -0700, Alistair Francis wrote:
> maekdev() is avaliable from sys/types.h but only due to a bug in glibc. This
> is being fixed by printing an error when using makedev() from sys/types.h.
> To fix the issue we should innclude sys/sysmacros.h for makedev(). As this
> has already been fixed in upstream Xen we can backport the patch.
> 
> Fixes:
>     http://autobuild.buildroot.net/results/552/552e66d764885341b2fe208a0e4382b5fe05ea9d/
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>

Applied to master after fixing the typos in the commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
