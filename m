From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 14 Aug 2020 12:27:46 -0700
Subject: [Buildroot] [PATCH 1/1] package/avahi: fix building against
 gobject-introspection
In-Reply-To: <20200814133934.26a33b17@windsurf.home>
References: <20200813232351.1552307-1-aduskett@gmail.com>
 <20200814133934.26a33b17@windsurf.home>
Message-ID: <CAFSsvmqhCPXYn9A8pXOy5bi2h35KJZ92r-EWms9Ra7yG2HW=xA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 14, 2020 at 4:39 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Thu, 13 Aug 2020 16:23:51 -0700
> aduskett at gmail.com wrote:
>
> > +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> > +AVAHI_DEPENDENCIES += gobject-introspection
> > +AVAHI_CONF_OPTS += --enable-gobject
> > +AVAHI_MAKE_ENV += \
> > +     GIR_EXTRA_LIBS_PATH="$(@D)/avahi-gobject/.libs:$(@D)/avahi-common/.libs:$(@D)/avahi-client/.libs:$(@D)/avahi-glib/.libs"
>
> This really isn't very neat. Isn't there a better solution?
>
Maybe? But that's why the GIR_EXTRA_LABS_PATH macro exists, is for
situations just like this.

Adam
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
