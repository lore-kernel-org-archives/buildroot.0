From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 08 Jul 2008 11:36:30 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
In-Reply-To: <20080708064006.1998A3C674@busybox.net>
References: <20080708064006.1998A3C674@busybox.net>
Message-ID: <4873351E.807@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

hamish at uclibc.org skrev:
> Author: hamish
> Date: 2008-07-07 23:40:05 -0700 (Mon, 07 Jul 2008)
> New Revision: 22683
> 
> Log:
> Don't $(CONFIG_UPDATE) openssl as it doesn't use autotools anyway
> 

Have you built an AVR32 rootfs without this?

I think you just broke openssl for the AVR32 architecture

Please revert, if you have not successfully tested on the AVR32.


BR
Ulf Samuelsson

> 
> Modified:
>    trunk/buildroot/package/openssl/openssl.mk
> 
> 
> Changeset:
> Modified: trunk/buildroot/package/openssl/openssl.mk
> ===================================================================
> --- trunk/buildroot/package/openssl/openssl.mk	2008-07-08 05:41:44 UTC (rev 22682)
> +++ trunk/buildroot/package/openssl/openssl.mk	2008-07-08 06:40:05 UTC (rev 22683)
> @@ -40,7 +40,6 @@
>  endif
>  	$(SED) '/CFLAG=/s,/;, $(shell echo '$(TARGET_CFLAGS)' | sed -e 's/\//\\\\\//g')/;,' \
>  		$(OPENSSL_DIR)/Configure
> -	$(CONFIG_UPDATE) $(OPENSSL_DIR)
>  	touch $@
>  
>  $(OPENSSL_DIR)/Makefile: $(OPENSSL_DIR)/.unpacked
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIczUeAyRRH5cXxqwRAkz1AKCRvMplkADs2PXkgqgOh0erHEQqqACePvEx
TlwO1/7RVqApO7tRx/g/xJc=
=RCvf
-----END PGP SIGNATURE-----
