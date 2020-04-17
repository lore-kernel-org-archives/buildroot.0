From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 17 Apr 2020 23:28:45 +0200
Subject: [Buildroot] [PATCH 9/9 v5] package/apparmor: enable apache
 integration
In-Reply-To: <8b4415dad37fa81cf2d4adb09b27119b233bcd8a.1585490494.git.yann.morin.1998@free.fr>
References: <cover.1585490494.git.yann.morin.1998@free.fr>
 <8b4415dad37fa81cf2d4adb09b27119b233bcd8a.1585490494.git.yann.morin.1998@free.fr>
Message-ID: <CA+_SqVbdRoY1FAgPFzz00k6o_S62Ndg_=C7F9bESDQ_SrbBeOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 29, 2020 at 4:01 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> [yann.morin.1998 at free.fr: split off to its own patch]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/apparmor/apparmor.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
> index 8a25cd4466..a4900397f2 100644
> --- a/package/apparmor/apparmor.mk
> +++ b/package/apparmor/apparmor.mk
> @@ -44,6 +44,12 @@ APPARMOR_DEPENDENCIES += linux-pam
>  APPARMOR_TOOLS += changehat/pam_apparmor
>  endif
>
> +ifeq ($(BR2_PACKAGE_APACHE),y)
> +APPARMOR_DEPENDENCIES += apache
> +APPARMOR_TOOLS += changehat/mod_apparmor
> +APPARMOR_MAKE_OPTS += APXS=$(STAGING_DIR)/usr/bin/apxs
> +endif
> +
>  define APPARMOR_BUILD_CMDS
>         $(foreach tool,$(APPARMOR_TOOLS),\
>                 $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
> --
> 2.20.1
>
