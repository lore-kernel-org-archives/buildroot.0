From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 13 Jul 2011 21:02:51 +0200
Subject: [Buildroot] [PATCH 1/2] libsoup: update to version 2.32.2 and
 enable SSL support
In-Reply-To: <20110713191252.4e0c7a65@skate>
References: <1310576324-9603-1-git-send-email-s.neumann@raumfeld.com>
 <20110713191252.4e0c7a65@skate>
Message-ID: <1310583771.11691.2.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2011-07-13 at 19:12 +0200, Thomas Petazzoni wrote:
> Le Wed, 13 Jul 2011 18:58:43 +0200,
> Sven Neumann <s.neumann@raumfeld.com> a ?crit :
> 
> > +ifeq ($(BR2_PACKAGE_GNUTLS),y)
> > +LIBSOUP_DEPENDENCIES += gnutls
> > +LIBSOUP_CONF_OPT += --enable-ssl
> > +else
> > +LIBSOUP_CONF_OPT += --disable-ssl
> > +endif
> > +
> 
> Question not specific to your patch: how are we going to handle openssl
> vs. gnutls in Buildroot? Is gnutls a drop-in replacement for openssl?
> It'd be a mess to have a portion of our packages using openssl for SSL,
> and another portion of our packages using gnutls for SSL, no?

Honestly, this mess seems hard to avoid. We are using openssl for ssh
and also in our own software stack. And we also need libsoup with
support for HTTPS. And it seems the only way to get that is to depend on
gnutls.


Sven
