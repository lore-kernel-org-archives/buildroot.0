From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jun 2020 13:46:02 +0200
Subject: [Buildroot] [PATCH 01/10] package/systemd: move preset-all HOOK
 to fakeroot stage
In-Reply-To: <CAFvCimXcWJqe7oUKV0FsCk_=_RFRFtduG53=-1WxzP4vUEvxvg@mail.gmail.com>
References: <20200206093633.251413-1-nolange79@gmail.com>
 <20200206093633.251413-2-nolange79@gmail.com>
 <CAFvCimXcWJqe7oUKV0FsCk_=_RFRFtduG53=-1WxzP4vUEvxvg@mail.gmail.com>
Message-ID: <20200607114602.GQ13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?my, All,

On 2020-06-07 13:09 +0200, J?r?my ROSEN spake thusly:
> LGTM

Could you reply with actual reviewd-by or acked-by tags, please?

    https://buildroot.org/downloads/manual/manual.html#_reviewing_and_testing_patches

In the meantime, I'll assume your 'LGTM' here and in other patches, means
you provided your Reviewed-by tag. Thanks! :-)

Regards,
Yann E. MORIN.

> Le?jeu. 6 f?vr. 2020 ??10:36, Norbert Lange < [1]nolange79@gmail.com> a ?crit?:
> 
>   User can drop in more systemd units or presets
>   in an rootfs overlay, which will be copied over *after*
>   the TARGET_FINALIZE_HOOKS are run.
> 
>   Instead, run preset-all afterwards from ROOTFS_PRE_CMD_HOOKS
> 
>   Signed-off-by: Norbert Lange < [2]nolange79@gmail.com>
>   ---
>   ?package/systemd/ [3]systemd.mk | 2 +-
>   ?1 file changed, 1 insertion(+), 1 deletion(-)
> 
>   diff --git a/package/systemd/ [4]systemd.mk b/package/systemd/ [5]systemd.mk
>   index 6e31a14ac3..05b07cfd1b 100644
>   --- a/package/systemd/ [6]systemd.mk
>   +++ b/package/systemd/ [7]systemd.mk
>   @@ -490,7 +490,7 @@ endef
>   ?define SYSTEMD_PRESET_ALL
>   ? ? ? ? $(HOST_DIR)/bin/systemctl --root=$(TARGET_DIR) preset-all
>   ?endef
>   -SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_PRESET_ALL
>   +SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_PRESET_ALL
> 
>   ?SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
>   ?SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
>   --
>   2.24.1
> 
>   _______________________________________________
>   buildroot mailing list
>   [8]buildroot at busybox.net
>   [9]http://lists.busybox.net/mailman/listinfo/buildroot
> 
> --
> 
> +-----------------------------------------------------------------------------------------------------------------------+
> |                               | J?r?my ROSEN                                                                |
> | [10]3D"SMILE"[11] ?      | Architecte technique                                                                  |
> |                               | [12]3D"email" ? [13]jeremy.rosen at smile.fr?                                  |
> | 20 rue des Jardins            | [14]3D"phone" ? +33 6 88 25 87 42?                                          |
> | 92600 Asni?res-sur-Seine | [15]3D"url" ? [16]http://www.smile.eu                                            |
> |                               | [17]3D"Twitter" ? [18]3D"Facebook" ? [19]3D"LinkedIn" ? [20]3D"Github" |
> +-----------------------------------------------------------------------------------------------------------------------+
> 
> [21]3D"D?couvrez
> 
> Links:
> 1. mailto:nolange79 at gmail.com
> 2. mailto:nolange79 at gmail.com
> 3. http://systemd.mk
> 4. http://systemd.mk
> 5. http://systemd.mk
> 6. http://systemd.mk
> 7. http://systemd.mk
> 8. mailto:buildroot at busybox.net
> 9. http://lists.busybox.net/mailman/listinfo/buildroot
> 10. http://www.smile.eu/
> 11. http://www.smile.eu/
> 12. Image: http://ftp.smile.fr/client/Communication/signature/img/mail.png
> 13. mailto:jeremy.rosen at smile.fr
> 14. Image: http://ftp.smile.fr/client/Communication/signature/img/phone.png
> 15. Image: http://ftp.smile.fr/client/Communication/signature/img/web.png
> 16. http://www.smile.eu/
> 17. https://twitter.com/GroupeSmile
> 18. https://www.facebook.com/smileopensource
> 19. https://www.linkedin.com/company/smile
> 20. https://github.com/Smile-SA
> 21. https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
