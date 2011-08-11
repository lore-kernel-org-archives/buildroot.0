From: Frederic Bassaler <frederic.bassaler@gmail.com>
Date: Thu, 11 Aug 2011 11:36:10 +0200
Subject: [Buildroot] BUG: no https support with midori
In-Reply-To: <1313047041.16546.2.camel@sven>
References: <20110810192520.7524c2ab@gmail.com>
 <1313004810.8441.3.camel@bender>
 <20110810233055.596f53cb@gmail.com> <1313047041.16546.2.camel@sven>
Message-ID: <20110811113610.70f629df@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It works indeed!
Problem solved.

Thanks


Le Thu, 11 Aug 2011 09:17:20 +0200,
Sven Neumann <s.neumann@raumfeld.com> a ?crit :

> Hi,
> 
> On Wed, 2011-08-10 at 23:30 +0200, Frederic Bassaler wrote:
> 
> > Sorry I forgot to tell, but I did remove the --disable-ssl
> > configuration directive in libsoup.mk
> > 
> > As shown below, configure fails to find the libgcrypt library...
> > 
> > Does it work for you? (Maybe I have to delete my output directory
> > and rebuild again from scratch)
> 
> It works for me. But I've just checked and it appears that we have the
> following in libsoup.mk:
> 
> ifeq ($(BR2_PACKAGE_GNUTLS),y)
> LIBSOUP_DEPENDENCIES += gnutls
> LIBSOUP_CONF_OPT += --enable-ssl \
> 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
> else
> LIBSOUP_CONF_OPT += --disable-ssl
> endif
> 
> You might also try "--without-libgcrypt-prefix". I heard rumours that
> this would work as well.
> 
> 
> Sven
> 
> 
