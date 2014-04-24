From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 24 Apr 2014 06:47:38 +0300
Subject: [Buildroot] [PATCH 06/14] pkg-cmake.mk: cosmetic changes in the
 generated toolchainfile.cmake file
In-Reply-To: <1398293313-17580-7-git-send-email-s.martin49@gmail.com>
References: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
 <1398293313-17580-7-git-send-email-s.martin49@gmail.com>
Message-ID: <20140424034738.GB22908@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Thu, Apr 24, 2014 at 12:48:25AM +0200, Samuel Martin wrote:
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v1 -> v2:
> - new patch
> ---
>  package/pkg-cmake.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index a032426..19f7843 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -161,17 +161,25 @@ host-cmake-package = $(call inner-cmake-package,host-$(pkgname),$(call UPPERCASE
>  ################################################################################
>  
>  define TOOLCHAINFILE_CMAKE
> +#
> +# Automatically generated file; DO NOT EDIT.
> +# CMake toolchain file for Buildroot
> +#
> +
>  string(REPLACE /usr/share/buildroot "" _HOST_DIR $${CMAKE_CURRENT_LIST_DIR})
> +
>  set(CMAKE_SYSTEM_NAME Linux)
>  set(CMAKE_C_FLAGS "$${CMAKE_C_FLAGS} $(TARGET_CFLAGS)" CACHE STRING "Buildroot CFLAGS" FORCE)
>  set(CMAKE_CXX_FLAGS "$${CMAKE_CXX_FLAGS} $(TARGET_CXXFLAGS)" CACHE STRING "Buildroot CXXFLAGS" FORCE)
>  set(CMAKE_INSTALL_SO_NO_EXE 0)
> +
>  set(CMAKE_PROGRAM_PATH $${_HOST_DIR}/usr/bin)
>  set(CMAKE_FIND_ROOT_PATH $${_HOST_DIR}/$(STAGING_SUBDIR))
>  set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
>  set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
>  set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
>  set(ENV{PKG_CONFIG_SYSROOT_DIR} $${_HOST_DIR}/$(STAGING_SUBDIR))
> +
>  # This toolchain file can be used both inside and outside Buildroot.
>  # * When used inside Buildroot, ccache support is explicitly driven using the
>  #   USE_CCACHE variable.

Shouldn't this be squashed into patch #3?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
