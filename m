From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 Oct 2019 21:14:25 +0200
Subject: [Buildroot] [PATCH 1/4] configs/imx6-sabresd_qt5: Move mdev
 from eudev
In-Reply-To: <20191009165601.3424-1-festevam@gmail.com>
References: <20191009165601.3424-1-festevam@gmail.com>
Message-ID: <20191009211425.2ea3b7dc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  9 Oct 2019 13:55:58 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Since commit cf66a67112cd706d2e7 ("package/glmark2: drm support needs udev")
> udev is needed when the drm flavor is used.
> 
> Move mdev from eudev in order to fix the following glmark2
> build failure:
> 
> Unknown flavor: . Supported flavors are dispmanx-glesv2, drm-gl,
> drm-glesv2, mir-gl, mir-glesv2, wayland-gl, wayland-glesv2, win32-gl,
> win32-glesv2, x11-gl, x11-glesv2
> 
> Suggested-by: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

While this patch is necessary, I think the glmark2 package also needs
to be fixed: it should not be possible to select it if not all
dependencies are available to at least have one flavour enabled.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
