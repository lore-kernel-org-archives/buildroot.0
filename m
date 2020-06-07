From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jun 2020 13:47:17 +0200
Subject: [Buildroot] [PATCH 01/10] package/systemd: move preset-all HOOK
 to fakeroot stage
In-Reply-To: <20200206093633.251413-2-nolange79@gmail.com>
References: <20200206093633.251413-1-nolange79@gmail.com>
 <20200206093633.251413-2-nolange79@gmail.com>
Message-ID: <20200607114717.GR13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2020-02-06 10:36 +0100, Norbert Lange spake thusly:
> User can drop in more systemd units or presets
> in an rootfs overlay, which will be copied over *after*
> the TARGET_FINALIZE_HOOKS are run.
> 
> Instead, run preset-all afterwards from ROOTFS_PRE_CMD_HOOKS
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

Appied to master, thanks.

Regards,
Yann E. MORIN.

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
>  	$(HOST_DIR)/bin/systemctl --root=$(TARGET_DIR) preset-all
>  endef
> -SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_PRESET_ALL
> +SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_PRESET_ALL
>  
>  SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
>  SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
> -- 
> 2.24.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
