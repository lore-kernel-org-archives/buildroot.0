From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Mon, 13 Dec 2010 23:23:05 +0100
Subject: [Buildroot] [PATCH] toolchain: speed up sysroot lib copying
In-Reply-To: <1292171120-32512-1-git-send-email-vapier@gentoo.org>
References: <1292171120-32512-1-git-send-email-vapier@gentoo.org>
Message-ID: <1292278985.12588.14.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dimanche 12 d?cembre 2010 ? 11:25 -0500, Mike Frysinger a ?crit :

>  	LIBS=`(cd $${ARCH_SYSROOT_DIR}; \
> -		find -L . -path "./lib/$${LIB}.*"     -o \
> +		find -L \
> +			  ./lib/ ./usr/lib/ ./usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/lib*/ \
> +			  -maxdepth 1 \
> +			  -path "./lib/$${LIB}.*"     -o \
>  			  -path "./usr/lib/$${LIB}.*" -o \
>  			  -path "./usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/lib*/$${LIB}.*" \
>  		)` ; \

Aren't we missing the locales files here ?

Like this one :

/usr/share/locale/fr/LC_MESSAGES/libc.mo

(I might be wrong...)

Regards,

--
Lionel Landwerlin
