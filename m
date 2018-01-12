From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 22:22:54 +0100
Subject: [Buildroot] [PATCH] imx-gpu-viv: fix compiling issues with
 EGL_API_FB
In-Reply-To: <20180111180702.20687-1-gary.bisson@boundarydevices.com>
References: <20180111180702.20687-1-gary.bisson@boundarydevices.com>
Message-ID: <20180112222254.6244795a@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Jan 2018 19:07:02 +0100, Gary Bisson wrote:
> Just like the previous commit did:
> c9ecdd2b96 gpu-viv-bin-mx6q: fix compiling issues with EGL_API_FB
> 
> Difference is that in latest package, eglvivante.h is included after
> a EGL_API_FB check in eglplatform.h, giving the following error:
> /.../sysroot/usr/include/EGL/eglplatform.h:146:10:
>  fatal error: X11/Xlib.h: No such file or directory
>  #include <X11/Xlib.h>
> 
> Also, this patch introduce IMX_GPU_VIV_FIXUP_PKGCONFIG which fixes
> the pkgconfig files (for some reason default egl.pc file isn't the
> same as the one for fb target).
> 
> Finally, this patch removes references to libVIVANTE which is now
> replaced by libVDK.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
> Hi,
> 
> This patch is required to build Qt5 with latest Vivante libraries.
> 
> Let me know if you'd rather have me split this into 3 patches (1 to fix
> the header, 1 to fix pkgconfig, 1 to remove libVIVANTE).

I would have preferred to have 3 patches indeed, but OK, that's good
enough for this time. Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
