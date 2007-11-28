From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Wed, 28 Nov 2007 08:07:40 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/alsa-lib
In-Reply-To: <20071128070957.BE0E63005D@busybox.net>
References: <20071128070957.BE0E63005D@busybox.net>
Message-ID: <1196233660.10698.8.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2007-11-27 at 23:09 -0800, ulf at uclibc.org wrote:
> Author: ulf
> Date: 2007-11-27 23:09:57 -0800 (Tue, 27 Nov 2007)
> New Revision: 20557
> 
> Log:
> Add '-mabi=aapcs-linux' to CFLAGS in 'alsa-lib' to be compatible w kernel
> 
> Modified:
>    trunk/buildroot/package/alsa-lib/alsa-lib.mk
> 
> 
> Changeset:
> Modified: trunk/buildroot/package/alsa-lib/alsa-lib.mk
> ===================================================================
> --- trunk/buildroot/package/alsa-lib/alsa-lib.mk	2007-11-28 06:49:42 UTC (rev 20556)
> +++ trunk/buildroot/package/alsa-lib/alsa-lib.mk	2007-11-28 07:09:57 UTC (rev 20557)
> @@ -24,7 +24,7 @@
>  	(cd $(ALSA_LIB_DIR); rm -rf config.cache; \
>  		$(TARGET_CONFIGURE_ARGS) \
>  		$(TARGET_CONFIGURE_OPTS) \
> -		CFLAGS="$(TARGET_CFLAGS)" \
> +		CFLAGS="$(TARGET_CFLAGS) -mabi=aapcs-linux" \

Eh, NO! Add it to the TARGET_CFLAGS for architectures supporting this
flag.

>  		LDFLAGS="$(TARGET_LDFLAGS)" \
>  		./configure \
>  		--target=$(GNU_TARGET_NAME) \

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
