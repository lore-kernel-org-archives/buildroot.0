From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 31 Dec 2018 18:21:02 +0100
Subject: [Buildroot] [PATCH 1/3] toolchain: add necessary options to
 support 4.20 kernel headers
In-Reply-To: <20181231160701.12086-2-thomas.petazzoni@bootlin.com>
References: <20181231160701.12086-1-thomas.petazzoni@bootlin.com>
 <20181231160701.12086-2-thomas.petazzoni@bootlin.com>
Message-ID: <d06a3599-fc15-75e5-bfad-cfea34567a26@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 31/12/2018 ? 17:06, Thomas Petazzoni a ?crit?:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  toolchain/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index bf8ed5bf5b..baf192c936 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -370,10 +370,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
>  	bool
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
>  
> +config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
> +	bool
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
> +
>  # This order guarantees that the highest version is set, as kconfig
>  # stops affecting a value on the first matching default.
>  config BR2_TOOLCHAIN_HEADERS_AT_LEAST
>  	string
> +	default "4.20" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
>  	default "4.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
>  	default "4.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
>  	default "4.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
> 

It seems you forgot to add a new entry in toolchain-external-custom package

See:
https://git.buildroot.net/buildroot/commit/?id=561770fd032744b4daac186c1ede9bce1d4b4c45

Otherwise the rest of the series is ok

Best regards,
Romain
