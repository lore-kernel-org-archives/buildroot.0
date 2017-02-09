From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 22:14:44 +0100
Subject: [Buildroot] [PATCH] util-linux: link scriptreplay with libm
 (for isnan)
In-Reply-To: <1486567063-21852-1-git-send-email-casantos@datacom.ind.br>
References: <1486567063-21852-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20170209221444.3c4674a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Feb 2017 13:17:43 -0200, Carlos Santos wrote:
> - Cherry-pick a patch from upstream to link scriptreplay to libm (for
>   "isnam").
> - Add a patch that improves the detection of isnan when using uClibc.
>   This patch is for util-linux v2.29.1 and must be adapted to their
>   master branch to be submitted upstream.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/2c2/2c29a78ed81ca844a87dcd076ab3e14ea080296d
>   http://autobuild.buildroot.net/results/404/404b10f359b2ae8a7216729fa1bab37fed2d3d4c
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  ...-sys-use-lm-for-scriptreplay-if-necessary.patch | 32 +++++++++++++++++++
>  ...mprove-detection-of-the-isnan-function-in.patch | 37 ++++++++++++++++++++++
>  2 files changed, 69 insertions(+)
>  create mode 100644 package/util-linux/0001-build-sys-use-lm-for-scriptreplay-if-necessary.patch
>  create mode 100644 package/util-linux/0002-build-sys-improve-detection-of-the-isnan-function-in.patch

Applied to master, thanks. To be honest I'm not sure PATCH 2/2 is the
most correct solution, but it's good enough. Could you submit it
upstream?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
