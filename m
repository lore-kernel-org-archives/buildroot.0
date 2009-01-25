From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 25 Jan 2009 21:48:25 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libeXosip2
In-Reply-To: <20090125204425.CEE37768D3@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Sun\, 25 Jan 2009 20\:44\:25 +0000 \(UTC\)")
References: <20090125204425.CEE37768D3@busybox.osuosl.org>
Message-ID: <87y6wzdsdi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-25 20:44:23 +0000 (Sun, 25 Jan 2009)
 ulf> New Revision: 25018

 ulf> Log:
 ulf> Use prefix=/usr for libeXosip2

 ulf> Changeset:
 ulf> Modified: trunk/buildroot/package/libeXosip2/libeXosip2.mk
 ulf> ===================================================================
 ulf> --- trunk/buildroot/package/libeXosip2/libeXosip2.mk	2009-01-25 20:19:06 UTC (rev 25017)
 ulf> +++ trunk/buildroot/package/libeXosip2/libeXosip2.mk	2009-01-25 20:44:23 UTC (rev 25018)
 ulf> @@ -26,16 +26,16 @@
 ulf>  		--target=$(GNU_TARGET_NAME) \
 ulf>  		--host=$(GNU_TARGET_NAME) \
 ulf>  		--build=$(GNU_HOST_NAME) \
 ulf> -		--prefix=$(STAGING_DIR) \
 ulf> -		--exec-prefix=/usr \
 ulf> +		--prefix=/usr \
 ulf> +		--exec-prefix=/ \

Really? --exec-prefix should normally be the same as prefix.

 ulf>  		--bindir=/usr/bin \
 ulf>  		--sbindir=/usr/sbin \
 ulf> +		--libexecdir=/usr/lib \
 ulf>  		--sysconfdir=/etc \
 ulf>  		--datadir=/usr/share \
 ulf> -		--localstatedir=/var \
 ulf>  		--mandir=/usr/man \
 ulf>  		--infodir=/usr/info \
 ulf> -		--libexecdir=/usr/lib \
 ulf> +		--localstatedir=/var \
 ulf>  		--libdir=/usr/lib \

I gather prefix is enough, and you can remove all of those.

-- 
Bye, Peter Korsgaard
