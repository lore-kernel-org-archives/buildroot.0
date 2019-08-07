From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 7 Aug 2019 15:20:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: fix gstreamer-gl
 dependency
In-Reply-To: <20190807044511.71248-1-james.hilliard1@gmail.com>
References: <20190807044511.71248-1-james.hilliard1@gmail.com>
Message-ID: <20190807152034.331c981b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  6 Aug 2019 22:45:11 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

>  ifeq ($(BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL),y)
>  WPEWEBKIT_CONF_OPTS += -DUSE_GSTREAMER_GL=ON
> +WPEWEBKIT_DEPENDENCIES += gst1-plugins-base

This addition is not needed: gst1-plugins-base is already added to
DEPENDENCIES when BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA=y, and
BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL depends on
BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA.

Applied with this fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
