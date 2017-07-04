From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 4 Jul 2017 17:15:40 +0200
Subject: [Buildroot] [PATCH v3 12/14] pkg-cmake: programs are now
 installed in $(HOST_DIR)/bin
In-Reply-To: <20170704140404.4098-13-arnout@mind.be>
References: <20170704140404.4098-1-arnout@mind.be>
 <20170704140404.4098-13-arnout@mind.be>
Message-ID: <d61f2772-1eff-48cc-bf4c-01391f421350@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 04/07/2017 ? 16:04, Arnout Vandecappelle (Essensium/Mind) a ?crit :
> Remove the redundant usr/ component of the HOST_DIR paths. Since a
> previous commit added a symlink from $(HOST_DIR)/usr to $(HOST_DIR),
> everything keeps on working.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Romain Naour <romain.naour@smile.fr>

Best regards,
Romain

> ---
>  support/misc/toolchainfile.cmake.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
> index c8c710bddd..1f5d2371ed 100644
> --- a/support/misc/toolchainfile.cmake.in
> +++ b/support/misc/toolchainfile.cmake.in
> @@ -48,7 +48,7 @@ set(CMAKE_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@" CACHE STRING "Buildroot LDFLAGS
>  
>  set(CMAKE_INSTALL_SO_NO_EXE 0)
>  
> -set(CMAKE_PROGRAM_PATH "${RELOCATED_HOST_DIR}/usr/bin")
> +set(CMAKE_PROGRAM_PATH "${RELOCATED_HOST_DIR}/bin")
>  set(CMAKE_SYSROOT "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
>  set(CMAKE_FIND_ROOT_PATH "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
>  set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
> 
