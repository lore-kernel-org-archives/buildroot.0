From: Vadim Kochan <vadim4j@gmail.com>
Date: Sun, 13 Jan 2019 21:50:47 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/gettext-tiny: Add new package
In-Reply-To: <20190105200046.31512-4-vadim4j@gmail.com>
References: <20190105200046.31512-1-vadim4j@gmail.com>
 <20190105200046.31512-4-vadim4j@gmail.com>
Message-ID: <20190113195047.v5e75zb6hx42u3cf@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

> +comment "gettext requires NLS enabled"
> +	depends on !BR2_SYSTEM_ENABLE_NLS
> +
>  config BR2_PACKAGE_PROVIDES_HOST_GETTEXT
>  	string
> -	default "host-gettext-gnu"
> -
> -endif
> +	default "host-gettext-gnu" if BR2_SYSTEM_ENABLE_NLS
> +	default "host-gettext-tiny" if !BR2_SYSTEM_ENABLE_NLS

I really think that for a while it is better to make allow select host-gettext-tiny
optionally, because there might be issues with some packages. After it
will be stable it is safe to select it automatically if !BR2_SYSTEM_ENABLE_NLS.

Regards,
Vadim Kochan
