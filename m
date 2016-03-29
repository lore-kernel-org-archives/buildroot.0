From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 20:26:09 +0200
Subject: [Buildroot] [PATCH] mesa3d: enable DRI drivers for xorg-less
 configurations
In-Reply-To: <1459201695-30709-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459201695-30709-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160329202609.1610b4cd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Mar 2016 18:48:15 -0300, Gustavo Zacarias wrote:
> mesa3d can in fact build the DRI infrastructure/drivers just fine
> without lingering x11 libs around, it just needs libdrm & friends which
> are already accounted for.
> 
> So make the libGL (full OpenGL) providing abilities dependant on x11
> being present.
> 
> It serves it's purpose for EGL+GLES hardware acceleration, and can in
> fact be built without them, but it's probably not very useful (still,
> leave the option for people inclined to do so).
> 
> Simple test defconfig:
> 
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
> BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU=y
> BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_MESA3D_OPENGL_ES=y
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/mesa3d/Config.in | 9 +++------
>  package/mesa3d/mesa3d.mk | 3 +++
>  2 files changed, 6 insertions(+), 6 deletions(-)

Applied to master, thanks. I'm pretty sure it's going to trigger some
cases that were not accounted for, but the only way to know is to get
the autobuilders to play with this.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
