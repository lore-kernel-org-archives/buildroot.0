From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 7 Jan 2015 00:32:14 +0100
Subject: [Buildroot] [PATCH v2] linux: make custom versions and patches
	exclusive
In-Reply-To: <1420583119-30111-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1420583119-30111-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <20150106233214.GD17878@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vivien, All,

On 2015-01-06 17:25 -0500, Vivien Didelot spake thusly:
> When using a custom kernel (custom tarball, repository or local tree),
> we're using the OVERRIDE_SRCDIR internally, which means we do not apply
> patches. Since this is the expected behavior, show the
> LINUX_KERNEL_PATCH option only when using a vanilla kernel.
> 
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  linux/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index bf30426..9989b40 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -119,6 +119,9 @@ config BR2_LINUX_KERNEL_VERSION
>  
>  config BR2_LINUX_KERNEL_PATCH
>  	string "Custom kernel patches"
> +	depends on BR2_LINUX_KERNEL_LATEST_VERSION || \
> +		  BR2_LINUX_KERNEL_SAME_AS_HEADERS || \
> +		  BR2_LINUX_KERNEL_CUSTOM_VERSION
>  	help
>  	  A space-separated list of patches to apply to the
>  	  kernel. Each patch can be described as an URL, a local file
> -- 
> 2.2.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
