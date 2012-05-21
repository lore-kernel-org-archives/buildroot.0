From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 21 May 2012 10:06:41 +0200
Subject: [Buildroot] [PATCH 1/3] Convert gettext to autotargets
In-Reply-To: <87k407lu8m.fsf@macbook.be.48ers.dk>
References: <4F7C6130.102@free-electrons.com>
 <1336475958-5714-1-git-send-email-s.martin49@gmail.com>
 <87k407lu8m.fsf@macbook.be.48ers.dk>
Message-ID: <4FB9F791.20809@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 19/05/2012 23:46, Peter Korsgaard a ?crit :
>>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:
>  Samuel> From: Maxime Ripard <maxime.ripard@free-electrons.com>
>  Samuel> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>  Samuel> Acked-by: Samuel Martin <s.martin49@gmail.com>
>  Samuel> ---
> 
>  Samuel> -$(GETTEXT_DIR)/$(GETTEXT_BINARY): $(GETTEXT_DIR)/.configured
>  Samuel> -	$(MAKE) -C $(GETTEXT_DIR)
>  Samuel> -	touch -c $(GETTEXT_DIR)/$(GETTEXT_BINARY)
>  Samuel> +define GETTEXT_REMOVE_BINARIES
>  Samuel> +	rm -f $(TARGET_DIR)/usr/bin/gettext
>  Samuel> +	rm -f $(TARGET_DIR)/usr/bin/gettext.sh
>  Samuel> +	rm -f $(TARGET_DIR)/usr/bin/gettextize
>  Samuel> +endef
> 
>  Samuel>  ifeq ($(BR2_PACKAGE_LIBINTL),y)
>  Samuel> +	GETTEXT_POST_INSTALL_TARGET_HOOKS += GETTEXT_REMOVE_BINARIES
>  Samuel>  endif
>  Samuel> +
> 
> This seems backwards. Wouldn't you want to keep the binaries if libintl
> is enabled?

What looks backward to me is that libintl is there even if
BR2_PACKAGE_LIBINTL is not enabled...


-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
