From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 16 Apr 2019 22:08:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/wireshark: enable back static
 build
In-Reply-To: <2c6d4d36-9621-e141-fc31-436d8fd3921e@mind.be>
References: <20190416094106.30125-1-fontaine.fabrice@gmail.com>
 <2c6d4d36-9621-e141-fc31-436d8fd3921e@mind.be>
Message-ID: <CAPi7W81wfyLo+zQOSDG5efgi4w2Htb+PXuF0tdBsDBct9ffjFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mar. 16 avr. 2019 ? 21:46, Arnout Vandecappelle <arnout@mind.be> a ?crit :
>
>
>
> On 16/04/2019 11:41, Fabrice Fontaine wrote:
> > +# Disable plugins as some of them (like l16mono) can't be built statically
> > +ifeq ($(BR2_STATIC_LIBS),y)
> > +WIRESHARK_CONF_OPTS += \
> > +     -DENABLE_PLUGINS=OFF \
> > +     -DENABLE_STATIC=ON
> > +else
> > +WIRESHARK_CONF_OPTS += \
> > +     -DENABLE_PLUGINS=ON \
> > +     -DENABLE_STATIC=OFF
>
>  I don't know what this option does, but is it the appropriate thing to do in
> the STATIC_SHARED case?
ENABLE_STATIC is a wrapper to  the standard BUILD_SHARED_LIBS variable:
if(ENABLE_STATIC)
    set(BUILD_SHARED_LIBS 0)
else()
    set(BUILD_SHARED_LIBS 1)
endif()

I think that our policy is to set BUILD_SHARED_LIBS to ON in the
STATIC_SHARED context.
>
>  Regards,
>  Arnout
>
> > +endif
Best Regards,

Fabrice
