From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 13 Apr 2021 21:14:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/systemd: fix /etc/resolv.conf
 link on per-package build
In-Reply-To: <20210411194602.994785-1-fontaine.fabrice@gmail.com>
References: <20210411194602.994785-1-fontaine.fabrice@gmail.com>
Message-ID: <20210413191456.GD359705@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-04-11 21:46 +0200, Fabrice Fontaine spake thusly:
> Fixes:
>  - https://bugs.buildroot.org/show_bug.cgi?id=13271
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

This commit rang a bell here, until I saw the last comment in that bug.
Of course. ;-)

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/systemd/systemd.mk | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 41332f207a..74c561e67e 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -523,8 +523,7 @@ endef
>  
>  SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
>  	SYSTEMD_INSTALL_INIT_HOOK \
> -	SYSTEMD_INSTALL_MACHINEID_HOOK \
> -	SYSTEMD_INSTALL_RESOLVCONF_HOOK
> +	SYSTEMD_INSTALL_MACHINEID_HOOK
>  
>  define SYSTEMD_INSTALL_IMAGES_CMDS
>  	$(SYSTEMD_INSTALL_BOOT_FILES)
> @@ -556,7 +555,9 @@ define SYSTEMD_INSTALL_NSSCONFIG_HOOK
>  		$(TARGET_DIR)/etc/nsswitch.conf
>  endef
>  
> -SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_INSTALL_NSSCONFIG_HOOK
> +SYSTEMD_TARGET_FINALIZE_HOOKS += \
> +	SYSTEMD_INSTALL_NSSCONFIG_HOOK \
> +	SYSTEMD_INSTALL_RESOLVCONF_HOOK
>  
>  ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
>  # systemd provides multiple units to autospawn getty as neede
> -- 
> 2.30.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
