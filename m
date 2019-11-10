From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Nov 2019 19:33:11 +0100
Subject: [Buildroot] [PATCH] package/jailhouse: fix misc details in
 Config.in
In-Reply-To: <20191110132627.15985-1-thomas.petazzoni@bootlin.com>
References: <20191110132627.15985-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191110183311.GY3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-11-10 14:26 +0100, Thomas Petazzoni spake thusly:
> This commit fixes a number of small minor details in the jailhouse
> Config.in file:
> 
>  - The Config.in comment is in the middle of the main
>    BR2_PACKAGE_JAILHOUSE option and its sub-options, causing the
>    sub-options to not be indented properly in menuconfig
> 
>  - jailhouse was capitalized as Jailhouse, while all Buildroot
>    packages in menuconfig use small letters, so use "jailhouse"
>    everywhere
> 
>  - no need to repeat "jailhouse" in the prompt of the sub-option for
>    helper scripts, since it is not properly indented under the main
>    jailhouse option.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks. I have however done a slight modification,
see below...

> ---
>  package/jailhouse/Config.in | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/jailhouse/Config.in b/package/jailhouse/Config.in
> index 5b9ecc7b7b..e792900d76 100644
> --- a/package/jailhouse/Config.in
> +++ b/package/jailhouse/Config.in
> @@ -1,5 +1,5 @@
>  config BR2_PACKAGE_JAILHOUSE
> -	bool "Jailhouse"
> +	bool "jailhouse"
>  	depends on BR2_aarch64 || BR2_x86_64
>  	depends on BR2_LINUX_KERNEL
>  	help
> @@ -7,21 +7,21 @@ config BR2_PACKAGE_JAILHOUSE
>  
>  	  https://github.com/siemens/jailhouse
>  
> -comment "Jailhouse needs a Linux kernel to be built"
> -	depends on BR2_aarch64 || BR2_x86_64
> -	depends on !BR2_LINUX_KERNEL
> -
>  if BR2_PACKAGE_JAILHOUSE
>  
>  config BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS
> -	bool "Jailhouse helper scripts"
> +	bool "helper scripts"
>  	depends on BR2_PACKAGE_PYTHON
>  	help
>  	  Python-based helpers for the Jailhouse Hypervisor.
>  
>  	  https://github.com/siemens/jailhouse
>  
> -comment "Jailhouse helper scripts require Python"
> +comment "jailhouse helper scripts require Python"

I've also dropped 'jailhouse' from this comment.

Regards,
Yann E. MORIN.

>  	depends on !BR2_PACKAGE_PYTHON
>  
>  endif
> +
> +comment "jailhouse needs a Linux kernel to be built"
> +	depends on BR2_aarch64 || BR2_x86_64
> +	depends on !BR2_LINUX_KERNEL
> -- 
> 2.21.0
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
