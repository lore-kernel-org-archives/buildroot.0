From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 23:39:31 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/squid: depends on
 current_exception
In-Reply-To: <20180824200107.22849-1-bernd.kuhls@t-online.de>
References: <20180824200107.22849-1-bernd.kuhls@t-online.de>
Message-ID: <20180908233931.07075c0e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Aug 2018 22:01:07 +0200, Bernd Kuhls wrote:
> Fixes build error
> 
> TextException.cc: In function 'std::ostream& CurrentException(std::ostream&)':
> TextException.cc:64:9: error: 'current_exception' is not a member of 'std'
>      if (std::current_exception()) {
> 
> using this defconfig
> 
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv5-ctng-linux-gnueabi.tar.xz"
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="armv5-ctng-linux-gnueabi"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_12=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_PACKAGE_GNUTLS=y
> BR2_PACKAGE_OPENSSL=y
> BR2_PACKAGE_LIBKRB5=y
> 
> According to http://www.squid-cache.org/Versions/v4/RELEASENOTES.html#ss1.1
> squid-4.2 depends on C++11, but adding -std=c++11 did not fix the build
> error.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/squid/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
