From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 14 Apr 2016 22:56:54 +0200
Subject: [Buildroot] [PATCH v13 24/26] package/freeswitch: enable mod_cv
In-Reply-To: <1460662320-1437-25-git-send-email-bernd.kuhls@t-online.de>
References: <1460662320-1437-1-git-send-email-bernd.kuhls@t-online.de>
 <1460662320-1437-25-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <CAHXCMMLMkZwaLGbgP7wpR4KXWW_p=kPtna=AZA6FSCN=4kdnAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Thu, Apr 14, 2016 at 9:31 PM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/freeswitch/freeswitch.mk | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
> index 2f3be17..8cd9b67 100644
> --- a/package/freeswitch/freeswitch.mk
> +++ b/package/freeswitch/freeswitch.mk
> @@ -246,6 +246,11 @@ FREESWITCH_DEPENDENCIES += libsoundtouch
>  FREESWITCH_ENABLED_MODULES += applications/mod_soundtouch
>  endif
>
> +ifeq ($(BR2_PACKAGE_OPENCV),y)
> +FREESWITCH_DEPENDENCIES += opencv
Just wondering: is freeswitch only compatible with opencv2?

> +FREESWITCH_ENABLED_MODULES += applications/mod_cv
> +endif
> +
>  ifeq ($(BR2_PACKAGE_UNIXODBC),y)
>  FREESWITCH_DEPENDENCIES += unixodbc
>  FREESWITCH_CONF_OPTS += \
> --
> 2.8.0.rc3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
