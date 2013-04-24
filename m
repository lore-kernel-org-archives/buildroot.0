From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 24 Apr 2013 21:49:08 +0200
Subject: [Buildroot] [PATCH 2/2] libxml++: new package
In-Reply-To: <1366816283-11363-2-git-send-email-nicolas.menegale@openwide.fr>
 (nmenegale's message of "Wed, 24 Apr 2013 17:11:23 +0200")
References: <1366816283-11363-1-git-send-email-nicolas.menegale@openwide.fr>
 <1366816283-11363-2-git-send-email-nicolas.menegale@openwide.fr>
Message-ID: <87li87btfv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "nmenegale" == nmenegale  <nicolas.menegale@openwide.fr> writes:

 nmenegale> Signed-off-by: Nicolas M?n?gale <nicolas.menegale@openwide.fr>
 nmenegale> ---
 nmenegale> v2: minor modifications: empty lines between headers and variable, license,
 nmenegale> tar.xz instead of tar.bz2
 nmenegale> libxml++ is a C++ wrapper for libxml2 it has glibmm as dependency

This line should imho have been part of the commit message.

 nmenegale> Signed-off-by: nmenegale <nicolas.menegale@openwide.fr>
 nmenegale> ---
 nmenegale>  package/Config.in            |  1 +
 nmenegale>  package/libxmlpp/Config.in   | 13 +++++++++++++
 nmenegale>  package/libxmlpp/libxmlpp.mk | 17 +++++++++++++++++
 nmenegale>  3 files changed, 31 insertions(+)
 nmenegale>  create mode 100644 package/libxmlpp/Config.in
 nmenegale>  create mode 100644 package/libxmlpp/libxmlpp.mk

 nmenegale> diff --git a/package/Config.in b/package/Config.in
 nmenegale> index ca947d9..ede0ba0 100644
 nmenegale> --- a/package/Config.in
 nmenegale> +++ b/package/Config.in
 nmenegale> @@ -623,6 +623,7 @@ source "package/json-glib/Config.in"
 nmenegale>  source "package/libroxml/Config.in"
 nmenegale>  source "package/libxml-parser-perl/Config.in"
 nmenegale>  source "package/libxml2/Config.in"
 nmenegale> +source "package/libxmlpp/Config.in"
 nmenegale>  source "package/libxslt/Config.in"
 nmenegale>  source "package/libyaml/Config.in"
 nmenegale>  source "package/mxml/Config.in"
 nmenegale> diff --git a/package/libxmlpp/Config.in b/package/libxmlpp/Config.in
 nmenegale> new file mode 100644
 nmenegale> index 0000000..3c9845c
 nmenegale> --- /dev/null
 nmenegale> +++ b/package/libxmlpp/Config.in
 nmenegale> @@ -0,0 +1,13 @@
 nmenegale> +config BR2_PACKAGE_LIBXMLPP
 nmenegale> +	bool "libxmlpp"
 nmenegale> +	select BR2_PACKAGE_LIBXML2
 nmenegale> +	select BR2_PACKAGE_GLIBMM
 nmenegale> +	depends on BR2_INSTALL_LIBSTDCPP
 nmenegale> +	depends on BR2_USE_WCHAR
 nmenegale> +	help
 nmenegale> +	  libxml++ is a C++ wrapper for the libxml XML parser library.	
 nmenegale> +	  

Trailing spaces.

 nmenegale> +	  http://libxmlplusplus.sourceforge.net/
 nmenegale> +
 nmenegale> +comment "LibXML++ requires a toolchain with C++ & WCHAR support enabled"

You have a mix of libxmlpp / libxml++ and LibXML++. I've changed them
all to be libxml++.

Committed with those issues fixed, thanks.

-- 
Bye, Peter Korsgaard
