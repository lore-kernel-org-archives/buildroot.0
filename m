From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 16:44:58 +0200
Subject: [Buildroot] [PATCH v7 02/13] gpu-viv-bin-mx6q: fix compiling
 issues with EGL_API_FB
In-Reply-To: <1430406748-8493-3-git-send-email-jezz@sysmic.org>
References: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
 <1430406748-8493-3-git-send-email-jezz@sysmic.org>
Message-ID: <20150501164458.4f7ad081@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Thu, 30 Apr 2015 17:12:17 +0200, J?r?me Pouiller wrote:
> To compile with Vivante header and use framebuffer, it is necessary to
> pass option -DEGL_API_FB. This option is declared in pkg-config file of
> Vivante library. But many packages (especialy qt5 components) does not
> consider these flags.
> 
> So instead of patching every packages that use EGL, it is more
> convenient to patch Vivante headers.
> 
> This commit add #define EGL_API_FB on top of eglvivante.h when
> necessary.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  package/freescale-imx/gpu-viv-bin-mx6q/egl.pc              |  2 +-
>  package/freescale-imx/gpu-viv-bin-mx6q/glesv2.pc           |  2 +-
>  package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk | 14 ++++++++++----
>  package/freescale-imx/gpu-viv-bin-mx6q/vg.pc               |  2 +-
>  4 files changed, 13 insertions(+), 7 deletions(-)

Applied after fixing the syntax error mentioned by Gary Bisson, thanks.
Please check the latest master to confirm that it all builds fine for
you.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
