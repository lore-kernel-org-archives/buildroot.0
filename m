From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Apr 2014 22:34:30 +0200
Subject: [Buildroot] [PATCH 02/14] pkg-cmake.mk: remove unneeded quotes
 in the generated toolchainfile.cmake
In-Reply-To: <1398293313-17580-3-git-send-email-s.martin49@gmail.com>
References: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
 <1398293313-17580-3-git-send-email-s.martin49@gmail.com>
Message-ID: <53597556.7040502@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/04/14 00:48, Samuel Martin wrote:
> Since Buildroot does not support space in paths (at least neither in the
> Buildroot installation location, nor in the output directory).

 But is that sufficient reason to remove the quotes? I think not... We
don't support space in paths because make doesn't, not because we don't
_want_ to.

 So, NAK for me. Unless there is some other reason why those quotes are
in the way, but since they're still there a couple of lines above (and
needed there) it's NAK for me.

 Unless you can give a better explanation why you'd prefer no quotes.


 Regards,
 Arnout

> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v1 -> v2:
> - new patch
> ---
>  package/pkg-cmake.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index edda14a..963a423 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -167,10 +167,10 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
>  	set(CMAKE_C_FLAGS \"\$${CMAKE_C_FLAGS} $(TARGET_CFLAGS)\" CACHE STRING \"Buildroot CFLAGS\" FORCE)\n\
>  	set(CMAKE_CXX_FLAGS \"\$${CMAKE_CXX_FLAGS} $(TARGET_CXXFLAGS)\" CACHE STRING \"Buildroot CXXFLAGS\" FORCE)\n\
>  	set(CMAKE_INSTALL_SO_NO_EXE 0)\n\
> -	set(CMAKE_PROGRAM_PATH \"$(HOST_DIR)/usr/bin\")\n\
> -	set(CMAKE_FIND_ROOT_PATH \"$(STAGING_DIR)\")\n\
> +	set(CMAKE_PROGRAM_PATH $(HOST_DIR)/usr/bin)\n\
> +	set(CMAKE_FIND_ROOT_PATH $(STAGING_DIR))\n\
>  	set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
>  	set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n\
>  	set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)\n\
> -	set(ENV{PKG_CONFIG_SYSROOT_DIR} \"$(STAGING_DIR)\")\n\
> +	set(ENV{PKG_CONFIG_SYSROOT_DIR} $(STAGING_DIR))\n\
>  	" > $@
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
