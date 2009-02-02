From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Feb 2009 13:25:54 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libeXosip2
In-Reply-To: <20090202072449.30556764CB@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Mon\, 2 Feb 2009 07\:24\:49 +0000 \(UTC\)")
References: <20090202072449.30556764CB@busybox.osuosl.org>
Message-ID: <87bptlgh4d.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-02-02 07:24:48 +0000 (Mon, 02 Feb 2009)
 ulf> New Revision: 25218

 ulf> Log:
 ulf> Define OSIP_CFLAGS and OSIP_LIBS for libeXosip2

 ulf> Modified:
 ulf>    trunk/buildroot/package/libeXosip2/libeXosip2.mk


 ulf> Changeset:
 ulf> Modified: trunk/buildroot/package/libeXosip2/libeXosip2.mk
 ulf> ===================================================================
 ulf> --- trunk/buildroot/package/libeXosip2/libeXosip2.mk	2009-02-02 07:22:19 UTC (rev 25217)
 ulf> +++ trunk/buildroot/package/libeXosip2/libeXosip2.mk	2009-02-02 07:24:48 UTC (rev 25218)
 ulf> @@ -22,32 +22,19 @@
 ulf>  	(cd $(LIBEXOSIP2_DIR); rm -rf config.cache; \
 ulf>  		$(TARGET_CONFIGURE_OPTS) \
 ulf>  		$(TARGET_CONFIGURE_ARGS) \
 ulf> +		OSIP_CFLAGS="$(TARGET_CFLAGS)" \
 ulf> +		OSIP_LIBS="-L$(STAGING_DIR)/usr/lib -losip2 -losipparser2" \

Aren't those things already provided in TARGET_CONFIGURE_* ?

 ulf> -		--includedir=$(STAGING_DIR)/usr/include \
 ulf> -		--oldincludedir=/usr/include \

Why were these removed?

 ulf>  		--enable-shared \
 ulf>  		--enable-static \
 ulf>  		$(DISABLE_NLS) \
 ulf>  	)
 ulf>  	touch $@

-- 
Bye, Peter Korsgaard
