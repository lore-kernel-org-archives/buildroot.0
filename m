From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 30 Jan 2014 17:40:07 +0100
Subject: [Buildroot] [PATCH 2/6] php: fix for external extensions
In-Reply-To: <52EA7AC5.7040905@zacarias.com.ar> (Gustavo Zacarias's message of
 "Thu, 30 Jan 2014 13:16:05 -0300")
References: <1390944391-3892-1-git-send-email-gustavo@zacarias.com.ar>
 <1390944391-3892-2-git-send-email-gustavo@zacarias.com.ar>
 <87ob2ttpro.fsf@dell.be.48ers.dk> <52EA7AC5.7040905@zacarias.com.ar>
Message-ID: <87k3dhtod4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > On 01/30/2014 01:09 PM, Peter Korsgaard wrote:
 >> > +define PHP_EXTENSIONS_FIXUP
 >> > +	$(SED) "/prefix/ s:/usr:$(STAGING_DIR)/usr:" \
 >> > +		$(STAGING_DIR)/usr/bin/phpize
 >> 
 >> Can't we just add phpize to PHP_CONFIG_SCRIPTS?

 > See below...

 >> > +	$(SED) "/extension_dir/ s:/usr:$(TARGET_DIR)/usr:" \
 >> > +		$(STAGING_DIR)/usr/bin/php-config
 >> 
 >> Shouldn't this be s/TARGET_DIR/STAGING_DIR/?

 > No, that's where the extensions will be installed (no DESTDIR or similar
 > override in the Makefile), so just with this at least we can't do
 > PHP_CONFIG_SCRIPTS.

Ok - So to conclude, we need the manual php-config change, but the
phpize change can be done with PHP_CONFIG_SCRIPTS?

-- 
Bye, Peter Korsgaard
