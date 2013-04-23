From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 23 Apr 2013 11:20:39 -0300
Subject: [Buildroot] [PATCH 1/2] glibmm: new package
In-Reply-To: <1366726167-3396-1-git-send-email-nicolas.menegale@openwide.fr>
References: <1366726167-3396-1-git-send-email-nicolas.menegale@openwide.fr>
Message-ID: <517698B7.1050405@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/23/2013 11:09 AM, nmenegale wrote:

> +++ b/package/glibmm/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_GLIBMM
> +	bool "glibmm"
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_LIBSIGC
> +	help
> +	  The GLibmm package is a set of C++ bindings for GLib. 
> +	  	
> +	  http://www.gtkmm.org/

This should depend on BR2_INSTALL_LIBSTDCPP since it requires a
toolchain with C++ support, with a comment otherwise like other packages
do (look at package/protobuf/Config.in for an example).
Same case with libxml++.

> +++ b/package/glibmm/glibmm.mk
> @@ -0,0 +1,13 @@
> +#############################################################
> +#
> +# Glibmm
> +#
> +#############################################################
> +GLIBMM_VERSION = 2.30.1
> +GLIBMM_LICENSE = LGPLv2.1
> +GLIBMM_SOURCE = glibmm-$(GLIBMM_VERSION).tar.bz2
> +GLIBMM_SITE = http://ftp.gnome.org/pub/gnome/sources/glibmm/2.30
> +GLIBMM_INSTALL_STAGING = YES
> +GLIBMM_DEPENDENCIES = libglib2 libsigc host-pkgconf
> +
> +$(eval $(autotools-package))

You define GLIBMM_LICENSE but no GLIBMM_LICENSE_FILES, could you fix
that since glibmm ships them?
libglib2 depends on BR2_USE_WCHAR, you should add that too as a depend
in Config.in
Otherwise it's looking good, thanks.
Regards.
