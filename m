From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Feb 2009 13:52:51 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libeXosip2
In-Reply-To: <87bptlgh4d.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
	of "Mon\, 02 Feb 2009 13\:25\:54 +0100")
References: <20090202072449.30556764CB@busybox.osuosl.org>
	<87bptlgh4d.fsf@macbook.be.48ers.dk>
Message-ID: <87tz7acqjg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

Ping?

 ulf> Log:
 ulf> Define OSIP_CFLAGS and OSIP_LIBS for libeXosip2


 ulf> Changeset:
 ulf> Modified: trunk/buildroot/package/libeXosip2/libeXosip2.mk
 ulf> ===================================================================
 ulf> --- trunk/buildroot/package/libeXosip2/libeXosip2.mk	2009-02-02 07:22:19 UTC (rev 25217)
 ulf> +++ trunk/buildroot/package/libeXosip2/libeXosip2.mk	2009-02-02 07:24:48 UTC (rev 25218)
 ulf> @@ -22,32 +22,19 @@
 ulf> (cd $(LIBEXOSIP2_DIR); rm -rf config.cache; \
 ulf> $(TARGET_CONFIGURE_OPTS) \
 ulf> $(TARGET_CONFIGURE_ARGS) \
 ulf> +		OSIP_CFLAGS="$(TARGET_CFLAGS)" \
 ulf> +		OSIP_LIBS="-L$(STAGING_DIR)/usr/lib -losip2 -losipparser2" \

 Peter> Aren't those things already provided in TARGET_CONFIGURE_* ?

 ulf> -		--includedir=$(STAGING_DIR)/usr/include \
 ulf> -		--oldincludedir=/usr/include \

 Peter> Why were these removed?

-- 
Bye, Peter Korsgaard
