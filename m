From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2020 13:06:51 +0100
Subject: [Buildroot] [PATCH] package/busybox: fix individual binaries
 installation
In-Reply-To: <20200223105912.1158-1-unixmania@gmail.com>
References: <20200223105912.1158-1-unixmania@gmail.com>
Message-ID: <20200223120651.GO8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2020-02-23 07:59 -0300, unixmania at gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> 
> Call BUSYBOX_INSTALL_INDIVIDUAL_BINARIES in BUSYBOX_INSTALL_TARGET_CMDS,
> not in BUSYBOX_INSTALL_INIT_SYSV. This should have been done in commit
> b1e07d6d796e67a980d4a05d04c64f00162245ff but was somehow lost during the
> review/aply process.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/busybox/busybox.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 6283bc96ea..dfcd9d392c 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -349,6 +349,7 @@ define BUSYBOX_INSTALL_TARGET_CMDS
>  	# Use the 'noclobber' install rule, to prevent BusyBox from overwriting
>  	# any full-blown versions of apps installed by other packages.
>  	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) install-noclobber
> +	$(BUSYBOX_INSTALL_INDIVIDUAL_BINARIES)
>  	$(BUSYBOX_INSTALL_INITTAB)
>  	$(BUSYBOX_INSTALL_UDHCPC_SCRIPT)
>  	$(BUSYBOX_INSTALL_MDEV_CONF)
> @@ -360,7 +361,6 @@ define BUSYBOX_INSTALL_INIT_SYSV
>  	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
>  	$(BUSYBOX_INSTALL_SYSCTL_SCRIPT)
>  	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
> -	$(BUSYBOX_INSTALL_INDIVIDUAL_BINARIES)
>  endef
>  
>  # Checks to give errors that the user can understand
> -- 
> 2.18.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
