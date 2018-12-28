From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Dec 2018 11:51:57 +0100
Subject: [Buildroot] [PATCH] package/x11r7/xapp_rgb: add missing
 host-pkgconf dependency
In-Reply-To: <20181227142727.19535-1-thomas.petazzoni@bootlin.com>
References: <20181227142727.19535-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181228115157.41561890@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Dec 2018 15:27:27 +0100, Thomas Petazzoni wrote:
> Building a minimal defconfig such as:
> 
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2018.05.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_XAPP_RGB=y
> 
> by running "make xapp_rgb" gives the following build failure:
> 
> checking for RGB... configure: error: in `/home/test/buildroot/output/build/xapp_rgb-1.0.6':
> configure: error: The pkg-config script could not be found or is too old.  Make sure it
> is in your PATH or set the PKG_CONFIG environment variable to the full
> path to pkg-config.
> 
> Alternatively, you may set the environment variables RGB_CFLAGS
> and RGB_LIBS to avoid the need to call pkg-config.
> See the pkg-config man page for more details.
> 
> The configure script uses pkg-config, but host-pkgconf is missing in
> the list of dependencies.
> 
> This issue was detected thanks to per-package directory support.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/x11r7/xapp_rgb/xapp_rgb.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
