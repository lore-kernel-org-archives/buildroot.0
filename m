From: Scott Fan <fancp2007@gmail.com>
Date: Fri, 3 Jun 2016 09:05:03 +0800
Subject: [Buildroot] [PATCH v5] remmina: new package
In-Reply-To: <20160531160607.07fdfa74@free-electrons.com>
References: <1441118174-9899-1-git-send-email-fancp2007@gmail.com>
 <1451750166-10049-1-git-send-email-fancp2007@gmail.com>
 <20160531160607.07fdfa74@free-electrons.com>
Message-ID: <CAFkzVZZh5nO+0OqaduN45MqYcca5ufneYtWH6i86GL0zEHGU9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Thanks for your attention to this patch again.
I will follow up on it later.

Scott Fan

On Tue, May 31, 2016 at 10:06 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello Scott,
>
> It's been a very long time since you posted this patch. It generally
> looks good, but there's one thing that I don't really like.
>
> On Sat,  2 Jan 2016 23:56:06 +0800, Scott Fan wrote:
>
> > diff --git a/package/remmina/remmina.mk b/package/remmina/remmina.mk
> > new file mode 100644
> > index 0000000..8f333ae
> > --- /dev/null
> > +++ b/package/remmina/remmina.mk
> > @@ -0,0 +1,36 @@
> >
> +################################################################################
> > +#
> > +# remmina
> > +#
> >
> +################################################################################
> > +
> > +REMMINA_VERSION = e7f665f2634939aaa9bed114569cbd13eac10b82
> > +REMMINA_SITE = $(call github,FreeRDP,Remmina,$(REMMINA_VERSION))
>
> There has been new upstream releases since then, could you try to use a
> more recent version? Also, we now add hash files for packages sourced
> from Github, so it would be good to add one.
>
> > +REMMINA_LICENSE = GPLv2+ with OpenSSL exception
> > +REMMINA_LICENSE_FILES = COPYING LICENSE LICENSE.OpenSSL
> > +
> > +REMMINA_CONF_OPTS = \
> > +     -DWITH_AVAHI=OFF \
> > +     -DWITH_APPINDICATOR=OFF \
> > +     -DWITH_GNOMEKEYRING=OFF \
> > +     -DWITH_TELEPATHY=OFF \
> > +     -DWITH_GCRYPT=OFF \
> > +     -DWITH_LIBSSH=OFF \
> > +     -DWITH_VTE=OFF
> > +
> > +REMMINA_DEPENDENCIES = \
> > +     libgtk3 libvncserver freerdp \
> > +     xlib_libX11 xlib_libXext xlib_libxkbfile
> > +
> > +ifeq ($(BR2_NEEDS_GETTEXT),y)
> > +REMMINA_DEPENDENCIES += gettext
> > +
> > +define REMMINA_POST_PATCH_FIXINTL
> > +     $(SED) 's/$${GTK_LIBRARIES}/$${GTK_LIBRARIES} -lintl/' \
> > +             $(@D)/remmina/CMakeLists.txt
> > +endef
>
> The thing I dislike is this hook. Could you instead work on changing
> the CMakeLists.txt so that it links with -lintl when needed? This way,
> it would be a solution that we can contribute upstream to the Remmina
> developers.
>
> I've added in Cc: to this e-mail Samuel Martin, who is our CMake expert
> in the Buildroot community. Hopefully he can help you achieve this.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160603/35c640e0/attachment.html>
