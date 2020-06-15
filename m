From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Jun 2020 11:46:43 +0200
Subject: [Buildroot] [PATCH v2 03/14] package/systemd: create "remote"
 user if the feature is enabled
In-Reply-To: <20200615072055.2083-4-nolange79@gmail.com>
References: <20200615072055.2083-1-nolange79@gmail.com>
 <20200615072055.2083-4-nolange79@gmail.com>
Message-ID: <20200615094643.GV2346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2020-06-15 09:20 +0200, Norbert Lange spake thusly:
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> Reviewed-by: J?r?my Rosen <jeremy.rosen@smile.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/systemd/systemd.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 8e82d8afa7..ead4e70f95 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -214,6 +214,7 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE),y)
>  SYSTEMD_CONF_OPTS += -Dremote=true
> +SYSTEMD_REMOTE_USER = systemd-journal-remote -1 systemd-journal-remote -1 * /var/log/journal/remote - - Journal Remote
>  else
>  SYSTEMD_CONF_OPTS += -Dremote=false
>  endif
> @@ -502,7 +503,7 @@ define SYSTEMD_USERS
>  	- - systemd-journal -1 * - - - Journal
>  	- - render -1 * - - - DRI rendering nodes
>  	- - kvm -1 * - - - kvm nodes
> -	systemd-journal-remote -1 systemd-journal-remote -1 * /var/log/journal/remote - - Journal Remote
> +	$(SYSTEMD_REMOTE_USER)
>  	$(SYSTEMD_COREDUMP_USER)
>  	$(SYSTEMD_NETWORKD_USER)
>  	$(SYSTEMD_RESOLVED_USER)
> -- 
> 2.27.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
