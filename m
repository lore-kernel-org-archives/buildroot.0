From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 06 Feb 2013 11:15:18 -0300
Subject: [Buildroot] [PATCH 4/4] Make savedefconfig save to a configured
 file.
In-Reply-To: <41e27bc2d2881606d1da299f6056d24bc9d34e78.1360084128.git.arnout@mind.be>
References: <cover.1360084128.git.arnout@mind.be>
 <41e27bc2d2881606d1da299f6056d24bc9d34e78.1360084128.git.arnout@mind.be>
Message-ID: <51126576.3090303@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/05/2013 02:16 PM, Arnout Vandecappelle (Essensium/Mind) wrote:

>  source "arch/Config.in"
>  
> +config BR2_DEFCONFIG_FROM_ENV
> +	string
> +	option env="BR2_DEFCONFIG"
> +
> +config BR2_DEFCONFIG
> +	string "Location to save buildroot config"
> +	default BR2_DEFCONFIG_FROM_ENV if BR2_DEFCONFIG_FROM_ENV != ""
> +	default "$(CONFIG_DIR)/defconfig"
> +	help
> +	  When running 'make savedefconfig', the defconfig file will be saved
> +	  in this location.
> +
>  menu "Build options"

Any particular reason for this option to be on the toplevel menu?
It looks terrible there :)
Maybe build options?
Regards.
