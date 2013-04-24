From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 24 Apr 2013 21:43:52 +0200
Subject: [Buildroot] [PATCH 1/2] glibmm: new package
In-Reply-To: <1366791236-22718-1-git-send-email-nicolas.menegale@openwide.fr>
 (nmenegale's message of "Wed, 24 Apr 2013 10:13:55 +0200")
References: <1366791236-22718-1-git-send-email-nicolas.menegale@openwide.fr>
Message-ID: <87ppxjbton.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "nmenegale" == nmenegale  <nicolas.menegale@openwide.fr> writes:

 nmenegale> Signed-off-by: Nicolas M?n?gale  <nicolas.menegale@openwide.fr>
 nmenegale> ---
 nmenegale> v1: added BR2_INSTALL_LIBSTDCPP and BR2_USE_WCHAR
 nmenegale> glibmm is also a dependency of libxml++ (the libxml2 c++ wrapper)
 nmenegale> Signed-off-by: nmenegale <nicolas.menegale@openwide.fr>
 nmenegale> ---
 nmenegale>  package/Config.in        |  1 +
 nmenegale>  package/glibmm/Config.in | 13 +++++++++++++
 nmenegale>  package/glibmm/glibmm.mk | 13 +++++++++++++
 nmenegale>  3 files changed, 27 insertions(+)
 nmenegale>  create mode 100644 package/glibmm/Config.in
 nmenegale>  create mode 100644 package/glibmm/glibmm.mk

 nmenegale> diff --git a/package/Config.in b/package/Config.in
 nmenegale> index 06bcdef..c75c3ec 100644
 nmenegale> --- a/package/Config.in
 nmenegale> +++ b/package/Config.in
 nmenegale> @@ -558,6 +558,7 @@ source "package/fftw/Config.in"
 nmenegale>  source "package/libargtable2/Config.in"
 nmenegale>  source "package/argp-standalone/Config.in"
 nmenegale>  source "package/boost/Config.in"
 nmenegale> +source "package/glibmm/Config.in"
 nmenegale>  source "package/gmp/Config.in"
 nmenegale>  source "package/gsl/Config.in"
 nmenegale>  source "package/gtest/Config.in"
 nmenegale> diff --git a/package/glibmm/Config.in b/package/glibmm/Config.in
 nmenegale> new file mode 100644
 nmenegale> index 0000000..012b681
 nmenegale> --- /dev/null
 nmenegale> +++ b/package/glibmm/Config.in
 nmenegale> @@ -0,0 +1,13 @@
 nmenegale> +config BR2_PACKAGE_GLIBMM
 nmenegale> +	bool "glibmm"
 nmenegale> +	select BR2_PACKAGE_LIBGLIB2
 nmenegale> +	select BR2_PACKAGE_LIBSIGC
 nmenegale> +	depends on BR2_INSTALL_LIBSTDCPP
 nmenegale> +	depends on BR2_USE_WCHAR
 nmenegale> +	help
 nmenegale> +	  The GLibmm package is a set of C++ bindings for GLib. 
 nmenegale> +	  	

There's some stray trailing spaces here. Committed with that fixed,
thanks.

-- 
Bye, Peter Korsgaard
