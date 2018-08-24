From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 23:02:33 +0200
Subject: [Buildroot] [PATCH/next 3/3] linux-headers: drop old
 unsupported 4.x versions
In-Reply-To: <20180824184133.8508-3-bernd.kuhls@t-online.de>
References: <20180824184133.8508-1-bernd.kuhls@t-online.de>
 <20180824184133.8508-3-bernd.kuhls@t-online.de>
Message-ID: <20180824230233.7a7e0a24@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Aug 2018 20:41:33 +0200, Bernd Kuhls wrote:
> These versions received their last updated more than three months ago
> and are no longer supported according to
> https://www.kernel.org/category/releases.html, so drop them and add
> legacy entries.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  Config.in.legacy                     | 53 ++++++++++++++++++++++++++++
>  package/linux-headers/Config.in.host | 25 -------------
>  2 files changed, 53 insertions(+), 25 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 29d5b6adcc..8c61d803da 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -142,6 +142,59 @@ comment "unpredictable ways.                                 "
>  comment "----------------------------------------------------"
>  endif
>  
> +###############################################################################
> +comment "Legacy options removed in 2018.11"
> +
> +config BR2_KERNEL_HEADERS_4_10
> +	bool "kernel headers version 4.10.x are no longer supported"
> +	select BR2_KERNEL_HEADERS_4_14

I think it makes more sense to automatically select some *older* kernel
headers. Indeed, if the user was using 4.10 kernel headers, presumably
he is using some 4.10/4.11/4.12 kernel, so if we upgrade the kernel
headers to 4.14... the new build may not work at runtime, the kernel
headers being more recent than the running kernel.

So instead for 4.10, 4.11, 4.12 and 4.13, I've changed to select the
4.9 kernel headers instead.

Applied to next with this change.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
