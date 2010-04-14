From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Apr 2010 15:17:41 +0200
Subject: [Buildroot] [PATCH 02/41] ncurses: convert to autotools
 infrastructure
In-Reply-To: <1271199974-30434-3-git-send-email-llandwerlin@gmail.com>
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
	<1271199974-30434-3-git-send-email-llandwerlin@gmail.com>
Message-ID: <20100414151741.4cf38f4d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Oops, I missed something here.

On Wed, 14 Apr 2010 01:05:35 +0200
llandwerlin at gmail.com wrote:

> +define NCURSES_PATCH_NCURSES_CONFIG
>  	$(SED) 's^prefix="^prefix="$(STAGING_DIR)^' \
>  		$(STAGING_DIR)/bin/ncurses5-config
> -	touch -c $@
> +endef
> +
> +NCURSES_POST_BUILD_HOOKS += NCURSES_PATCH_NCURSES_CONFIG

I don't understand how this can be a post-build hook. After build,
ncurses is not yet installed in $(STAGING_DIR). Shouldn't this be a
post-staging-install hook instead ?

And BTW, your patch 3/41 should probably be just folded into this 2/41
patch. But it's not really important.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
