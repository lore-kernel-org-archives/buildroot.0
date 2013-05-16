From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 May 2013 10:10:52 +0200
Subject: [Buildroot] [PATCH v6 10/10] gst-omx: add gst-omx package
In-Reply-To: <1368655178-19176-11-git-send-email-spenser@gillilanding.com>
References: <1368655178-19176-1-git-send-email-spenser@gillilanding.com>
 <1368655178-19176-11-git-send-email-spenser@gillilanding.com>
Message-ID: <20130516101052.737192f2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Wed, 15 May 2013 16:59:38 -0500, Spenser Gilliland wrote:
> gst-omx enables OpenMAX based accelerated video decode.
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>

One question: it would be good to mention, in your cover letter, on
which platform this was tested. Was it tested on RPi? With what command
line/tool?

> +comment "gst-omx requires a OpenMAX implementation please select rpi-userland or bellagio"
> +	depends on BR2_PACKAGE_GSTREAMER1 && ! BR2_PACKAGE_HAS_OPENMAX

I'm not sure it's reasonable to list the available OpenMAX
implementations. So I'd just stick with "gst-omx requires an OpenMAX
implementation".

No space between ! and BR2_PACKAGE_HAS_OPENMAX.

> diff --git a/package/multimedia/gst-omx/gst-omx.mk b/package/multimedia/gst-omx/gst-omx.mk
> new file mode 100644
> index 0000000..7f54900
> --- /dev/null
> +++ b/package/multimedia/gst-omx/gst-omx.mk
> @@ -0,0 +1,9 @@

The usual (and useless, but conventional) comment header is missing.

> +GST_OMX_VERSION=1.0.0
> +GST_OMX_SOURCE=gst-omx-$(GST_OMX_VERSION).tar.xz
> +GST_OMX_SITE=http://gstreamer.freedesktop.org/src/gst-omx/

Spaces before and after =.

> +GST_OMX_DEPENDENCIES = gstreamer1 gst1-plugins-base libopenmax
> +GST_OMX_LICENSE = LGPLv2.1
> +GST_OMX_LICENSE_FILE = COPYING
> +GST_OMX_INSTALL_STAGING = YES
> +
> +$(eval $(autotools-package))

Not sure here: do we have a reason to install this to the staging/
space? I thought it was only installing a plugin, and not a library
against which other things would be linked with.

Apparently, the other gst1-plugins-* packages that you submitted don't
install to staging, unless I missed it (which may very be possible, I
only had a quick look).

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
