From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jan 2011 18:20:54 +0100
Subject: [Buildroot] [PATCH 1/2] Add libjson-glib to packages
In-Reply-To: <1295248645-3677-1-git-send-email-EliasWoods@gmail.com>
References: <1295248645-3677-1-git-send-email-EliasWoods@gmail.com>
Message-ID: <20110124182054.3b012347@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Jan 2011 02:17:24 -0500
Elias Woods <eliaswoods@gmail.com> wrote:

> +config BR2_PACKAGE_LIBJSONGLIB
> +	bool "libjson-glib"
> +	depends on BR2_PACKAGE_LIBGLIB2 # glib2

We usually prefer "select" dependencies for library dependencies, but
in that case, it's true that the library is very libglib2-specific, so
we may decide otherwise. I'll let Peter decide on this, I don't have a
strong opinion.

> +	help
> +	Many high-level languages already provide native modules for parsing, generating and manipulating JSON data streams. JSON-GLib is a C library based on GLib and released under the terms of the GNU Lesser General Public License version 2.1. It provides a parser and a generator GObject classes and various wrappers for the complex data types employed by JSON, such as arrays and objects.

Needs to be wrapped at ~80 columns. And the indentation level for the
help text is one tab + 2 spaces.

> --- /dev/null
> +++ b/package/libjson-glib/libjson-glib.mk
> @@ -0,0 +1,31 @@
> +#############################################################
> +#
> +# libjson-glib
> +#
> +#############################################################
> +LIBJSONGLIB_VERSION_MAJOR = 0
> +LIBJSONGLIB_VERSION_MINOR = 12
> +LIBJSONGLIB_VERSION_MICRO = 2

Very minor nitpick: maybe there could be only two variables: one with
0.12 and the other with 2 ?

LIBJSONGLIB_VERSION_MAJOR = 0.12
LIBJSONGLIB_VERSION_MINOR = 2

Like this is done in package/libglib2/libglib2.mk or
package/libgtk2/libgtk2.mk.

> +LIBJSONGLIB_LIBTOOL_PATCH = NO

Why ?

> +LIBJSONGLIB_INSTALL_STAGING = YES
> +LIBJSONGLIB_INSTALL_TARGET = YES
> +#LIBJSONGLIB_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install

If it's commented, it's useless, so remove.

> +$(eval $(call AUTOTARGETS,package,LIBJSONGLIB))

LIBJSONGLIB should be lowercase here.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
