From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 21:54:46 +0100
Subject: [Buildroot] [PATCH v2,1/1] package/mesa3d: VDPAU needs x11
In-Reply-To: <20191104181609.11089-1-fontaine.fabrice@gmail.com>
References: <20191104181609.11089-1-fontaine.fabrice@gmail.com>
Message-ID: <20191104215446.778e154a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  4 Nov 2019 19:16:09 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit c898f95c275a105caacbb31adf92ef94bd4530c4 added support for
> Gallium VDPAU state tracker by updating Config.in to add a dependency on
> XORG7. However, mesa3d.mk was not updated to reflect this dependency.
> 
> XORG7 dependences is already managed under the ifeq
> BR2_PACKAGE_MESA3D_OPENGL_GLX block so reuse this block by making ifeq
> depends on a new BR2_PACKAGE_MESA3D_NEEDS_X11 hidden option
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/bbd102d59bbdca35fd1b5401df2790dd197d1e5f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Add BR2_PACKAGE_MESA3D_NEEDS_X11 option

Applied to master, thanks. The dependencies of this mesa3d package are
really complicated :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
