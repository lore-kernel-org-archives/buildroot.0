From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 15:42:36 +0100
Subject: [Buildroot] [PATCH v5 1/1] package/grpc: bump to version 1.25.0
In-Reply-To: <20191206222549.3946042-1-aduskett@gmail.com>
References: <20191206222549.3946042-1-aduskett@gmail.com>
Message-ID: <20191208154236.1bb919b1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  6 Dec 2019 14:25:49 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Other changes:
>   - Remove upstream patch 0004-Fix-gettid-naming-conflict.patch
>   - Remove upstream patch 0005-Rename-gettid-functions.patch
>   - Add a check for BR2_TOOLCHAIN_GCC_AT_LEAST_5 in grpc.mk. If the selected
>     toolchain is not at least version 5 or higher

... and the selected optimization level is -Os

>, set the GRPC_CFLAGS and
>     GRPC_CXXFLAGS optimizations to -O3. This check prevents the following error:
>       error: failure memory model cannot be stronger than success memory
>       model for '__atomic_compare_exchange'
> 
> +# Toolchains older than gcc5 will fail to compile with -0s due to:
> +# error: failure memory model cannot be stronger than success memory model for
> +# '__atomic_compare_exchange'
> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5):$(BR2_OPTIMIZE_S),:y)
> +GRPC_CFLAGS += -O3
> +GRPC_CXXFLAGS += -O3

-O3 is quite aggressive, so I changed to -O2, fixed the commit log, and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
