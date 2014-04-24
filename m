From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 25 Apr 2014 00:46:43 +0200
Subject: [Buildroot] [PATCH 10/14] pkg-cmake.mk: globally drive the
 CMAKE_BUILD_TYPE flag using BR2_ENABLE_DEBUG
In-Reply-To: <1398293313-17580-11-git-send-email-s.martin49@gmail.com>
References: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
 <1398293313-17580-11-git-send-email-s.martin49@gmail.com>
Message-ID: <53599453.8080000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/04/14 00:48, Samuel Martin wrote:
> This CMake flag is usually used to adjust compiler flags (like: -Ox, -g,
> etc).
> 
> So, it makes sense for Buildroot to globally drive this CMake flags in
> the cmake-package infrastructure.
> 
> However, if a package prefer overriding this default setting, it still
> can via the <PKG>_CONF_OPT variable.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> 
> ---
> changes v1 -> v2:
> - new patch
> ---
>  package/pkg-cmake.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index e0efccb..1c52a53 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -63,6 +63,7 @@ define $(2)_CONFIGURE_CMDS
>  	PATH=$(BR_PATH) \
>  	$$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
>  		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
> +		-DCMAKE_BUILD_TYPE=$(if $(BR2_ENABLE_DEBUG),Debug,Release) \
>  		-DCMAKE_INSTALL_PREFIX="/usr" \
>  		-DCMAKE_COLOR_MAKEFILE=OFF \
>  		-DBUILD_TESTING=OFF \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
