From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 19 Oct 2017 20:16:15 +0300
Subject: [Buildroot] [PATCH v3 1/1] gstreamer1-mm: new package
In-Reply-To: <20171018131702.1710-1-Adamduskett@outlook.com>
References: <20171018131702.1710-1-Adamduskett@outlook.com>
Message-ID: <20171019171615.hq2ukawo35arvyj3@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Wed, Oct 18, 2017 at 09:17:02AM -0400, Adam Duskett wrote:

[...]

> diff --git a/package/gstreamer1/gstreamer1-mm/Config.in b/package/gstreamer1/gstreamer1-mm/Config.in
> new file mode 100644
> index 0000000000..33052c943e
> --- /dev/null
> +++ b/package/gstreamer1/gstreamer1-mm/Config.in
> @@ -0,0 +1,28 @@
> +config BR2_PACKAGE_GSTREAMER1_MM
> +	bool "gstreamer1-mm"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # glibmm
> +	depends on BR2_INSTALL_LIBSTDCPP # glibmm

C++ seems to be a direct dependency of gstreamer1-mm. So this comment is 
misleading.

> +	depends on BR2_USE_WCHAR # libglib2

libglib2 is an indirect dependency of gstreamer1-mm via glibmm, right? In this 
case we usually write:

    depends on BR2_USE_WCHAR # glibmm -> libglib2

> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +	depends on BR2_USE_MMU # libglib2

Same here.

> +	select BR2_PACKAGE_GST1_PLUGINS_BASE
> +	select BR2_PACKAGE_GLIBMM
> +	help
> +	  gstreamermm provides C++ bindings for the GStreamer streaming
> +	  multimedia library (http://gstreamer.freedesktop.org). With
> +	  gstreamermm it is possible to	develop applications that work
> +	  with multimedia in C++.
> +
> +	  gstreamermm is developed over glibmm, libsigc++ and libxml++
> +	  and the functionalities they provide. This means that, among
> +	  other things, referencing and unreferencing of GObjects is
> +	  handled automatically via glibmm's automatic pointer class,
> +	  Glib::RefPtr, and libsigc++'s slots are used for callbacks and
> +	  signals.
> +
> +	  https://gstreamer.freedesktop.org/bindings/cplusplus.html

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
