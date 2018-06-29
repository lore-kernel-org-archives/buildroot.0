From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Jun 2018 08:57:03 +0200
Subject: [Buildroot] [PATCH] Revert "gnutls: drop wchar dependency"
In-Reply-To: <2e73bf6446b1a1a80569b0520a9f0e29d1fb2157.1530244618.git.baruch@tkos.co.il>
References: <2e73bf6446b1a1a80569b0520a9f0e29d1fb2157.1530244618.git.baruch@tkos.co.il>
Message-ID: <20180629085703.049c9895@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Jun 2018 06:56:58 +0300, Baruch Siach wrote:

> diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
> index 61b4b239ff82..ef995d21d2e0 100644
> --- a/package/gnutls/Config.in
> +++ b/package/gnutls/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_GNUTLS
>  	bool "gnutls"
>  	# https://gitlab.com/gnutls/gnutls/issues/203
>  	depends on !BR2_STATIC_LIBS
> +	depends on BR2_USE_WCHAR

Perhaps we should add a comment above this dependency to explain why it
is there, and avoid trying to remove it again in the future ? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
