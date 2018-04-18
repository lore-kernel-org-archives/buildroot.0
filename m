From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Apr 2018 17:10:31 +0200
Subject: [Buildroot] [PATCH 2/3] dropbear: Add configuration options for
 security features
In-Reply-To: <20180418142434.7268-2-stefan.sorensen@spectralink.com>
References: <20180418142434.7268-1-stefan.sorensen@spectralink.com>
 <20180418142434.7268-2-stefan.sorensen@spectralink.com>
Message-ID: <20180418171031.013dbdac@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Apr 2018 16:24:33 +0200, Stefan S?rensen wrote:
> The dropbear server provides no runtime configuration of ciphers, key
> exchange algorithms, etc., but must rather be configured compile time.
> With no configurability the default settings will be use which may not
> be desired in all scenearios.
> 
> These new options allow the selection of
>   Ciphers (AES128, AES256, 3DES, BLowfish, Twofish128, Twofish256)
>   Cipher modes (CBC, CTR)
>   Integrity algorithms (SHA1, SHA1-96, SHA2-256, SHA2-512, MD5)
>   Key exchange algorithms (RSA, DSS, ECDSA, Curve25519, ECDH)
>   Authenticaton types (Password, Pubkey)
> 
> No defaults are changed.
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>

We received PATCH 2/3 and 3/3, but not 1/3. Was it sent ? Is it a
mistake ?

> +config BR2_PACKAGE_DROPBEAR_CIPHER_BLOWFISH
> +	bool "Blowfish"
> +	default y	if !BR2_PACKAGE_DROPBEAR_SMALL

No need for a tab before the "if".

Is it possible to enable this option even if
BR2_PACKAGE_DROPBEAR_SMALL=y ? I.e, does it build ?

> +menu "Dropbear authenticaton types"

authentication

Did you do a pass with ./utils/check-package on package/dropbear/*
after doing those changes ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
