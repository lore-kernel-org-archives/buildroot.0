From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Jun 2018 23:22:51 +0200
Subject: [Buildroot] [PATCH v6 2/9] gst1-plugins-${base, good, bad,
 ugly}: bump to 1.14.1
In-Reply-To: <20180623223529.13629-3-ps.report@gmx.net>
References: <20180623223529.13629-1-ps.report@gmx.net>
 <20180623223529.13629-3-ps.report@gmx.net>
Message-ID: <20180626232251.58cac0f7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Sun, 24 Jun 2018 00:35:22 +0200, Peter Seiderer wrote:

> +###############################################################################
> +comment "Legacy options removed in 2018.11"

They will be removed in 2018.08, not 2018.11. So I've merged this with
the existing 2018.08 legacy section.

> -ifneq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_WAYLAND)$(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND),)
> +ifneq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND),)

I've turned this to positive logic:

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND),y)

> +ifneq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_WAYLAND),)

And also here.

Applied with those changes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
