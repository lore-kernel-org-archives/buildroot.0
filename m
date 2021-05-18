From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 13:16:48 +0200
Subject: [Buildroot] [PATCH] package/libubootenv: bump to version 0.3.2
In-Reply-To: <20210517103959.1924729-1-francois.perrad@gadz.org>
References: <20210517103959.1924729-1-francois.perrad@gadz.org>
Message-ID: <20210518111648.GR2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2021-05-17 12:39 +0200, Francois Perrad spake thusly:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...eLists.txt-do-not-force-the-build-of-a-share.patch | 11 ++++++-----
>  package/libubootenv/libubootenv.hash                  |  2 +-
>  package/libubootenv/libubootenv.mk                    |  4 ++--
>  3 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch b/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch
> index 2a234af78..9040e1267 100644
> --- a/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch
> +++ b/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch
> @@ -26,10 +26,10 @@ Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
>   1 file changed, 2 insertions(+), 4 deletions(-)
>  
>  diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
> -index a04dd11..3a2115d 100644
> +index 4b71bc5..0b515f4 100644
>  --- a/src/CMakeLists.txt
>  +++ b/src/CMakeLists.txt
> -@@ -12,17 +12,15 @@ SET(include_HEADERS
> +@@ -12,18 +12,16 @@ SET(include_HEADERS
>   
>   include(GNUInstallDirs) # for the CMAKE_INSTALL_LIBDIR variable
>   
> @@ -41,8 +41,9 @@ index a04dd11..3a2115d 100644
>  -SET_TARGET_PROPERTIES(ubootenv_static PROPERTIES OUTPUT_NAME ubootenv)
>   add_executable(fw_printenv fw_printenv.c)
>   add_executable(fw_setenv fw_setenv.c)
> - target_link_libraries(fw_printenv ubootenv z)
> - target_link_libraries(fw_setenv ubootenv z)
> + target_link_libraries(ubootenv z)
> + target_link_libraries(fw_printenv ubootenv)
> + target_link_libraries(fw_setenv ubootenv)
>   
>  -install (TARGETS ubootenv ubootenv_static DESTINATION ${CMAKE_INSTALL_LIBDIR})
>  +install (TARGETS ubootenv DESTINATION ${CMAKE_INSTALL_LIBDIR})
> @@ -50,5 +51,5 @@ index a04dd11..3a2115d 100644
>   install (TARGETS fw_printenv DESTINATION ${CMAKE_INSTALL_BINDIR})
>   install (TARGETS fw_setenv DESTINATION ${CMAKE_INSTALL_BINDIR})
>  -- 
> -2.25.1
> +2.30.2
>  
> diff --git a/package/libubootenv/libubootenv.hash b/package/libubootenv/libubootenv.hash
> index 0b5320b36..d6de61461 100644
> --- a/package/libubootenv/libubootenv.hash
> +++ b/package/libubootenv/libubootenv.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  e25adf81dd2d4a083cb2cf032843a1ee2bb1fab54aa7a0202bd2295186bfe1b7  libubootenv-e663439e3d39a4cdbddb7e818245a99c485fa965.tar.gz
> +sha256  662ef1efe058e2d5a07498f7b63aff7b2a521c0f6f199c499fb3ae84b54121bd  libubootenv-0.3.2.tar.gz
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Licenses/lgpl-2.1.txt
> diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
> index 7a98f5324..295226b9a 100644
> --- a/package/libubootenv/libubootenv.mk
> +++ b/package/libubootenv/libubootenv.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -LIBUBOOTENV_VERSION = e663439e3d39a4cdbddb7e818245a99c485fa965
> -LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,$(LIBUBOOTENV_VERSION))
> +LIBUBOOTENV_VERSION = 0.3.2
> +LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,v$(LIBUBOOTENV_VERSION))
>  LIBUBOOTENV_LICENSE = LGPL-2.1
>  LIBUBOOTENV_LICENSE_FILES = Licenses/lgpl-2.1.txt
>  LIBUBOOTENV_INSTALL_STAGING = YES
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
