From: Phil Edworthy <Phil.Edworthy@renesas.com>
Date: Wed, 26 May 2010 13:31:45 +0100
Subject: [Buildroot] gst-plugins-base alsa dependency
In-Reply-To: <20100526120439.532638bd@surf>
Message-ID: <AB12B32E73474741A2C5361C433A44DE01CA6F35@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > How can a Buildroot package be told of build order dependencies,
> > without requiring the packages to be included?
> 
> By doing something like:
> 
> ifeq ($(BR2_PACKAGE_ON_WHICH_I_DEPEND),y)
> MYPKG_DEPENDENCIES += package-on-which-i-depend
> endif
> 
> If the package "package-on-which-i-depend" is enabled in the
> configuration, then you will have the guarantee that it gets compiled
> before the current package.

Thanks Thomas, that's a nice and simple way to fix it.
Phil 
