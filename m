From: Heiko Thiery <Heiko.Thiery@kontron.com>
Date: Wed, 4 Dec 2019 13:15:58 +0000
Subject: [Buildroot] [PATCH 2/7] sysrepo: fix a typo when installing
 with systemd
In-Reply-To: <9e6a587f377bd63fc0361934d3ea88bc50ef075a.1575456104.git.jan.kundrat@cesnet.cz>
References: <cover.1575456104.git.jan.kundrat@cesnet.cz>
 <9e6a587f377bd63fc0361934d3ea88bc50ef075a.1575456104.git.jan.kundrat@cesnet.cz>
Message-ID: <b6ba1ad82fc149f4a439e4a6de0e63d6@kontron.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> -----Urspr?ngliche Nachricht-----
> Von: buildroot [mailto:buildroot-bounces at busybox.net] Im Auftrag von Jan
> Kundr?t
> Gesendet: Mittwoch, 4. Dezember 2019 10:06
> An: buildroot at buildroot.org
> Cc: Heiko Thiery; Fabrice Fontaine
> Betreff: [Buildroot] [PATCH 2/7] sysrepo: fix a typo when installing with
> systemd
> 
> Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>

Acked-by: Heiko Thiery <heiko.thiery@kontron.com

> ---
>  package/sysrepo/sysrepo.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk index
> 8676158a19..49c908d62d 100644
> --- a/package/sysrepo/sysrepo.mk
> +++ b/package/sysrepo/sysrepo.mk
> @@ -42,7 +42,7 @@ define SYSREPO_INSTALL_INIT_SYSV  endef
> 
>  define SYSREPO_INSTALL_INIT_SYSTEMD
> -	mkdir -p $(TARGET_DIR)/etc/systemd/systemd/multi-user.target.wants
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>  	ln -fs ../../../../usr/lib/systemd/system/sysrepod.service \
>  		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>  	ln -fs ../../../../usr/lib/systemd/system/sysrepo-plugind.service \
> --
> 2.21.0
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
