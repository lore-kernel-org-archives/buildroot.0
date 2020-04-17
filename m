From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 17 Apr 2020 23:27:41 +0200
Subject: [Buildroot] [PATCH 6/9 v5] package/apparmor: add option to
 install generic profiles
In-Reply-To: <dd9e110845e65fdcf6621fc051c473cec139ac1b.1585490494.git.yann.morin.1998@free.fr>
References: <cover.1585490494.git.yann.morin.1998@free.fr>
 <dd9e110845e65fdcf6621fc051c473cec139ac1b.1585490494.git.yann.morin.1998@free.fr>
Message-ID: <CA+_SqVZvkG8t23__8Gho14dNBaZdiwuH+1N4Jnh3J9ctJ8kemA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 29, 2020 at 4:01 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> The apparmor packages come

come

> with a set of profiles for a class of usual,
> mostly server-class programs and daemons.
>
> Even though an embedded device will mostly require custom profiles, the
> generic ones may come handy, as they also provide "abstractions", that
> can serve as templates for custom profiles.
>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> [yann.morin.1998 at free.fr: split off into its own patch]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/apparmor/Config.in   | 6 ++++++
>  package/apparmor/apparmor.mk | 4 ++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/package/apparmor/Config.in b/package/apparmor/Config.in
> index 714888c583..77a20f6faa 100644
> --- a/package/apparmor/Config.in
> +++ b/package/apparmor/Config.in
> @@ -62,4 +62,10 @@ comment "utils need python3"
>         depends on !BR2_STATIC_LIBS
>         depends on !BR2_PACKAGE_PYTHON3
>
> +config BR2_PACKAGE_APPARMOR_PROFILES
> +       bool "profiles"
> +       help
> +         Installs server-class profiles for a wide range of
> +         usual programs and daemons.
> +
>  endif
> diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
> index 1805628de4..26a09d2ff5 100644
> --- a/package/apparmor/apparmor.mk
> +++ b/package/apparmor/apparmor.mk
> @@ -35,6 +35,10 @@ endif # BR2_PACKAGE_APPARMOR_UTILS_EXTRA
>
>  endif # BR2_PACKAGE_APPARMOR_UTILS
>
> +ifeq ($(BR2_PACKAGE_APPARMOR_PROFILES),y)
> +APPARMOR_TOOLS += profiles
> +endif
> +
>  define APPARMOR_BUILD_CMDS
>         $(foreach tool,$(APPARMOR_TOOLS),\
>                 $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
> --
> 2.20.1
>
