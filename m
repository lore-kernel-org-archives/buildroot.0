From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 30 Jan 2014 13:16:05 -0300
Subject: [Buildroot] [PATCH 2/6] php: fix for external extensions
In-Reply-To: <87ob2ttpro.fsf@dell.be.48ers.dk>
References: <1390944391-3892-1-git-send-email-gustavo@zacarias.com.ar>	<1390944391-3892-2-git-send-email-gustavo@zacarias.com.ar>
 <87ob2ttpro.fsf@dell.be.48ers.dk>
Message-ID: <52EA7AC5.7040905@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/30/2014 01:09 PM, Peter Korsgaard wrote:
>  > +define PHP_EXTENSIONS_FIXUP
>  > +	$(SED) "/prefix/ s:/usr:$(STAGING_DIR)/usr:" \
>  > +		$(STAGING_DIR)/usr/bin/phpize
> 
> Can't we just add phpize to PHP_CONFIG_SCRIPTS?

See below...

>  > +	$(SED) "/extension_dir/ s:/usr:$(TARGET_DIR)/usr:" \
>  > +		$(STAGING_DIR)/usr/bin/php-config
> 
> Shouldn't this be s/TARGET_DIR/STAGING_DIR/?

No, that's where the extensions will be installed (no DESTDIR or similar
override in the Makefile), so just with this at least we can't do
PHP_CONFIG_SCRIPTS.
Regards.
