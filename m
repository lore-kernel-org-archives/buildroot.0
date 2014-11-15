From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 15 Nov 2014 18:26:23 +0100
Subject: [Buildroot] [PATCH 1/1] pkg-cmake.mk: Set
	CMAKE_SYSTEM_PROCESSOR.
In-Reply-To: <1416067219-30211-1-git-send-email-volker.krause@kdab.com>
References: <1416067219-30211-1-git-send-email-volker.krause@kdab.com>
Message-ID: <CAHXCMM+WdJe+pHi4GNi7QT9Vd=43LoRzXhU05byPPZ5uLRT=Ww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Volker,

On Sat, Nov 15, 2014 at 5:00 PM, Volker Krause <volker.krause@kdab.com> wrote:
> This is rarely needed by packages, but convenient to have when it is.
>
> Signed-off-by: Volker Krause <volker.krause@kdab.com>
> ---
>  package/pkg-cmake.mk                | 1 +
>  support/misc/toolchainfile.cmake.in | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index c8735ef..57a6d29 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -193,5 +193,6 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
>                 -e 's:@@TARGET_LDFLAGS@@:$(call qstrip,$(TARGET_LDFLAGS)):' \
>                 -e 's:@@TARGET_CC_NOCCACHE@@:$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CC_NOCCACHE))):' \
>                 -e 's:@@TARGET_CXX_NOCCACHE@@:$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CXX_NOCCACHE))):' \
> +               -e 's:@@BR2_ARCH@@:$(BR2_ARCH):' \

You should qstrip the variable here.

>                 $(TOPDIR)/support/misc/toolchainfile.cmake.in \
>                 > $@
> diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
> index 4ca3d35..86ef0b4 100644
> --- a/support/misc/toolchainfile.cmake.in
> +++ b/support/misc/toolchainfile.cmake.in
> @@ -11,6 +11,7 @@
>  string(REPLACE "/usr/share/buildroot" "" RELOCATED_HOST_DIR ${CMAKE_CURRENT_LIST_DIR})
>
>  set(CMAKE_SYSTEM_NAME Linux)
> +set(CMAKE_SYSTEM_PROCESSOR @@BR2_ARCH@@)
>
>  set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@ ${CMAKE_C_FLAGS}" CACHE STRING "Buildroot CFLAGS")
>  set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@ ${CMAKE_CXX_FLAGS}" CACHE STRING "Buildroot CXXFLAGS")
> --
> 1.8.4.5
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Otherwise, it looks good.

Regards,

-- 
Samuel
