From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 21:00:03 +0200
Subject: [Buildroot] [PATCH 5/6] support/graph-depends: don't show
 toolchain dependency for all packages
In-Reply-To: <e626cb1d54ac1756750c7ce473dde8d7d5b784b9.1397421554.git.yann.morin.1998@free.fr>
References: <cover.1397421554.git.yann.morin.1998@free.fr>
 <e626cb1d54ac1756750c7ce473dde8d7d5b784b9.1397421554.git.yann.morin.1998@free.fr>
Message-ID: <20140414210003.2baa485f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 13 Apr 2014 22:42:41 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Al packages depend on 'toolchain'. Currently, 'graph-depends' graphs this
> dependency. The resulting graph is thus cluttered with less-than-useful
> information.
> 
> Instead, do not graph the 'toolchain' dependency for any package, save
> for the fake 'all' package. The graph is now a bit more readable.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  support/scripts/graph-depends | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Are you sure this works? I applied your patch series, and I still see
all packages having a dependency on the toolchain. The PDF result is
http://free-electrons.com/~thomas/pub/bug-toolchain-graph-depends.pdf.

My defconfig is:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2014.02-rc1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_13=y
BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
BR2_TOOLCHAIN_EXTERNAL_INET_IPV6=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_JQUERY_UI=y
# BR2_TARGET_ROOTFS_TAR is not set

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
