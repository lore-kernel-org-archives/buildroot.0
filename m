From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Dec 2019 21:48:20 +0100
Subject: [Buildroot] [PATCH v4 1/1] package/grpc: bump to version 1.25.0
In-Reply-To: <20191206182726.3645508-1-aduskett@gmail.com>
References: <20191206182726.3645508-1-aduskett@gmail.com>
Message-ID: <20191206214820.1b68bf43@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  6 Dec 2019 10:27:26 -0800
aduskett at gmail.com wrote:

> +# Toolchains older than gcc5 will fail to compile with -0s due to:
> +# error: failure memory model cannot be stronger than success memory model for
> +# '__atomic_compare_exchange'
> +ifneq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),y)

That's not what I want. What I want is:

ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5):$(BR2_OPTIMIZE_S),:y)
GRPC_CFLAGS += -O0
GRPC_CXXFLAGS += -O0
endif

i.e, override the flags only when -Os is used.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
