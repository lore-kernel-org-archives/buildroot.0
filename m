From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Mar 2013 22:01:26 +0100
Subject: [Buildroot] [PATCH] json-glib: new package
In-Reply-To: <1361222943-1892-1-git-send-email-henrique@henriquecamargo.com>
 (Henrique Camargo's message of "Mon, 18 Feb 2013 18:29:03 -0300")
References: <1361222943-1892-1-git-send-email-henrique@henriquecamargo.com>
Message-ID: <87ehfczal5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Henrique" == Henrique Camargo <henrique@henriquecamargo.com> writes:

 Henrique> JSON-GLib is a library providing serialization and deserialization
 Henrique> support for the JavaScript Object Notation (JSON) format described by
 Henrique> RFC 4627.

 Henrique> https://live.gnome.org/JsonGlib/

 Henrique> Signed-off-by: Henrique Camargo <henrique@henriquecamargo.com>
 Henrique> ---
 Henrique>  package/Config.in              |    1 +
 Henrique>  package/json-glib/Config.in    |   14 ++++++++++++++
 Henrique>  package/json-glib/json-glib.mk |   20 ++++++++++++++++++++
 Henrique>  3 files changed, 35 insertions(+)
 Henrique>  create mode 100644 package/json-glib/Config.in
 Henrique>  create mode 100644 package/json-glib/json-glib.mk

 Henrique> diff --git a/package/Config.in b/package/Config.in
 Henrique> index 2fad94d..4959680 100644
 Henrique> --- a/package/Config.in
 Henrique> +++ b/package/Config.in
 Henrique> @@ -586,6 +586,7 @@ source "package/cjson/Config.in"
 Henrique>  source "package/expat/Config.in"
 Henrique>  source "package/ezxml/Config.in"
 Henrique>  source "package/json-c/Config.in"
 Henrique> +source "package/json-glib/Config.in"
 Henrique>  source "package/libroxml/Config.in"
 Henrique>  source "package/libxml-parser-perl/Config.in"
 Henrique>  source "package/libxml2/Config.in"
 Henrique> diff --git a/package/json-glib/Config.in b/package/json-glib/Config.in
 Henrique> new file mode 100644
 Henrique> index 0000000..f2e3a7c
 Henrique> --- /dev/null
 Henrique> +++ b/package/json-glib/Config.in
 Henrique> @@ -0,0 +1,14 @@
 Henrique> +config BR2_PACKAGE_JSON_GLIB
 Henrique> +	bool "json-glib"
 Henrique> +	depends on BR2_USE_WCHAR # glib2
 Henrique> +	select BR2_PACKAGE_LIBGLIB2
 Henrique> +	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 Henrique> +	help
 Henrique> +	  JSON-GLib is a library providing serialization and deserialization
 Henrique> +	  support for the JavaScript Object Notation (JSON) format described by
 Henrique> +	  RFC 4627.
 Henrique> +
 Henrique> +	  https://live.gnome.org/JsonGlib/

The help text lines are a bit too long.

 Henrique> diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
 Henrique> new file mode 100644
 Henrique> index 0000000..06e33ab
 Henrique> --- /dev/null
 Henrique> +++ b/package/json-glib/json-glib.mk
 Henrique> @@ -0,0 +1,20 @@
 Henrique> +#############################################################
 Henrique> +#
 Henrique> +# json-glib
 Henrique> +#
 Henrique> +#############################################################
 Henrique> +
 Henrique> +JSON_GLIB_MAJOR_VERSION = 0.14
 Henrique> +JSON_GLIB_MINOR_VERSION = 2
 Henrique> +JSON_GLIB_VERSION = $(JSON_GLIB_MAJOR_VERSION).$(JSON_GLIB_MINOR_VERSION)
 Henrique> +JSON_GLIB_SITE = http://ftp.gnome.org/pub/GNOME/sources/json-glib/$(JSON_GLIB_MAJOR_VERSION)
 Henrique> +JSON_GLIB_SOURCE = json-glib-$(JSON_GLIB_VERSION).tar.xz
 Henrique> +
 Henrique> +JSON_GLIB_INSTALL_STAGING = YES
 Henrique> +

You're missing LICENSE / LICENSE_FILES lines.

Committed with those fixes, thanks.

-- 
Bye, Peter Korsgaard
