From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 07 Apr 2014 23:01:06 +0200
Subject: [Buildroot] [PATCH] package/exim: uses fork(), needs an MMU
In-Reply-To: <1396903703-18845-1-git-send-email-yann.morin.1998@free.fr>
References: <1396903703-18845-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <53431212.9010104@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Le 07/04/2014 22:48, Yann E. MORIN a ?crit :
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Fixes:
>      http://autobuild.buildroot.net/results/95d/95ddd8e9be96f3808612db02642d72cfe77b3c26/
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>

Reviewed-by: Romain Naour<romain.naour@openwide.fr>

Best regards,
Romain

> ---
>   package/exim/Config.in | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/package/exim/Config.in b/package/exim/Config.in
> index 70038a2..a71106b 100644
> --- a/package/exim/Config.in
> +++ b/package/exim/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_EXIM
>   	bool "exim"
> +	depends on BR2_USE_MMU # fork()
>   	select BR2_PACKAGE_PCRE
>   	select BR2_PACKAGE_BERKELEYDB
>   	help
