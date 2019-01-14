From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Jan 2019 22:22:54 +0100
Subject: [Buildroot] [PATCH] infra/pkg-cmake: use an obviously-invalid
 value for CMAKE_SYSTEM_VERSION
In-Reply-To: <20190113095219.31874-1-yann.morin.1998@free.fr>
References: <20190113095219.31874-1-yann.morin.1998@free.fr>
Message-ID: <20190114222254.1241e765@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Jan 2019 10:52:19 +0100, Yann E. MORIN wrote:

> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index dd048b0949..50ae2b982a 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -264,7 +264,7 @@ define TOOLCHAIN_CMAKE_INSTALL_FILES
>  		-e 's#@@TARGET_CC@@#$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CC)))#' \
>  		-e 's#@@TARGET_CXX@@#$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CXX)))#' \
>  		-e 's#@@TARGET_FC@@#$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_FC)))#' \
> -		-e 's#@@CMAKE_SYSTEM_VERSION@@#$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))#' \
> +		-e 's#@@CMAKE_SYSTEM_VERSION@@#1#' \

Using a 'sed' replacement just to encode a hardcoded value in the
destination file seems a bit useless.

What about:

set(CMAKE_SYSTEM_VERSION 1)

in ./support/misc/toolchainfile.cmake.in instead ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
