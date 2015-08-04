From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Aug 2015 21:12:56 +0200
Subject: [Buildroot] [PATCH 1/9] toolchain: add common gcc version
 hidden config options
In-Reply-To: <1438711241-31792-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1438711241-31792-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1438711241-31792-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150804191256.GT3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-08-04 20:00 +0200, Thomas Petazzoni spake thusly:
> This commit adds a number of hidden Config.in options, that will be
> used to handle dependencies on the gcc version. We mimic the model
> that was used for the kernel headers dependency mechanism.
> 
> These hidden options will be selected by the internal and external
> toolchain backend logic respectively, in follow-up commits.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  toolchain/toolchain-common.in | 44 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
> index b7a11a4..4be55c3 100644
> --- a/toolchain/toolchain-common.in
> +++ b/toolchain/toolchain-common.in
> @@ -254,3 +254,47 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST
>  	default "3.1"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
>  	default "3.0"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
>  	default "2.6"
> +
> +config BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
> +	bool
> +
> +config BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
> +	bool
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
> +
> +config BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
> +	bool
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
> +
> +config BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
> +	bool
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
> +
> +config BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> +	bool
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
> +
> +config BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +	bool
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> +
> +config BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +	bool
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +
> +config BR2_TOOLCHAIN_GCC_AT_LEAST_5
> +	bool
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +
> +# This order guarantees that the highest version is set, as kconfig
> +# stops affecting a value on the first matching default.
> +config BR2_TOOLCHAIN_GCC_AT_LEAST
> +	string
> +	default "5"	if BR2_TOOLCHAIN_GCC_AT_LEAST_5
> +	default "4.9"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +	default "4.8"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +	default "4.7"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> +	default "4.6"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
> +	default "4.5"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
> +	default "4.4"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
> +	default "4.3"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
> -- 
> 2.5.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
