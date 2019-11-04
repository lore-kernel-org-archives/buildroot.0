From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 23:06:05 +0100
Subject: [Buildroot] [PATCH] package/binutils/arc-2019.09-eng002: fix
 glibc build with -fPIE
In-Reply-To: <20191031134702.19680-1-Evgeniy.Didin@synopsys.com>
References: <20191031134702.19680-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20191104230605.5255b3fe@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 31 Oct 2019 16:47:02 +0300
Evgeniy Didin <Evgeniy.Didin@synopsys.com> wrote:

> In Binutils rev arc-2019.09-eng002 there is a commit 182352753240
> ("[ARC] Check UNDEFWEAK_NO_DYNAMIC_RELOC") which caused glibc
> build error  in case of BR2_PIC_PIE=y.
> This commit adds reverting this commit patch to
> package/binutils/arc-2019.09-eng002
> 
> These binutils changes will be a part of the next -eng00x or RCx
> ARC toolchain but now we are making this commit to get known issue fixed.
> 
> Fixes:
> 	http://autobuild.buildroot.net/results/4bc/4bca850dbf966687bf85c2c23465be0da47b7997//
> 
> Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> Cc: Claudiu Zissulescu <claziss@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com
> ---
>  ...vert-ARC-Check-UNDEFWEAK_NO_DYNAMIC_RELOC.patch | 244 +++++++++++++++++++++
>  1 file changed, 244 insertions(+)
>  create mode 100644 package/binutils/arc-2019.09-eng002/0002-Revert-ARC-Check-UNDEFWEAK_NO_DYNAMIC_RELOC.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
