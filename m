From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 14 Jun 2016 09:45:51 -0400
Subject: [Buildroot] [PATCH v4 1/1] fwup: blanked out HELP2MAN_PATH
 autoconf value
In-Reply-To: <20160613221507.29556-1-jordan@yelloz.me>
References: <20160613052640.6977-1-jordan@yelloz.me>
 <20160613221507.29556-1-jordan@yelloz.me>
Message-ID: <CA+-urNQZ-Z_UfCx9xXeT0MFApQWgce0owVKrPYEE_akrXVq7Ug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 13, 2016 at 6:15 PM, Jordan Yelloz <jordan@yelloz.me> wrote:
> If you have help2man installed, the build system will try to run
> help2man on the target fwup binary which should not be expected to work.
>
> Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
> ---
>  package/fwup/fwup.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/fwup/fwup.mk b/package/fwup/fwup.mk
> index 0f857fc..814ca00 100644
> --- a/package/fwup/fwup.mk
> +++ b/package/fwup/fwup.mk
> @@ -10,6 +10,7 @@ FWUP_LICENSE = Apache-2.0
>  FWUP_LICENSE_FILES = LICENSE
>  FWUP_DEPENDENCIES = libconfuse libarchive libsodium
>  FWUP_AUTORECONF = YES
> +FWUP_CONF_ENV = ac_cv_path_HELP2MAN=

This change fixes the issue with help2man being installed on the host for me.

Tested-by: Frank Hunleth <fhunleth@troodon-software.com>

>
>  define FWUP_ADD_M4_DIR
>         mkdir -p $(@D)/m4
> --
> 2.8.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
