From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 07 Feb 2013 08:08:02 +0100
Subject: [Buildroot] [PATCH 4/8] package/pkg-cmake.mk: make sure
 $(HOST_PATH) is in the PATH at configure time
In-Reply-To: <c99cf48af8dd733748078dd4b6fa47ada5a106e5.1356907750.git.s.martin49@gmail.com>
References: <cover.1356907750.git.s.martin49@gmail.com>
 <c99cf48af8dd733748078dd4b6fa47ada5a106e5.1356907750.git.s.martin49@gmail.com>
Message-ID: <511352D2.5010301@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/12/12 23:54, Samuel Martin wrote:
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  Regards,
  Arnout

> ---
>   package/pkg-cmake.mk | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 626a0b0..1e8302f 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -62,7 +62,8 @@ ifeq ($(5),target)
>   define $(2)_CONFIGURE_CMDS
>   	(cd $$($$(PKG)_BUILDDIR) && \
>   	rm -f CMakeCache.txt && \
> -	$$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
> +	PATH="$(TARGET_PATH)" $$($$(PKG)_CONF_ENV) \
> +		$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
>   		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
>   		-DCMAKE_INSTALL_PREFIX="/usr" \
>   		$$($$(PKG)_CONF_OPT) \
> @@ -74,7 +75,7 @@ else
>   define $(2)_CONFIGURE_CMDS
>   	(cd $$($$(PKG)_BUILDDIR) && \
>   	rm -f CMakeCache.txt && \
> -	$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
> +	PATH="$(HOST_PATH)" $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
>   		-DCMAKE_INSTALL_SO_NO_EXE=0 \
>   		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
>   		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
