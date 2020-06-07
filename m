From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Sun, 7 Jun 2020 13:09:23 +0200
Subject: [Buildroot] [PATCH 01/10] package/systemd: move preset-all HOOK
 to fakeroot stage
In-Reply-To: <20200206093633.251413-2-nolange79@gmail.com>
References: <20200206093633.251413-1-nolange79@gmail.com>
 <20200206093633.251413-2-nolange79@gmail.com>
Message-ID: <CAFvCimXcWJqe7oUKV0FsCk_=_RFRFtduG53=-1WxzP4vUEvxvg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LGTM

Le jeu. 6 f?vr. 2020 ? 10:36, Norbert Lange <nolange79@gmail.com> a ?crit :

> User can drop in more systemd units or presets
> in an rootfs overlay, which will be copied over *after*
> the TARGET_FINALIZE_HOOKS are run.
>
> Instead, run preset-all afterwards from ROOTFS_PRE_CMD_HOOKS
>
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/systemd/systemd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 6e31a14ac3..05b07cfd1b 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -490,7 +490,7 @@ endef
>  define SYSTEMD_PRESET_ALL
>         $(HOST_DIR)/bin/systemctl --root=$(TARGET_DIR) preset-all
>  endef
> -SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_PRESET_ALL
> +SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_PRESET_ALL
>
>  SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
>  SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
> --
> 2.24.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
[image: SMILE]  <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine
*J?r?my ROSEN*
Architecte technique

[image: email] jeremy.rosen at smile.fr
[image: phone]  +33 6 88 25 87 42
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

[image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
<https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200607/50da848b/attachment-0001.html>
