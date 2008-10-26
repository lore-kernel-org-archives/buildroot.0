From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sun, 26 Oct 2008 19:10:18 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: audio/libogg
	audio/libvorbis docker edit etc...
In-Reply-To: <200810261437.05446.markus.heidelberg@web.de>
References: <20081026061944.0F6DE3C2B3@busybox.net>
	<200810261437.05446.markus.heidelberg@web.de>
Message-ID: <200810261910.18891.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus Heidelberg, 26.10.2008:
> > Modified: trunk/buildroot/package/docker/docker.mk
> > ===================================================================
> > --- trunk/buildroot/package/docker/docker.mk	2008-10-26 06:03:23 UTC (rev 23793)
> > +++ trunk/buildroot/package/docker/docker.mk	2008-10-26 06:19:43 UTC (rev 23794)
> > @@ -14,10 +14,7 @@
> >  					CFLAGS="-I$(STAGING_DIR)/usr/include \
> >  						-I$(STAGING_DIR)/usr/include/glib-2.0 \
> >  						-I$(STAGING_DIR)/usr/lib/glib-2.0/include" \
> > -					LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
> > -					PKGCONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
> > -					PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
> > -					PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
> > +					LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib"
> 
> I think this will break docker, because MAKE_OPT is affected, not CONF_OPT.
> And I just noticed that docker doesn't use autotools at all.

Ah, already fixed in a later commit.

Markus
