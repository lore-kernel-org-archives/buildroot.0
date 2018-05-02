From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 May 2018 14:52:00 +0200
Subject: [Buildroot] [PATCH] Config.in: add BR2_HOST_GCC_AT_LEAST_8
In-Reply-To: <20180502100904.29985-1-chemobejk@gmail.com>
References: <20180502100904.29985-1-chemobejk@gmail.com>
Message-ID: <20180502145200.305cbbac@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 May 2018 13:09:04 +0300, Stefan Becker wrote:
> Fedora 28 switched to GCC 8.x.
> 
> Signed-off-by: Stefan Becker <chemobejk@gmail.com>
> ---
>  Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Config.in b/Config.in
> index 62d2dc3473..0d24ba6ebc 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -62,6 +62,12 @@ config BR2_HOST_GCC_AT_LEAST_7
>  	default y if BR2_HOST_GCC_VERSION = "7"
>  	select BR2_HOST_GCC_AT_LEAST_6
>  
> +config BR2_HOST_GCC_AT_LEAST_8
> +	bool
> +	default y if BR2_HOST_GCC_VERSION = "8"
> +	select BR2_HOST_GCC_AT_LEAST_7
> +
> +

One too many empty line here, which caused a check-package warning.
I've fixed that and applied. Thanks!

Peter: I belive we want to backport this patch to 2018.02.x.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
