From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 20:25:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: DRI drivers need either
 glx, egl or gbm
In-Reply-To: <20210720172911.15840-1-bernd.kuhls@t-online.de>
References: <20210720172911.15840-1-bernd.kuhls@t-online.de>
Message-ID: <20210720202545.74d835bd@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Bernd,

On Tue, 20 Jul 2021 19:29:11 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes build error:
> ../output-1/build/mesa3d-21.1.5/meson.build:520:4:
>  ERROR: Problem encountered: building dri drivers require at least one windowing system
> 
> OSMesa is not seen as a valid windowing system for DRI drivers anymore:
> https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=21.1&id=ee802372180a2b4460cc7abb53438e45c6b6f1e4
> 
> Fixes:
> http://autobuild.buildroot.net/results/46e3a66ddc13a064e512aad0f3afd8655889ab9d/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/Config.in | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Thanks for the patch. I'm always a bit confused with all these mesa3d
possibilities. How does this patch fit with what you did in commit
15a2f9b819806d38a7d8172a20f80130b1d60e63, where
BR2_PACKAGE_MESA3D_OSMESA_CLASSIC was renamed
BR2_PACKAGE_MESA3D_OSMESA_GALLIUM ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
