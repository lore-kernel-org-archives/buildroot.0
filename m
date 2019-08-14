From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Aug 2019 14:18:55 +0200
Subject: [Buildroot] [PATCH v2] package/devmem2: remove package
In-Reply-To: <20190814102957.23544-1-unixmania@gmail.com>
References: <20190814102957.23544-1-unixmania@gmail.com>
Message-ID: <20190814141855.307cf763@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Peter in Cc.

On Wed, 14 Aug 2019 07:29:57 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> It was here just for backwards compatibility and is not used by any
> package or board after commits
> 
>   59856480b6 packages/devmem2: remove from all board configurations
>   2f6e3eae55 package/ti-gfx: do not use devmem2 in script
> 
> There are address casting issues with 32bit access on a 64bit bus (like
> on the SoC FPGA ARM processors) with this tool. The Busybox version of
> devmem is the most up to date and supports quadword access.
> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=10171

I don't particularly care about devmem2, but it was not here just for
"backwards compatibility". It was there also for the cases where people
don't want to use Busybox, but still need a devmem implementation. I'm
not sure how much this use case is important, though.

Peter, could you take a decision on this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
