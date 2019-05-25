From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Sat, 25 May 2019 16:13:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/gpsd: fix
 BR2_PACKAGE_GPSD_MAX_{CLIENT, DEV} options
In-Reply-To: <20190525135241.9208-1-fontaine.fabrice@gmail.com>
References: <20190525135241.9208-1-fontaine.fabrice@gmail.com>
Message-ID: <CA+sos7-4cbd=RmXGg0RqZVEQO5kZ73HD5FNj0HzwiOaK0DLXCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabrice,

On Sat, May 25, 2019 at 3:52 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> limited_max_clients and limited_max_devices have been renamed in 3.12
> as max_clients and max_devices, respectively.
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gpsd/gpsd.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
> index 0a17ddc93e..d2c7612526 100644
> --- a/package/gpsd/gpsd.mk
> +++ b/package/gpsd/gpsd.mk
> @@ -195,10 +195,10 @@ ifeq ($(BR2_PACKAGE_GPSD_FIXED_PORT_SPEED),y)
>  GPSD_SCONS_OPTS += fixed_port_speed=$(BR2_PACKAGE_GPSD_FIXED_PORT_SPEED_VALUE)
>  endif
>  ifeq ($(BR2_PACKAGE_GPSD_MAX_CLIENT),y)
> -GPSD_SCONS_OPTS += limited_max_clients=$(BR2_PACKAGE_GPSD_MAX_CLIENT_VALUE)
> +GPSD_SCONS_OPTS += max_clients=$(BR2_PACKAGE_GPSD_MAX_CLIENT_VALUE)
>  endif
>  ifeq ($(BR2_PACKAGE_GPSD_MAX_DEV),y)
> -GPSD_SCONS_OPTS += limited_max_devices=$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
> +GPSD_SCONS_OPTS += max_devices=$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
>  endif
>
>  GPSD_SCONS_ENV += LDFLAGS="$(GPSD_LDFLAGS)" CFLAGS="$(GPSD_CFLAGS)"
> --
> 2.20.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Reviewed-by: Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com>

Best regards,
Beno?t
