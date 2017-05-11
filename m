From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 23:23:16 +0200
Subject: [Buildroot] Altera SoC Buildroot external toolchain
 incompatible error
In-Reply-To: <1494535599131-164758.post@n4.nabble.com>
References: <1494532269551-164744.post@n4.nabble.com>
 <20170511221419.1e5e9baf@free-electrons.com>
 <1494533969065-164751.post@n4.nabble.com>
 <20170511225147.7466e9ff@free-electrons.com>
 <1494535599131-164758.post@n4.nabble.com>
Message-ID: <20170511232316.693f8e6c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 May 2017 13:46:39 -0700 (PDT), lemonoje wrote:

> https://releases.linaro.org/components/toolchain/binaries/5.4-2017.01/arm-linux-gnueabihf/gcc-linaro-5.4.1-2017.01-x86_64_arm-linux-gnueabihf.tar.xz
> <https://releases.linaro.org/components/toolchain/binaries/5.4-2017.01/arm-linux-gnueabihf/gcc-linaro-5.4.1-2017.01-x86_64_arm-linux-gnueabihf.tar.xz>  

This configuration works just fine for me:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="https://releases.linaro.org/components/toolchain/binaries/5.4-2017.01/arm-linux-gnueabihf/gcc-linaro-5.4.1-2017.01-x86_64_arm-linux-gnueabihf.tar.xz"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-linux-gnueabihf"
BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_0=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y

But well, you really don't need to configure this toolchain manually,
Buildroot already supports the Linaro toolchain by default, just select
it in the list of external toolchains.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
