From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Apr 2020 09:49:07 +0200
Subject: [Buildroot] [PATCH 2/5] linux: add automatic nftables config
 selection
In-Reply-To: <20200330234616.1665466-2-aduskett@gmail.com>
References: <20200330234616.1665466-1-aduskett@gmail.com>
 <20200330234616.1665466-2-aduskett@gmail.com>
Message-ID: <20200407074907.GF22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-03-30 16:46 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Select the minimum amount of kernel features to enable nftables when the
> nftables package is selected.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  linux/linux.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 1927832e7e..3c797aab88 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -389,6 +389,10 @@ define LINUX_KCONFIG_FIXUP_CMDS
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER,$(@D)/.config)
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER,$(@D)/.config)
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES,$(@D)/.config))
> +	$(if $(BR2_PACKAGE_NFTABLES),
> +		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER,$(@D)/.config)
> +		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES,$(@D)/.config)
> +		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_INET,$(@D)/.config))

As you know, we have a pending series that moves such selections out of
linux.mk and into the corresponding packages.

As such, I'm not sure what to do with that patch for now. Since anyway
the rest of the series is (or will soon be) marked as changes requested,
I've done the same for that patch.

Regards,
Yann E. MORIN.

>  	$(if $(BR2_PACKAGE_XTABLES_ADDONS),
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED,$(@D)/.config)
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK,$(@D)/.config)
> -- 
> 2.25.1
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
