From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 Mar 2012 10:11:13 -0300
Subject: [Buildroot] [PATCH 2/2] ushare: new package
In-Reply-To: <87aa3a3y17.fsf@macbook.be.48ers.dk>
References: <1332331352-6072-1-git-send-email-gustavo@zacarias.com.ar>
 <1332331352-6072-2-git-send-email-gustavo@zacarias.com.ar>
 <87aa3a3y17.fsf@macbook.be.48ers.dk>
Message-ID: <a7a94ea908fc11336620babf31b8b40e@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-21 10:04, Peter Korsgaard wrote:

>  Gustavo> +define USHARE_CONFIGURE_CMDS
>  Gustavo> +	(cd $(@D); \
>  Gustavo> +		$(TARGET_CONFIGURE_OPTS) \
>  Gustavo> +		./configure --prefix=/usr $(DISABLE_NLS) --cross-compile 
> \
>  Gustavo> +		--cross-prefix="$(TARGET_CROSS)" --sysconfdir=/etc \
>  Gustavo> +		--disable-strip --disable-debug \
>  Gustavo> +	)
>  Gustavo> +endef
>  Gustavo> +
>  Gustavo> +define USHARE_INSTALL_TARGET_CMDS
>  Gustavo> +	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
>  Gustavo> +	rm -f $(TARGET_DIR)/etc/init.d/ushare
>  Gustavo> +endef
>
> Why the custom configure and install steps?

It's not autoconf and it'll bail out on unknown options.
So basically s/AUTOTARGETS/GENTARGETS/ :)
Regards.
