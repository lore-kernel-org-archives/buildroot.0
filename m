From: daggs <daggs@gmx.com>
Date: Sun, 13 Nov 2016 08:45:44 +0100
Subject: [Buildroot] [PATCH v7] kodi: allow enablement of libamcodec as
 codec if selected
In-Reply-To: <20161109224930.4ae4ee9e@free-electrons.com>
References: <20161109190733.11189-1-daggs@gmx.com>,
 <20161109224930.4ae4ee9e@free-electrons.com>
Message-ID: <trinity-b4dfcae4-f270-49c6-8edd-7a7c6ae9a835-1479023144098@3capp-mailcom-bs04>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Thomas,

> Hello,
> 
> On Wed,  9 Nov 2016 21:07:33 +0200, Dagg Stompler wrote:
> > allow usage of amcodec if kodi is built and libamcodec is selected
> > 
> > Signed-off-by: Dagg Stompler <daggs@gmx.com>
> 
> I've applied to next, but it would be really really good if you could
> review your own patches before sending them. There was an obvious big
> mistake in your patch, see below.
I did tested the patch, it worked without any problems.
maybe there was something bad if the diff which I've mis copied.
regardless, I'll pay more attention in the future.

Thanks.

> 
> 
> > diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> > index e0361da..f9d1a11 100644
> > --- a/package/kodi/kodi.mk
> > +++ b/package/kodi/kodi.mk
> > @@ -96,9 +96,9 @@ endif
> >  ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
> >  KODI_DEPENDENCIES += rpi-userland
> >  KODI_CONF_OPTS += --with-platform=raspberry-pi --enable-player=omxplayer
> > -KODI_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
> > -	-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux" \
> > -	LIBS="-lvcos -lvchostif"
> > +-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
> > +-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux
> 
> How do you expect those two lines to work? You don't even tell make
> that this value should be assigned to the KODI_INCLUDES variable.
> Clearly you didn't review your patch carefully enough here.
> 
> > +KODI_LIBS="-lvcos -lvchostif"
> 
> Space before/after the = sign, and double quotes not needed.
> 
> > +KODI_CONF_ENV += \
> > +INCLUDES="$(KODI_INCLUDES)" \
> > +LIBS="$(KODI_LIBS)"
> 
> The values should have been indented with on tab.
> 
> Applied with those issues fixed. Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> 
