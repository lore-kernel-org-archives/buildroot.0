From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 30 Apr 2013 10:11:33 +0200
Subject: [Buildroot] [PATCH v2 4/4] weston: new package
In-Reply-To: <1367267165-6873-5-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 29 Apr 2013 22:26:05 +0200")
References: <1367267165-6873-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1367267165-6873-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k3nk30ay.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/Config.in                                  |    1 +
 Thomas>  package/weston/Config.in                           |   29 ++++++++++++
 Thomas>  ...pendent-code-only-when-the-DRM-compositor.patch |   47 ++++++++++++++++++++
 Thomas>  package/weston/weston.mk                           |   32 +++++++++++++
 Thomas>  4 files changed, 109 insertions(+)
 Thomas>  create mode 100644 package/weston/Config.in
 Thomas>  create mode 100644 package/weston/weston-0001-Pull-DRM-dependent-code-only-when-the-DRM-compositor.patch
 Thomas>  create mode 100644 package/weston/weston.mk

 Thomas> diff --git a/package/Config.in b/package/Config.in
 Thomas> index 76feb7d..3c1c504 100644
 Thomas> --- a/package/Config.in
 Thomas> +++ b/package/Config.in
 Thomas> @@ -151,6 +151,7 @@ endif
 
 Thomas>  source "package/qt5/Config.in"
 Thomas>  source "package/x11r7/Config.in"
 Thomas> +source "package/weston/Config.in"
 
 Thomas>  comment "X libraries and helper libraries"
 Thomas>  source "package/liberation/Config.in"
 Thomas> diff --git a/package/weston/Config.in b/package/weston/Config.in
 Thomas> new file mode 100644
 Thomas> index 0000000..15cc9e8
 Thomas> --- /dev/null
 Thomas> +++ b/package/weston/Config.in
 Thomas> @@ -0,0 +1,29 @@
 Thomas> +comment "weston requires udev"
 Thomas> +	depends on BR2_PACKAGE_UDEV

It should be NOT (!) BR2_PACKAGE_UDEV

 Thomas> +
 Thomas> +config BR2_PACKAGE_WESTON
 Thomas> +	bool "weston"
 Thomas> +	select BR2_PACKAGE_WAYLAND
 Thomas> +	select BR2_PACKAGE_LIBXKBCOMMON
 Thomas> +	select BR2_PACKAGE_CAIRO
 Thomas> +	select BR2_PACKAGE_CAIRO_PNG
 Thomas> +	select BR2_PACKAGE_LIBPNG
 Thomas> +	select BR2_PACKAGE_JPEG
 Thomas> +	select BR2_PACKAGE_MTDEV
 Thomas> +	depends on BR2_PACKAGE_UDEV
 Thomas> +	# Runtime dependency
 Thomas> +	select BR2_PACKAGE_XKEYBOARD_CONFIG
 Thomas> +	# Make sure at least one backend is selected
 Thomas> +	select BR2_PACKAGE_WESTON_FBDEV
 Thomas> +	help
 Thomas> +	  Weston is the reference implementation of a Wayland
 Thomas> +	  compositor, and a useful compositor in its own right.
 Thomas> +	  Weston has various backends that lets it run on Linux kernel
 Thomas> +	  modesetting and evdev input as well as under X11.
 Thomas> +

Upstream URL missing.

Committed with those fixes, thanks.

-- 
Bye, Peter Korsgaard
