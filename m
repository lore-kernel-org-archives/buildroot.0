From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 21:02:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/glmark2: Fix mesa3d dependency
In-Reply-To: <1420917400-6556-1-git-send-email-bernd.kuhls@t-online.de>
References: <1420917400-6556-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150110210259.6bbf4373@free-electrons.com>
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

I don't really understand: this means that we can't use glmark2 with an
OpenGL implementation other than Mesa3D ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
