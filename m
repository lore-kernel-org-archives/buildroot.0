From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 20:13:58 +0100
Subject: [Buildroot] [PATCH v3 03/14] gpu-viv-bin-mx6q: fix compiling
 issues with EGL_API_FB
In-Reply-To: <1417253726-14395-4-git-send-email-jezz@sysmic.org>
References: <1417253726-14395-1-git-send-email-jezz@sysmic.org>
 <1417253726-14395-4-git-send-email-jezz@sysmic.org>
Message-ID: <20141227201358.01abe132@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Sat, 29 Nov 2014 10:35:15 +0100, J?r?me Pouiller wrote:
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
> ---
>  package/freescale-imx/gpu-viv-bin-mx6q/egl.pc              |  2 +-
>  package/freescale-imx/gpu-viv-bin-mx6q/glesv2.pc           |  2 +-
>  package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk | 10 ++++++----
>  package/freescale-imx/gpu-viv-bin-mx6q/vg.pc               |  2 +-
>  4 files changed, 9 insertions(+), 7 deletions(-)

I am still uncertain about this one. Hardcoding the backend choice in
the header file seems really ugly, and using proper pkg-config files a
much better solution. Shouldn't we instead patch qt5 ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
