From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 29 Dec 2012 21:13:48 +0100
Subject: [Buildroot] [PATCH 20/20] enlightenment: new package
In-Reply-To: <df0808d07efd1959cfca0558857283d2e7240f4a.1356723702.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 28 Dec 2012 20:42:13 +0100")
References: <cover.1356723702.git.thomas.petazzoni@free-electrons.com>
 <cover.1356723702.git.thomas.petazzoni@free-electrons.com>
 <df0808d07efd1959cfca0558857283d2e7240f4a.1356723702.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87fw2owr9f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/Config.in                                  |    1 +
 Thomas>  package/enlightenment/Config.in                    |   29 ++++++++++++++
 Thomas>  .../enlightenment/enlightenment-no-execinfo.patch  |   27 +++++++++++++
 Thomas>  package/enlightenment/enlightenment.mk             |   40 ++++++++++++++++++++
 Thomas>  4 files changed, 97 insertions(+)
 Thomas>  create mode 100644 package/enlightenment/Config.in
 Thomas>  create mode 100644 package/enlightenment/enlightenment-no-execinfo.patch
 Thomas>  create mode 100644 package/enlightenment/enlightenment.mk

 Thomas> diff --git a/package/Config.in b/package/Config.in
 Thomas> index 3d556b2..97a28c8 100644
 Thomas> --- a/package/Config.in
 Thomas> +++ b/package/Config.in
 Thomas> @@ -151,6 +151,7 @@ source "package/liberation/Config.in"
 Thomas>  source "package/libsexy/Config.in"
 
 Thomas>  comment "X Window managers"
 Thomas> +source "package/enlightenment/Config.in"
 Thomas>  source "package/matchbox/Config.in"
 Thomas>  source "package/metacity/Config.in"
 Thomas>  source "package/blackbox/Config.in"
 Thomas> diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
 Thomas> new file mode 100644
 Thomas> index 0000000..d973813
 Thomas> --- /dev/null
 Thomas> +++ b/package/enlightenment/Config.in
 Thomas> @@ -0,0 +1,29 @@
 Thomas> +config BR2_PACKAGE_ENLIGHTENMENT
 Thomas> +	bool "enlightenment"
 Thomas> +	select BR2_PACKAGE_LIBECORE
 Thomas> +	select BR2_PACKAGE_LIBECORE_X
 Thomas> +	select BR2_PACKAGE_LIBEINA
 Thomas> +	select BR2_PACKAGE_LIBEET
 Thomas> +	select BR2_PACKAGE_LIBEVAS
 Thomas> +	select BR2_PACKAGE_LIBEVAS_JPEG
 Thomas> +	select BR2_PACKAGE_LIBEVAS_PNG
 Thomas> +	select BR2_PACKAGE_LIBEVAS_EET
 Thomas> +	select BR2_PACKAGE_LIBECORE_EVAS
 Thomas> +	select BR2_PACKAGE_LIBEDJE
 Thomas> +	select BR2_PACKAGE_LIBEFREET
 Thomas> +	select BR2_PACKAGE_LIBEDBUS
 Thomas> +	select BR2_PACKAGE_LIBEIO
 Thomas> +	select BR2_PACKAGE_XCB_UTIL_KEYSYMS
 Thomas> +	select BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
 Thomas> +	select BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
 Thomas> +	# libevas-generic-loaders-svg -> librsvg -> glib2
 Thomas> +	depends on BR2_USE_WCHAR
 Thomas> +	# libedbus -> dbus
 Thomas> +	depends on BR2_TOOLCHAIN_HAS_THREADS
 Thomas> +	# libedbus -> dbus
 Thomas> +	depends on BR2_USE_MMU
 Thomas> +	depends on BR2_PACKAGE_XORG7
 Thomas> +

No help text?

 Thomas> +++ b/package/enlightenment/enlightenment-no-execinfo.patch
 Thomas> @@ -0,0 +1,27 @@
 Thomas> +Do not include <execinfo.h> when not available
 Thomas> +
 Thomas> +On uClibc, <execinfo.h> is not necessarily installed, depending on the
 Thomas> +configuration. Enlightenment properly makes <execinfo.h> optional, but
 Thomas> +uses __GLIBC__ to check if it is available or not. Unfortunately,
 Thomas> +uClibc defines __GLIBC__, so it is not the right way to decide if
 Thomas> +<execinfo.h> is available.
 Thomas> +
 Thomas> +Instead, Enlightenment already has a configure.ac check for
 Thomas> +execinfo.h, so we simply use the result of this configure.ac check to
 Thomas> +decide whether execinfo.h is to be included or not.
 Thomas> +
 Thomas> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Don't forget to send this upstream.

-- 
Bye, Peter Korsgaard
