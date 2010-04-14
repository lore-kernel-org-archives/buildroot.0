From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 14 Apr 2010 10:13:03 +0200
Subject: [Buildroot] [PATCH 35/41] package: add libgail package
In-Reply-To: <1271199974-30434-36-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Wed, 14 Apr 2010 01:06:08 +0200")
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
	<1271199974-30434-36-git-send-email-llandwerlin@gmail.com>
Message-ID: <87fx2yh2pc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> This package include a patch for directfb support. This patch has been
 llandwerlin> proposed for upstream integration
 llandwerlin> (https://bugzilla.gnome.org/show_bug.cgi?id=614199).

 llandwerlin> +++ b/package/libgail/Config.in
 llandwerlin> @@ -0,0 +1,15 @@
 llandwerlin> +config BR2_PACKAGE_LIBGAIL
 llandwerlin> +	bool "libgail"
 llandwerlin> +	select BR2_PACKAGE_GTK2
 llandwerlin> +	help
 llandwerlin> +	  GAIL provides accessibility support for gtk+ and
 llandwerlin> +          libgnomecanvas by implementing AtkObjects for widgets in
 llandwerlin> +          gtk+ and libgnomecanvas. The GAIL library is a GTK+ module.
 llandwerlin> +          For example, if the module is loaded in a program which
 llandwerlin> +          calls gtk_widget_get_accessible() for a GtkEntry an instance
 llandwerlin> +          of GailEntry is returned. This module is normally used with
 llandwerlin> +          the atk-bridge GTK+ module from at-spi to allow an assistive
 llandwerlin> +          technology, e.g a screenreader, to query or drive the
 llandwerlin> +          program.

Indentation wrong from line 2 of help text.

 llandwerlin> +
 llandwerlin> +ifneq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 llandwerlin> +LIBGAIL_CONF_OPT += --disable-x
 llandwerlin> +endif
 llandwerlin> +
 llandwerlin> +LIBGAIL_DEPENDENCIES = libgtk2 pango

No host-pkg-config?

 llandwerlin> +HOST_LIBGAIL_DEPENDENCIES = host-pkg-config

No libgtk2 / pango?

-- 
Bye, Peter Korsgaard
