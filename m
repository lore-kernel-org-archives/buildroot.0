From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 14 Nov 2020 15:54:07 +0100
Subject: [Buildroot] [PATCH] package/libpam-tacplus: remove duplicate
 LIBPAM_TACPLUS_AUTORECONF
In-Reply-To: <20201114145158.1795983-1-romain.naour@gmail.com>
References: <20201114145158.1795983-1-romain.naour@gmail.com>
Message-ID: <CAPi7W830KvLj7LdhOGErpXd6Uf3gd=LxWCa+XnJRaszUejqBLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

Le sam. 14 nov. 2020 ? 15:52, Romain Naour <romain.naour@gmail.com> a ?crit :
>
> The commit [1] added a second LIBPAM_TACPLUS_AUTORECONF
> because we are now patching configure.ac.
> But LIBPAM_TACPLUS_AUTORECONF was already used because the
> package is fetched from github.
>
> [1] bd85d82f61af0578a64e74e1cfb56c3c1bf46fe1
>
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/849509860
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libpam-tacplus/libpam-tacplus.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/package/libpam-tacplus/libpam-tacplus.mk b/package/libpam-tacplus/libpam-tacplus.mk
> index 9dd8466bf2..b9630d8b37 100644
> --- a/package/libpam-tacplus/libpam-tacplus.mk
> +++ b/package/libpam-tacplus/libpam-tacplus.mk
> @@ -12,10 +12,9 @@ LIBPAM_TACPLUS_DEPENDENCIES = \
>         linux-pam \
>         $(if $(BR2_PACKAGE_OPENSSL),openssl)
>  # Fetching from github, we need to generate the configure script
> +# 0001-Add-an-option-to-disable-Werror.patch
>  LIBPAM_TACPLUS_AUTORECONF = YES
>  LIBPAM_TACPLUS_INSTALL_STAGING = YES
> -# We're patching configure.ac
> -LIBPAM_TACPLUS_AUTORECONF = YES
Thanks again
Reviewed-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  LIBPAM_TACPLUS_CONF_ENV = \
>         ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
>  LIBPAM_TACPLUS_CONF_OPTS = --disable-werror
> --
> 2.25.4
>
Best Regards,

Fabrice
