From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jan 2016 21:50:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/pkg-cmake: use MinSizeRel for
 size optimized build
In-Reply-To: <1453055051-11080-1-git-send-email-joerg.krause@embedded.rocks>
References: <1453055051-11080-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160118215057.0108fad3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sun, 17 Jan 2016 19:24:11 +0100, J?rg Krause wrote:
> MinSizeRel sets the gcc compiler optimization level to '-Os' whereas Release
> sets it to '-O3'.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/pkg-cmake.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 81dcfcc..dc2dc93 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -87,7 +87,7 @@ define $(2)_CONFIGURE_CMDS
>  	PATH=$$(BR_PATH) \
>  	$$($$(PKG)_CONF_ENV) $$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
>  		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
> -		-DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),Debug,Release) \
> +		-DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),Debug,$$(if $$(BR2_OPTIMIZE_S),MinSizeRel,Release) \

Looks good, but instead of this, can't CMake be taught to use Buildroot
CFLAGS, which have our own -O<value> ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
