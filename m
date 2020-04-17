From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 17 Apr 2020 23:26:08 +0200
Subject: [Buildroot] [PATCH 4/9 v5] package/apparmor: add option to
 install binutils
In-Reply-To: <5a8a71873f140032c54219a1ed9205f144d6dcad.1585490494.git.yann.morin.1998@free.fr>
References: <cover.1585490494.git.yann.morin.1998@free.fr>
 <5a8a71873f140032c54219a1ed9205f144d6dcad.1585490494.git.yann.morin.1998@free.fr>
Message-ID: <CA+_SqVaLp6oVRrHLWm-msJGEsLfk02osXc5SeL0mRg49aGjc_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 29, 2020 at 4:01 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> From: Angelo Compagnucci <angelo@amarulasolutions.com>
>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> [yann.morin.1998 at free.fr: split off to its own patch]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/apparmor/Config.in   | 10 ++++++++++
>  package/apparmor/apparmor.mk |  4 ++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/package/apparmor/Config.in b/package/apparmor/Config.in
> index d35740ca73..d3941200c6 100644
> --- a/package/apparmor/Config.in
> +++ b/package/apparmor/Config.in
> @@ -17,3 +17,13 @@ config BR2_PACKAGE_APPARMOR
>           This package builds the parser (which can load profiles).
>
>           http://wiki.apparmor.net
> +
> +if BR2_PACKAGE_APPARMOR
> +
> +config BR2_PACKAGE_APPARMOR_BINUTILS
> +       bool "binutils"
> +       help
> +         A set of utilities (written in C):
> +           aa-enabled    aa-exec
> +
> +endif
> diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
> index cab37d06a6..9ee5304a16 100644
> --- a/package/apparmor/apparmor.mk
> +++ b/package/apparmor/apparmor.mk
> @@ -17,6 +17,10 @@ APPARMOR_DEPENDENCIES = libapparmor
>  APPARMOR_TOOLS = parser
>  APPARMOR_MAKE_OPTS = USE_SYSTEM=1
>
> +ifeq ($(BR2_PACKAGE_APPARMOR_BINUTILS),y)
> +APPARMOR_TOOLS += binutils
> +endif
> +
>  define APPARMOR_BUILD_CMDS
>         $(foreach tool,$(APPARMOR_TOOLS),\
>                 $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
> --
> 2.20.1
>
