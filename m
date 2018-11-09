From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Nov 2018 22:03:25 +0100
Subject: [Buildroot] [PATCH v2] toolchain: Enable Glibc for all
 little-endian ARCs with atomic ops
In-Reply-To: <20181109200949.5170-1-abrodkin@synopsys.com>
References: <20181109200949.5170-1-abrodkin@synopsys.com>
Message-ID: <20181109220325.31584b18@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  9 Nov 2018 23:09:49 +0300, Alexey Brodkin wrote:
> Initially we had a port only for ARCv2 cores but
> then with a simple change ARCompact cores got supported as well.
> 
> So we generalize from BR2_archs to BR2_arcle as we haven't tried
> to get glibc working on big-endian ARCs yet.
> 
> Also we never bothered to check avaialbility of atomic
> instructions in the core but in case of Glibc for ARC this is
> really a must, so we add this check here.
> 
> Note in case of uClibc we may have system w/o HW atomics but:
>  1. Only single-core systems are allowed
>  2. Atomic instructions are emulated via arc_usr_cmpxchg syscall
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
