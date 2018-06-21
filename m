From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jun 2018 14:16:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/berkeleydb: fix build error
 with gcc8
In-Reply-To: <20180620195804.9594-1-bernd.kuhls@t-online.de>
References: <20180620195804.9594-1-bernd.kuhls@t-online.de>
Message-ID: <20180621141630.44b90e93@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Jun 2018 21:58:04 +0200, Bernd Kuhls wrote:
> Fixes
> 
> ../src/dbinc/atomic.h:179:19: error: definition of 'int __atomic_compare_exchange(db_atomic_t*,
>  atomic_value_t, atomic_value_t)' ambiguates built-in declaration 'bool
>  __atomic_compare_exchange(unsigned int, volatile void*, void*, void*, int, int)'
>  static inline int __atomic_compare_exchange(
>                    ^~~~~~~~~~~~~~~~~~~~~~~~~
> 
> To reproduce the build error use this defconfig
> 
> BR2_GCC_VERSION_8_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_BERKELEYDB=y
> BR2_PACKAGE_BERKELEYDB_COMPAT185=y
> BR2_PACKAGE_BERKELEYDB_TOOLS=y
> 
> Please note that to trigger the error BR2_TOOLCHAIN_BUILDROOT_CXX=y
> is needed although berkeleydb does not depend on c++.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Isn't this one a duplicate of
https://patchwork.ozlabs.org/patch/909328/?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
