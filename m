From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 02 Jul 2013 23:27:59 +0200
Subject: [Buildroot] [PATCH v2] jimtcl: New package
In-Reply-To: <1372429944-2732-1-git-send-email-elezegarcia@gmail.com>
 (Ezequiel Garcia's message of "Fri, 28 Jun 2013 11:32:24 -0300")
References: <1372429944-2732-1-git-send-email-elezegarcia@gmail.com>
Message-ID: <87hagcslcw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ezequiel" == Ezequiel Garcia <elezegarcia@gmail.com> writes:

 Ezequiel> Add new jimtcl package - a lightweight tclsh alternative.
 Ezequiel> Useful for a lighter footprint usb_modeswitch installation.
 Ezequiel> tclsh size is ~700kB for ARM compared to ~200kB for jimtcl.

 Ezequiel> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Ezequiel> Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
 Ezequiel> ---
 Ezequiel> Changes from v1:

 Ezequiel>  * Use selected Debian mirror to get the package sources,
 Ezequiel>    instead of Jim Tcl's Git repository. Suggested by Gustavo.

 Ezequiel>  * Use positive logic in ifeq's. Suggested by Gustavo.

 Ezequiel>  * Build a shared library by default, and make this depend on
 Ezequiel>    BR_PREFER_STATIC_LIB option.

 Ezequiel>  package/Config.in        |  1 +
 Ezequiel>  package/jimtcl/Config.in |  9 +++++++
 Ezequiel>  package/jimtcl/jimtcl.mk | 62 ++++++++++++++++++++++++++++++++++++++++++++++++
 Ezequiel>  3 files changed, 72 insertions(+)
 Ezequiel>  create mode 100644 package/jimtcl/Config.in
 Ezequiel>  create mode 100644 package/jimtcl/jimtcl.mk

 Ezequiel> diff --git a/package/Config.in b/package/Config.in
 Ezequiel> index 0eb6a9c..b62f90a 100644
 Ezequiel> --- a/package/Config.in
 Ezequiel> +++ b/package/Config.in
 Ezequiel> @@ -307,6 +307,7 @@ source "package/erlang/Config.in"
 Ezequiel>  source "package/enscript/Config.in"
 Ezequiel>  source "package/haserl/Config.in"
 Ezequiel>  source "package/jamvm/Config.in"
 Ezequiel> +source "package/jimtcl/Config.in"
 Ezequiel>  source "package/lua/Config.in"
 Ezequiel>  source "package/luajit/Config.in"
 Ezequiel>  if BR2_PACKAGE_LUA || BR2_PACKAGE_LUAJIT
 Ezequiel> diff --git a/package/jimtcl/Config.in b/package/jimtcl/Config.in
 Ezequiel> new file mode 100644
 Ezequiel> index 0000000..c7a12f2
 Ezequiel> --- /dev/null
 Ezequiel> +++ b/package/jimtcl/Config.in
 Ezequiel> @@ -0,0 +1,9 @@
 Ezequiel> +config BR2_PACKAGE_JIMTCL
 Ezequiel> +	bool "jimtcl"
 Ezequiel> +	help
 Ezequiel> +	  Jim Tcl is a small footprint reimplementation of the Tcl scripting language.
 Ezequiel> +	  The core language engine is compatible with Tcl 8.5+, while implementing
 Ezequiel> +	  a significant subset of the Tcl 8.6 command set, plus additional features
 Ezequiel> +	  available only in Jim Tcl.

Help text should get wrapped so it fits within 80 chars (including tab).

 Ezequiel> +
 Ezequiel> +	  http://jim.tcl.tk
 Ezequiel> diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
 Ezequiel> new file mode 100644
 Ezequiel> index 0000000..97c8a42
 Ezequiel> --- /dev/null
 Ezequiel> +++ b/package/jimtcl/jimtcl.mk
 Ezequiel> @@ -0,0 +1,62 @@
 Ezequiel> +#############################################################
 Ezequiel> +#
 Ezequiel> +# jimtcl
 Ezequiel> +#
 Ezequiel> +#############################################################

The #### lines should be 80 chars.

 Ezequiel> +
 Ezequiel> +JIMTCL_VERSION = 0.73
 Ezequiel> +JIMTCL_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/j/jimtcl
 Ezequiel> +JIMTCL_SOURCE = jimtcl_$(JIMTCL_VERSION).orig.tar.bz2
 Ezequiel> +JIMTCL_INSTALL_STAGING = YES
 Ezequiel> +
 Ezequiel> +JIMTCL_HEADERS_TO_INSTALL = \
 Ezequiel> +	jim.h \
 Ezequiel> +	jim-eventloop.h \
 Ezequiel> +	jim-signal.h \
 Ezequiel> +	jim-subcmd.h \
 Ezequiel> +	jim-win32compat.h \

I don't know anything about jimsh, but with that file name is it really
needed?

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
