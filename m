From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jan 2015 22:22:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/glmark2: Fix mesa3d dependency
In-Reply-To: <1420917400-6556-1-git-send-email-bernd.kuhls@t-online.de>
References: <1420917400-6556-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150112222202.7133188b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 10 Jan 2015 20:16:40 +0100, Bernd Kuhls wrote:
> Compilation fails with this defconfig, provided by Thomas
> 
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2014.11.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_17=y
> BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
> BR2_TOOLCHAIN_EXTERNAL_INET_IPV6=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_PACKAGE_GLMARK2=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_RPI_USERLAND=y
> 
> because rpi-userland is used a provider for libegl/gles.
> Fix this by depending on the corresponding mesa3d suboptions.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/glmark2/Config.in |    8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
