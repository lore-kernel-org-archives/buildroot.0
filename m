From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jan 2018 22:34:08 +0100
Subject: [Buildroot] [PATCH] kodi-texturepacker: fix compiltion error
In-Reply-To: <20180119164232.1559-1-daggs@gmx.com>
References: <20180119164232.1559-1-daggs@gmx.com>
Message-ID: <20180129223408.7364dc0d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Jan 2018 18:42:32 +0200, Dagg Stompler wrote:
> backport fix the following error: declaration of ?void* reallocarray(void*, size_t, size_t) throw ()? has a different exception specifier
> from upstream kodi which can be reproduced using the following defconfig:
> BR2_x86_64=y
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_KODI=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_PYTHON=y
> BR2_PACKAGE_PYTHON_PY_PYC=y
> 
> Signed-off-by: Dagg Stompler <daggs@gmx.com>
> ---
>  .../kodi-texturepacker/0002-fix_reallocarray.patch | 169 +++++++++++++++++++++
>  1 file changed, 169 insertions(+)
>  create mode 100644 package/kodi-texturepacker/0002-fix_reallocarray.patch

Applied to master after tweaking the commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
