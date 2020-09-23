From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 22:30:20 +0200
Subject: [Buildroot] [RFC v1 12/13] package/gstreamer1-editing-services:
 bump version to 1.18.0 and convert to meson
In-Reply-To: <20200916194933.24921-12-ps.report@gmx.net>
References: <20200916194933.24921-1-ps.report@gmx.net>
 <20200916194933.24921-12-ps.report@gmx.net>
Message-ID: <20200923223020.751ca54a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Sep 2020 21:49:32 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> +ifeq ($(BR2_PACKAGE_GST1_VALIDATE),y)

You just dropped this option and the corresponding package in PATCH
08/13 of this series, so this cannot be good.

> +GSTREAMER1_EDITING_SERVICES_DEPENDENCIES += gst1-validate
> +GSTREAMER1_EDITING_SERVICES_CONF_OPTS += -Dvalidate=enabled
> +else
> +GSTREAMER1_EDITING_SERVICES_CONF_OPTS += -Dvalidate=disabled
> +endif
>  
>  # examples need GTK2/3 with X11 backend
>  ifneq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_LIBGTK3_X11),)
> -GSTREAMER1_EDITING_SERVICES_CONF_OPTS += --enable-examples
> +GSTREAMER1_EDITING_SERVICES_CONF_OPTS += -Dexamples=enabled
>  
>  ifeq ($(BR2_PACKAGE_LIBGTK2),y)
> -GSTREAMER1_EDITING_SERVICES_CONF_OPTS += --with-gtk=2.0
> +# ToDo: meson.build states 'TODO Properly port to Gtk 3'
> +# ToDo: examples/c/ges-ui.glade states 'requires lib="gtk+" version="2.16"'
> +# GSTREAMER1_EDITING_SERVICES_CONF_OPTS += --with-gtk=2.0

And so ?

>  GSTREAMER1_EDITING_SERVICES_DEPENDENCIES += libgtk2
>  else
> -GSTREAMER1_EDITING_SERVICES_CONF_OPTS += --with-gtk=3.0
> +# ToDo: meson.build states 'TODO Properly port to Gtk 3'
> +# ToDo: examples/c/ges-ui.glade states 'requires lib="gtk+" version="2.16"'
> +# GSTREAMER1_EDITING_SERVICES_CONF_OPTS += --with-gtk=3.0

And so ?

>  GSTREAMER1_EDITING_SERVICES_DEPENDENCIES += libgtk3
>  endif

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
