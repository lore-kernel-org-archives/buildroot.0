From: Ezequiel Garcia <ezequiel@collabora.com>
Date: Sat, 15 Dec 2018 09:45:33 -0300
Subject: [Buildroot] [PATCH] ci20: Fix U-Boot build with codesourcery
 toolchain
In-Reply-To: <20181215131434.212e1a95@windsurf.home>
References: <20181112181928.26634-1-ezequiel@collabora.com>
 <20181215131434.212e1a95@windsurf.home>
Message-ID: <33885b674cf1241c24d93e0bc6129f55c05577fd.camel@collabora.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2018-12-15 at 13:14 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 12 Nov 2018 15:19:28 -0300, Ezequiel Garcia wrote:
> > Currently, U-Boot is failing to build, due to some issues
> > with the toolchain and the U-Boot port.
> > 
> > Fix it.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> 
> The issue I see with this fix is that it only fixes the problem for
> that particular defconfig. Anyone else trying to build U-Boot with this
> toolchain for MIPS will hit the same issue.
> 

This issue appears because the U-Boot used on this board is ancient.

So, only boards with ancient U-Boot will be affected. The right
fix would be to either update U-Boot, or move to mainline.

BTW, I'm working on upstreaming the U-Boot port for this board.

Thanks,
Eze
