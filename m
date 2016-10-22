From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 23:18:27 +0200
Subject: [Buildroot] [PATCH 2/2] xen: Remove TARGET_CONFIGURE_OPTS from
 make
In-Reply-To: <1473799504-20372-2-git-send-email-alistair.francis@xilinx.com>
References: <1473799504-20372-1-git-send-email-alistair.francis@xilinx.com>
 <1473799504-20372-2-git-send-email-alistair.francis@xilinx.com>
Message-ID: <20161022231827.44cc8d96@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Sep 2016 13:45:04 -0700, Alistair Francis wrote:
> The TARGET_CONFIGURE_OPTS variable resulted in a double definition
> error:
> <command-line>:0:0: error: "__OBJECT_FILE__" redefined [-Werror]
> 
> Remove the options to avoid the error.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>

Yann told me that you found the root cause of the problem during a
short investigation session at ELCE.

Could you share what the conclusion was? When do you expect to submit a
patch?

In the mean time, I've marked
https://patchwork.ozlabs.org/patch/669641/ as Rejected, since this is
clearly not the proper fix for the problem.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
