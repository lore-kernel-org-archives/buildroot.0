From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Nov 2013 19:07:49 +0100
Subject: [Buildroot] [PATCH v2 2/6] sysvinit: depend on SysV selected as
 init system.
In-Reply-To: <1379679847-16141-3-git-send-email-eric.le.bihan.dev@free.fr>
References: <1379679847-16141-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1379679847-16141-3-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20131102190749.74b5005f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Fri, 20 Sep 2013 14:24:03 +0200, Eric Le Bihan wrote:
> In order to prevent sysvinit and systemd to be selected at the same
> time, sysvinit can now only be selected if SysV is chosen as init
> system.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/sysvinit/Config.in |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/sysvinit/Config.in b/package/sysvinit/Config.in
> index 34ec391..d91c643 100644
> --- a/package/sysvinit/Config.in
> +++ b/package/sysvinit/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_SYSVINIT
>  	bool "sysvinit"
> +	depends on BR2_INIT_SYSV
>  	help
>  	  /sbin/init - parent of all processes

Hum, isn't this causing a circular dependency?

BR2_INIT_SYSV selects BR2_PACKAGE_SYSVINIT
BR2_PACKAGE_SYSVINIT depends on BR2_INIT_SYSV

but apparently, Kconfig doesn't complain, so it looks fine to me:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
