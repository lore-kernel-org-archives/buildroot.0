From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Nov 2019 22:48:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-base:
 gl needs api, platform and window
In-Reply-To: <20191112193756.32212-1-fontaine.fabrice@gmail.com>
References: <20191112193756.32212-1-fontaine.fabrice@gmail.com>
Message-ID: <20191112224834.1432ce41@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Nov 2019 20:37:56 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Build will fail if gl is enabled without an api, a platform and a
> window:
> 
> Message: No OpenGL Platforms found or requested
> Message: No OpenGL Window systems found or requested
> 
> gst-libs/gst/gl/meson.build:948:2: ERROR: Problem encountered: GStreamer OpenGL integration required via options, but needed dependencies not found.
> 
> This requirement is already specified in Config.in through a simple
> comment:
> 
> comment "The opengl library needs an API, a platform and a window system"
> 	depends on !BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d171059801adf8dea1a2116d7c729a2aa5767ac8
>  - http://autobuild.buildroot.org/results/b1bfa505bba534440d331c4948eea5eb2d165c97
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

To be honest, I think the gst1-plugins-base/Config.in handling of
OpenGL support is completely over-engineered, and whenever we get
patches like this one, or http://patchwork.ozlabs.org/patch/1143636/, I
have the feeling of adding more and more layers of ducktape on
something that is already severely broken.

Can we revisit the handling of OpenGL support in
gst1-plugins-base/Config.in to make it more sane ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
