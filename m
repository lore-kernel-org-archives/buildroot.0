From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Sun, 1 May 2011 18:43:14 +0200
Subject: [Buildroot] [PATCH 1/2] package: add jimtcl support
In-Reply-To: <87vcxuv2c6.fsf@macbook.be.48ers.dk>
References: <1304170969-30138-1-git-send-email-plagnioj@jcrosoft.com>
	<87vcxuv2c6.fsf@macbook.be.48ers.dk>
Message-ID: <20110501164314.GE1212@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>  Jean-Christophe> +	default BR2_TARGET_JIMTCL_GIT
>  Jean-Christophe> +	help
>  Jean-Christophe> +	  Select the specific jimtcl version you want to use
>  Jean-Christophe> +
>  Jean-Christophe> +config BR2_TARGET_JIMTCL_GIT
>  Jean-Christophe> +	bool "Official git"
>  Jean-Christophe> +
>  Jean-Christophe> +config BR2_TARGET_JIMTCL_GIT_CUSTOM
>  Jean-Christophe> +	bool "Custom"
> 
> Is there really a need to support anything else than 0.70? We prefer to
> only have 1 version as that simplified implementation and testing.
I do use the the HEAD personally
but the 0.70 is the last release I see project still using the previous one

I do use the custom git it offen as download from China or 3G is slow
And for dev I really like to be able to build my target from my own tree

I do not known yet how to implement it but, I get in my mind the idea to add
for the scm the same idea as for http download, the mirror mecanism
When you work offline or on slow internet network it's really good
> 
>  Jean-Christophe> +#############################################################
>  Jean-Christophe> +#
>  Jean-Christophe> +# jimtcl
>  Jean-Christophe> +#
>  Jean-Christophe> +#############################################################
>  Jean-Christophe> +JIMTCL_VERSION:=$(call qstrip,$(BR2_TARGET_JIMTCL_VERSION))
>  Jean-Christophe> +JIMTCL_SITE_METHOD:=git
> 
> Please use ' = ' rather than ':=' unless you have a special need for the
> direct expansion.
> 
>  Jean-Christophe> +DL_TOOLS_DEPENDENCIES += git
> 
> That's handled automatically.
> 
>  Jean-Christophe> +JIMTCL_INSTALL_STAGING = YES
>  Jean-Christophe> +JIMTCL_INSTALL_TARGET = NO
> 
> Why no installation on target?
no need of it for openocd we just link link to it staticly
> 
>  Jean-Christophe> +
>  Jean-Christophe> +OPENOCD_AUTORECONF = YES
> 
> This is JIMTCL, not OPENOCD.
> 
>  Jean-Christophe> +
>  Jean-Christophe> +JIMTCL_INSTALL_STAGING_OPT= DESTDIR=$(STAGING_DIR)/usr install
> 
> Does it really use autotools and have broken DESTDIR support?
yeah the --prefix is ignore, even if you pass --prefix=/usr it will install in
/include

Best Regards,
J.
