From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Mar 2013 11:32:24 +0100
Subject: [Buildroot] [PATCH 1/4] directfb: bumping version to 1.6.3
In-Reply-To: <1362908858-6340-2-git-send-email-c.schoenert@gmail.com>
References: <1362908858-6340-1-git-send-email-c.schoenert@gmail.com>
 <1362908858-6340-2-git-send-email-c.schoenert@gmail.com>
Message-ID: <20130310113224.4e3dbb2a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carsten Schoenert,

On Sun, 10 Mar 2013 10:47:35 +0100, Carsten Schoenert wrote:

> -DIRECTFB_VERSION_MAJOR = 1.4
> -DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).17
> +DIRECTFB_VERSION_MAJOR = 1.6
> +DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).3
>  DIRECTFB_SITE = http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
>  DIRECTFB_SOURCE = DirectFB-$(DIRECTFB_VERSION).tar.gz
>  DIRECTFB_LICENSE = LGPLv2.1+

This looks good. However, we have a number of packages that depend or
can use DirectFB: cairo, directfb-examples, libecore, libevas, libgtk2,
links, lite, gst-plugins-bad, opencv, qt, sawman, sdl, webkit. Did you
test if those still build after this DirectFB bump? I have no idea if
the DirectFB bump from 1.4.x to 1.6.x is a major bump (like with API
breakage) or a minor bump. Depending on that, some testing of the
packages using DirectFB would be needed, or not.

Note that we don't necessarily require all those packages to continue
to build with DirectFB 1.6.x: if those packages haven't adapted to the
new DirectFB versions, then it's an upstream problem. However, if some
of those packages don't build, it would be good to update their
Config.in to ensure that the DirectFB variant is no longer offered/used.

Also, do just a reasonable amount of testing: our autobuilders will
anyway do a global testing of many combinations. But it's good to at
least check a few packages. If they work fine with the DirectFB bump,
then it's a good indication that the DirectFB bump probably didn't
introduce too much API breakage.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
