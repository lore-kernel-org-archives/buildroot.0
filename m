From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 8 Nov 2019 22:58:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/sysrepo: fix host/staging
 install steps
In-Reply-To: <20191103060113.4884-1-heiko.thiery@gmail.com>
References: <20191103060113.4884-1-heiko.thiery@gmail.com>
Message-ID: <20191108225833.6d81ea18@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Heiko,

On Sun,  3 Nov 2019 07:01:14 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> From: Heiko Thiery <heiko.thiery@kontron.com>
> 
> The sysrepoctl and sysrepocfg executables are used in install steps
> of the package. Since there are hard-coded install pathes,
> this leeds to wrong installation directories in host and staging
> install steps.
> 
> Only sysrepoctl and sysrepocfg executables are needed from host build.
> So build and install only the executables in this step.
> 
> The staging step only needs to install the library with the
> corresponding files like the headers and the pkg-config.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
> ---
>  package/sysrepo/sysrepo.mk | 36 ++++++++++++++++++++++++++----------
>  1 file changed, 26 insertions(+), 10 deletions(-)

Do you have a minimal/simple defconfig that allows to reproduce the problem?

When I build this simple configuration:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2019.05.1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_SYSREPO=y
# BR2_TARGET_ROOTFS_TAR is not set

It builds just fine, with no problem. What is the thing that triggers
the issue ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
