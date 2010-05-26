From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 May 2010 12:04:39 +0200
Subject: [Buildroot] gst-plugins-base alsa dependency
In-Reply-To: <AB12B32E73474741A2C5361C433A44DE01CA6D85@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
References: <AB12B32E73474741A2C5361C433A44DE01CA6D85@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
Message-ID: <20100526120439.532638bd@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 26 May 2010 10:57:56 +0100
"Phil Edworthy" <Phil.Edworthy@renesas.com> wrote:

> How can a Buildroot package be told of build order dependencies,
> without requiring the packages to be included?

By doing something like:

ifeq ($(BR2_PACKAGE_ON_WHICH_I_DEPEND),y)
MYPKG_DEPENDENCIES += package-on-which-i-depend
endif

If the package "package-on-which-i-depend" is enabled in the
configuration, then you will have the guarantee that it gets compiled
before the current package.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
