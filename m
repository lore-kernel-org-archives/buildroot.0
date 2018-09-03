From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 3 Sep 2018 15:50:34 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/squid: depends on
 current_exception
In-Reply-To: <20180824200107.22849-1-bernd.kuhls@t-online.de>
References: <20180824200107.22849-1-bernd.kuhls@t-online.de>
Message-ID: <c64fb4d0-a760-da50-621f-e47b1d470994@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 24/08/2018 22:01, bernd.kuhls at t-online.de (Bernd Kuhls) ha scritto:
> Fixes build error
> 
> TextException.cc: In function 'std::ostream& CurrentException(std::ostream&)':
> TextException.cc:64:9: error: 'current_exception' is not a member of 'std'
>       if (std::current_exception()) {
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
Tested-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Fixes:
http://autobuild.buildroot.net/results/273/273556771e957f109a1fbf446a5193aac49b72af/
http://autobuild.buildroot.net/results/9d2/9d2cde8494f69fedf0afc460d8e540d769a79212/
http://autobuild.buildroot.net/results/a71/a71db790ae3a3ea1836760edad504a92ea005cf7/
http://autobuild.buildroot.net/results/6fc/6fc05e2bb90120f43b19aace436837aafd82d999/

Best regards.
Giulio Benetti
