From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 14:41:29 +0200
Subject: [Buildroot] [PATCH v1 1/2] package/pipewire: bump version to
 0.3.27
In-Reply-To: <20210512204251.28928-1-ps.report@gmx.net>
References: <20210512204251.28928-1-ps.report@gmx.net>
Message-ID: <20210518124129.GI2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-05-12 22:42 +0200, Peter Seiderer spake thusly:
> - remove 0001-meson-prefer-libintl-on-FreeBSD.patch
>   (from upstream [1])
> 
> [1] https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/4d064a37183a0bf8198914dd68b063b2c9def17e
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...0001-meson-prefer-libintl-on-FreeBSD.patch | 46 -------------------
>  package/pipewire/pipewire.hash                |  2 +-
>  package/pipewire/pipewire.mk                  |  2 +-
>  3 files changed, 2 insertions(+), 48 deletions(-)
>  delete mode 100644 package/pipewire/0001-meson-prefer-libintl-on-FreeBSD.patch
> 
> diff --git a/package/pipewire/0001-meson-prefer-libintl-on-FreeBSD.patch b/package/pipewire/0001-meson-prefer-libintl-on-FreeBSD.patch
> deleted file mode 100644
> index b19715b2e8..0000000000
> --- a/package/pipewire/0001-meson-prefer-libintl-on-FreeBSD.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 4d064a37183a0bf8198914dd68b063b2c9def17e Mon Sep 17 00:00:00 2001
> -From: Evgeniy Khramtsov <evgeniy@khramtsov.org>
> -Date: Fri, 23 Apr 2021 22:57:51 +0300
> -Subject: [PATCH] meson: prefer libintl on FreeBSD
> -
> -FreeBSD does not have gettext in libc.
> -It is implemented in the third-party library.
> -
> -[Retrieved from:
> -https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/4d064a37183a0bf8198914dd68b063b2c9def17e]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - meson.build              | 3 +++
> - src/pipewire/meson.build | 2 +-
> - 2 files changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 99a4b2d1c..0a9963fbb 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -351,6 +351,9 @@ libinotify_dep = (build_machine.system() == 'freebsd'
> -     ? dependency('libinotify', required: true)
> -     : dependency('', required: false))
> - 
> -+# On FreeBSD, libintl library is required for gettext
> -+libintl_dep = cc.find_library('intl', required: false)
> -+
> - alsa_dep = dependency('alsa', version : '>=1.1.7', required: get_option('pipewire-alsa'))
> - 
> - installed_tests_metadir = pipewire_datadir / 'installed-tests' / pipewire_name
> -diff --git a/src/pipewire/meson.build b/src/pipewire/meson.build
> -index 7f2d42a7a..d4c271373 100644
> ---- a/src/pipewire/meson.build
> -+++ b/src/pipewire/meson.build
> -@@ -101,7 +101,7 @@ libpipewire = shared_library(pipewire_name, pipewire_sources,
> -   c_args : libpipewire_c_args,
> -   include_directories : [pipewire_inc, configinc, spa_inc],
> -   install : true,
> --  dependencies : [dl_lib, mathlib, pthread_lib, ],
> -+  dependencies : [dl_lib, mathlib, pthread_lib, libintl_dep, ],
> - )
> - 
> - pipewire_dep = declare_dependency(link_with : libpipewire,
> --- 
> -GitLab
> -
> diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
> index 4d2548e3ab..7c26e2ab29 100644
> --- a/package/pipewire/pipewire.hash
> +++ b/package/pipewire/pipewire.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  05cc9d25de45290c025da5da1b94fc705bddacd93cf3690d0b2988c1ac501ee1  pipewire-0.3.26.tar.gz
> +sha256  657db1b9a29ae17a9f1d9782a45bda2ba5a893fef55e1ca26453e8f7f2d4e64e  pipewire-0.3.27.tar.gz
>  sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
>  sha256  7db6138b0385e260ae8f09f050ea66c4e4fe775a11060d7f6ca2beb47f192d6f  LICENSE
> diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
> index e5185aeb8c..8abbfc35be 100644
> --- a/package/pipewire/pipewire.mk
> +++ b/package/pipewire/pipewire.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PIPEWIRE_VERSION = 0.3.26
> +PIPEWIRE_VERSION = 0.3.27
>  PIPEWIRE_SITE = $(call github,PipeWire,pipewire,$(PIPEWIRE_VERSION))
>  PIPEWIRE_LICENSE = MIT
>  PIPEWIRE_LICENSE_FILES = COPYING LICENSE
> -- 
> 2.31.1
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
