From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 30 Apr 2013 10:06:36 +0200
Subject: [Buildroot] [PATCH v2 3/4] wayland: new package
In-Reply-To: <1367267165-6873-4-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 29 Apr 2013 22:26:04 +0200")
References: <1367267165-6873-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1367267165-6873-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87obcw30j7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/Config.in          |    1 +
 Thomas>  package/wayland/Config.in  |   10 ++++++++++
 Thomas>  package/wayland/wayland.mk |   30 ++++++++++++++++++++++++++++++
 Thomas>  3 files changed, 41 insertions(+)
 Thomas>  create mode 100644 package/wayland/Config.in
 Thomas>  create mode 100644 package/wayland/wayland.mk

 Thomas> diff --git a/package/Config.in b/package/Config.in
 Thomas> index e359306..76feb7d 100644
 Thomas> --- a/package/Config.in
 Thomas> +++ b/package/Config.in
 Thomas> @@ -448,6 +448,7 @@ source "package/pango/Config.in"
 Thomas>  source "package/pixman/Config.in"
 Thomas>  source "package/poppler/Config.in"
 Thomas>  source "package/tiff/Config.in"
 Thomas> +source "package/wayland/Config.in"
 Thomas>  source "package/webkit/Config.in"
 Thomas>  source "package/zxing/Config.in"
 Thomas>  endmenu
 Thomas> diff --git a/package/wayland/Config.in b/package/wayland/Config.in
 Thomas> new file mode 100644
 Thomas> index 0000000..e5d2649
 Thomas> --- /dev/null
 Thomas> +++ b/package/wayland/Config.in
 Thomas> @@ -0,0 +1,10 @@
 Thomas> +config BR2_PACKAGE_WAYLAND
 Thomas> +	bool "wayland"
 Thomas> +	select BR2_PACKAGE_LIBFFI
 Thomas> +	select BR2_PACKAGE_EXPAT
 Thomas> +	help
 Thomas> +	  Wayland is a project to define a protocol for a compositor
 Thomas> +	  to talk to its clients as well as a library implementation
 Thomas> +	  of the protocol.
 Thomas> +
 Thomas> +	  http://wayland.freedesktop.org/
 Thomas> diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
 Thomas> new file mode 100644
 Thomas> index 0000000..65381ec
 Thomas> --- /dev/null
 Thomas> +++ b/package/wayland/wayland.mk
 Thomas> @@ -0,0 +1,30 @@
 Thomas> +#############################################################
 Thomas> +#
 Thomas> +# wayland
 Thomas> +#
 Thomas> +#############################################################
 Thomas> +
 Thomas> +WAYLAND_VERSION = 1.1.0
 Thomas> +WAYLAND_SITE = http://wayland.freedesktop.org/releases/
 Thomas> +WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 Thomas> +WAYLAND_LICENSE = MIT
 Thomas> +WAYLAND_LICENSE_FILES = COPYING
 Thomas> +
 Thomas> +WAYLAND_INSTALL_STAGING = YES
 Thomas> +WAYLAND_DEPENDENCIES = libffi host-pkgconf expat host-expat
 Thomas> +
 Thomas> +# wayland needs a wayland-scanner program to generate some of its
 Thomas> +# source code. By default, it builds it with CC, so it doesn't in

s/doesn't in/doesn't work with/

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
