From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 02 Jan 2009 23:33:43 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/socat
In-Reply-To: <877i5e2i9e.fsf@macbook.be.48ers.dk>
References: <20090102082932.46BD0769FA@busybox.osuosl.org>
	<877i5e2i9e.fsf@macbook.be.48ers.dk>
Message-ID: <1230935623.8886.19.camel@linux-yrgm.site>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2009-01-02 klockan 10:02 +0100 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
> Hi,
> 
>  ulf>  	  http://www.dest-unreach.org/socat/
>  ulf> +if BR2_PACKAGE_SOCAT
>  ulf> +config BR2_PACKAGE_SOCAT_PREDEF_CRDLY_SHIFT
>  ulf> +	string "CRDLY_SHIFT"
>  ulf> +	default "9"
>  ulf> +	help
>  ulf> +	  Add configure variable
>  ulf> +
>  ulf> +config BR2_PACKAGE_SOCAT_PREDEF_TABDLY_SHIFT
>  ulf> +	string "TABDLY_SHIFT"
>  ulf> +	default "11"
>  ulf> +	help
>  ulf> +	  Add configure variable
> 
> That's not very descriptive.

I have little clue of what it is used for
except some kind of delay when a TAB character is received
Old socat version breaks for some reason and it is really ancient.
socat configure is not able to build without it
The socat source contains defaults for Linux-2.6.24,
and the documentation recommends using this
if configure cannot deduct a resonable value.



>  
>  ulf>  $(SOCAT_WORKDIR)/Makefile: $(SOCAT_DIR)/.unpacked
>  ulf> @@ -30,6 +53,7 @@
>  ulf>  	(cd $(SOCAT_WORKDIR); rm -rf config.cache; \
>  ulf>  		$(TARGET_CONFIGURE_OPTS) \
>  ulf>  		$(TARGET_CONFIGURE_ARGS) \
>  ulf> +		$(SOCAT_CONFIGURE_OPTS) \
>  ulf>  		$(SOCAT_DIR)/configure \
>  ulf>  		--target=$(GNU_TARGET_NAME) \
>  ulf>  		--host=$(GNU_TARGET_NAME) \
> 
> How about converting it to Makefile.autotools.in format while you're
> at it?

Lots of things to do, and this has less priority
than fixing U-boot for AT91/at91bootstrap etc.

/Ulf
