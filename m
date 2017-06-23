From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Fri, 23 Jun 2017 12:37:48 +0200
Subject: [Buildroot] [PATCH] package/dt-utils: new package
In-Reply-To: <20170621222326.3c64e6bf@windsurf>
References: <20170620152443.17014-1-m.niestroj@grinn-global.com>
 <20170621222326.3c64e6bf@windsurf>
Message-ID: <3eb8b231-1709-dd73-24e7-c361c83413b5@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 21.06.2017 22:23, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 20 Jun 2017 17:24:43 +0200, Marcin Niestroj wrote:
>> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
>> ---
>>   DEVELOPERS                   |  1 +
>>   package/Config.in            |  1 +
>>   package/dt-utils/Config.in   |  8 ++++++++
>>   package/dt-utils/dt-utils.mk | 15 +++++++++++++++
>>   4 files changed, 25 insertions(+)
>>   create mode 100644 package/dt-utils/Config.in
>>   create mode 100644 package/dt-utils/dt-utils.mk
> 
> This package doesn't build with the following defconfig:

Thanks for spotting that. I've only tested this package with glibc
library. Looks like this package also didn't build with musl.

> 
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-444-g6c704ba.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_DT_UTILS=y
> # BR2_TARGET_ROOTFS_TAR is not set
> 


-- 
Marcin Niestroj
