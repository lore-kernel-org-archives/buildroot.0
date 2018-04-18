From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Apr 2018 17:11:25 +0200
Subject: [Buildroot] [PATCH 3/3] dropbear: Disable insecure options
In-Reply-To: <20180418142434.7268-3-stefan.sorensen@spectralink.com>
References: <20180418142434.7268-1-stefan.sorensen@spectralink.com>
 <20180418142434.7268-3-stefan.sorensen@spectralink.com>
Message-ID: <20180418171125.1e316051@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Apr 2018 16:24:34 +0200, Stefan S?rensen wrote:

>  config BR2_PACKAGE_DROPBEAR_CIPHER_3DES
>  	bool "3DES"
> -	default y
> +	default n

"default n" is the default, so it's not needed. You can therefore
simply remove those "default y" lines instead of replacing them with
"default n". And perhaps extend the help text of those options to say
that those ciphers/hashes are considered insecure.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
