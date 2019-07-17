From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 08:46:34 +0200
Subject: [Buildroot] [PATCH v1] package/gstreamer1: fix static build
 break after change to meson build
In-Reply-To: <20190715175732.8096-1-ps.report@gmx.net>
References: <20190715175732.8096-1-ps.report@gmx.net>
Message-ID: <20190717084634.795e31e9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Jul 2019 19:57:32 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Add upstream patch to work around meson bug with linking static
> libraries, fixes [1]:
> 
> .../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgstreamer-1.0.a(gstelement.c.o): In function `_gst_element_error_printf':
> gstelement.c:(.text+0x3fe8): undefined reference to `__gst_vasprintf'
> .../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgstreamer-1.0.a(gstinfo.c.o): In function `gst_debug_message_get':
> gstinfo.c:(.text+0x1df0): undefined reference to `__gst_vasprintf'
> .../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgstreamer-1.0.a(gstinfo.c.o): In function `_priv_gst_debug_init':
> gstinfo.c:(.text+0x34a4): undefined reference to `__gst_printf_pointer_extension_set_func'
> .../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgstreamer-1.0.a(gstinfo.c.o): In function `gst_info_vasprintf':
> gstinfo.c:(.text+0x40b4): undefined reference to `__gst_vasprintf'
> collect2: error: ld returned 1 exit status
> 
> [1] http://autobuild.buildroot.net/results/9f92b180835df9ed580fe2420687a3632d08b3e4
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...jects-instea-of-static-helper-librar.patch | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/gstreamer1/gstreamer1/0001-meson-Link-to-objects-instea-of-static-helper-librar.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
