From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 23:18:12 +0100
Subject: [Buildroot] [PATCH] midori: enable optional gcr support
In-Reply-To: <1452077866-23181-1-git-send-email-gustavo@zacarias.com.ar>
References: <1452077866-23181-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CACXmVibpGnkG1UE932fGT+MGJwxWB_mZzbRaSO77UB5kwakV4w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 6, 2016 at 11:57 AM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> Only used/useful with the gtk3 backend though.
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks

> ---
>  package/midori/midori.mk | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/midori/midori.mk b/package/midori/midori.mk
> index 197f51a..7927400 100644
> --- a/package/midori/midori.mk
> +++ b/package/midori/midori.mk
> @@ -40,6 +40,10 @@ endif
>  ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
>  MIDORI_CONF_OPTS += -DUSE_GTK3=ON -DHALF_BRO_INCOM_WEBKIT2=ON
>  MIDORI_DEPENDENCIES += libgtk3
> +# Only useful with gtk3
> +ifeq ($(BR2_PACKAGE_GCR),y)
> +MIDORI_DEPENDENCIES += gcr
> +endif
>  else
>  MIDORI_CONF_OPTS += -DUSE_GTK3=OFF
>  MIDORI_DEPENDENCIES += libgtk2
> --
> 2.4.10
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Bye, Peter Korsgaard
