From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 25 Jan 2009 22:06:55 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/cups
In-Reply-To: <20090125205344.6649776D28@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Sun\, 25 Jan 2009 20\:53\:44 +0000 \(UTC\)")
References: <20090125205344.6649776D28@busybox.osuosl.org>
Message-ID: <87hc3ndrio.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-25 20:53:43 +0000 (Sun, 25 Jan 2009)
 ulf> New Revision: 25020

 ulf> Log:
 ulf> Make cups build, support perl/php option

 ulf> Modified:
 ulf>    trunk/buildroot/package/cups/cups.mk


 ulf>  	(cd $(CUPS_DIR) && \
 ulf>  		$(TARGET_CONFIGURE_OPTS) \
 ulf>  		$(TARGET_CONFIGURE_ARGS) \
 ulf> +		$(CUPS_CONF_ENV) \
 ulf> +		CFLAGS="$(CUPS_CFLAGS)" \
 ulf>  		./configure \
 ulf> -		--prefix=/usr $(CUPS_CONF_OPT_DBUS) --includedir=/usr/include  \
 ulf> -		--libdir=/usr/lib --disable-gnutls --disable-gssapi --host=$(ARCH) \ )
 ulf> +		--target=$(GNU_TARGET_NAME) \
 ulf> +		--host=$(GNU_TARGET_NAME) \
 ulf> +		--build=$(GNU_HOST_NAME) \
 ulf> +		--prefix=/usr \
 ulf> +		--includedir=/usr/include  \
 ulf> +		--libdir=/usr/lib \
 ulf> +		--exec-prefix=/ \

Shouldn't that be /usr?

 ulf> +		--bindir=/usr/bin \
 ulf> +		--sbindir=/usr/sbin \
 ulf> +		--libexecdir=/usr/lib \
 ulf> +		--sysconfdir=/etc \

And all of those should get set automatically by prefix.

 ulf> +		--with-config-file-path=/etc \
 ulf> +		--datadir=/usr/share/misc \
 ulf> +		--localstatedir=/var \
 ulf> +		--mandir=/usr/man \
 ulf> +		--infodir=/usr/info \
 ulf> +		--disable-gnutls \
 ulf> +		--disable-gssapi \
 ulf> +		$(CUPS_CONF_OPT) \
 ulf> +		)
 ulf>  	touch $@
 

-- 
Bye, Peter Korsgaard
