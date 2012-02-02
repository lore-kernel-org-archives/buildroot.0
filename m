From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 Feb 2012 12:53:19 +0100
Subject: [Buildroot] [PATCH] liboauth: Add new package
In-Reply-To: <CAFbHwiRh1gFDp1ktEK612jxreKo83vqM=JzPaAsq0R2WTBBswg@mail.gmail.com>
 (Will Newton's message of "Thu, 2 Feb 2012 11:28:11 +0000")
References: <CAFbHwiRh1gFDp1ktEK612jxreKo83vqM=JzPaAsq0R2WTBBswg@mail.gmail.com>
Message-ID: <87haz9bgeo.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

 Will> +#############################################################
 Will> +#
 Will> +# liboauth
 Will> +#
 Will> +#############################################################
 Will> +LIBOAUTH_VERSION = 0.9.6
 Will> +LIBOAUTH_SOURCE = liboauth-$(LIBOAUTH_VERSION).tar.gz
 Will> +LIBOAUTH_SITE = http://liboauth.sourceforge.net/pool
 Will> +LIBOAUTH_INSTALL_STAGING = YES
 Will> +
 Will> +LIBOAUTH_DEPENDENCIES += host-pkg-config openssl
 Will> +
 Will> +ifneq ($(BR2_PACKAGE_LIBCURL),y)
 Will> +LIBOAUTH_CONF_OPT += --disable-libcurl
 Will> +else
 Will> +LIBOAUTH_DEPENDENCIES += libcurl
 Will> +endif

I prefer positive tests, so I swapped the libcurl conditional
around. Otherwise it looks good - Committed, thanks.

-- 
Bye, Peter Korsgaard
