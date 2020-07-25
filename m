From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Jul 2020 22:44:06 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/grpc: bump version to 1.30.2
In-Reply-To: <20200721214522.3719304-2-aduskett@gmail.com>
References: <20200721214522.3719304-1-aduskett@gmail.com>
 <20200721214522.3719304-2-aduskett@gmail.com>
Message-ID: <20200725224406.2678798e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 Jul 2020 14:45:22 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Other changes:
>   - Add a dependency on libabseil-cpp
>   - Update the patches to apply properly.
>   - Add a dependency for BR2_TOOLCHAIN_USES_GLIBC.
>     libabseil-cpp uses execinfo.h for stacktracing, which uclibc and musl do
>     not provide by default. As such, a dependency on BR2_TOOLCHAIN_USES_GLIBC
>     as been added to the grpc package and to the grpc option for collectd.
> 
> Tested with the following distributions:
>   - Debian 9
>   - CentOS 7
>   - Fedora 32
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Add a dependency on BR2_TOOLCHAIN_USES_GLIBC

Applied after dropping the added glibc dependency, since it's no longer
needed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
