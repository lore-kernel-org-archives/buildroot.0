From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 13 Dec 2010 08:32:59 -0500
Subject: [Buildroot] host-ncurses: cannot find -lstdc++
In-Reply-To: <1292244531.6496.9.camel@dubciaranr0.verifone.com>
References: <1292003086.27164.12.camel@dubciaranr0.verifone.com>
	<AANLkTinbFX4PnSW5KsJ+Nog2y9jenymiUU7X-t7gQmcB@mail.gmail.com>
	<1292244531.6496.9.camel@dubciaranr0.verifone.com>
Message-ID: <201012130833.01542.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, December 13, 2010 07:48:51 Quotient Remainder wrote:
> --- a/package/ncurses/ncurses.mk
> +++ b/package/ncurses/ncurses.mk
>  define NCURSES_BUILD_CMDS
> -       $(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR)
> +       PATH=$(HOST_DIR)/usr/bin:$(PATH) $(MAKE1) -C $(@D)
> DESTDIR=$(STAGING_DIR)

there's already a HOST_PATH for you to leverage

> +define HOST_NCURSES_PATCH_NCURSES_CONFIG
> +       $(SED) 's^prefix="^prefix="$(HOST_DIR)^' \
> +               $(HOST_DIR)/usr/bin/ncurses5-config
> +endef

doesnt package/Makefile.autotools.in already set prefix to the host dir ?  so 
is this really necessary ?
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101213/f47df52b/attachment.pgp>
