From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Sep 2016 00:15:58 +0200
Subject: [Buildroot] [PATCH] add new library: libpugixml
In-Reply-To: <20160904210846.1332-1-theo.debrouwere@skynet.be>
References: <20160904210846.1332-1-theo.debrouwere@skynet.be>
Message-ID: <8eba02bb-9792-ef45-424b-01c7f7cd7c23@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Theo,

 In addition to what the other two have commented...

On 04-09-16 23:08, Theo Debrouwere wrote:
> From: Theo Debrouwere <t.debrouwere@televic.com>
> 
>     pugixml is a light-weight C++ XML processing library. It features:

 Since upstream calls it pugixml (without lib- prefix), the buildroot package
should be named the same.

>     * DOM-like interface with rich traversal/modification capabilities
>     * Extremely fast non-validating XML parser which constructs the DOM tree from an XML file/buffer
>     * XPath 1.0 implementation for complex data-driven tree queries
>     * Full Unicode support with Unicode interface variants and automatic encoding conversions
> 
>     Homepage: http://pugixml.org/
>     Repository: https://github.com/zeux/pugixml
> 
> Signed-off-by: Theo Debrouwere <t.debrouwere@televic.com>
> ---
>  package/Config.in                  |  1 +
>  package/libpugixml/Config.in       | 15 +++++++++++++++
>  package/libpugixml/libpugixml.hash |  2 ++
>  package/libpugixml/libpugixml.mk   | 19 +++++++++++++++++++
>  4 files changed, 37 insertions(+)
>  create mode 100644 package/libpugixml/Config.in
>  create mode 100644 package/libpugixml/libpugixml.hash
>  create mode 100644 package/libpugixml/libpugixml.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 1e51a45..d0198ce 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1092,6 +1092,7 @@ menu "JSON/XML"
>  	source "package/libxslt/Config.in"
>  	source "package/libyaml/Config.in"
>  	source "package/mxml/Config.in"
> +	source "package/libpugixml/Config.in"

 ... and then it's in the right place here :-)

>  	source "package/rapidjson/Config.in"
>  	source "package/rapidxml/Config.in"
>  	source "package/raptor/Config.in"
> diff --git a/package/libpugixml/Config.in b/package/libpugixml/Config.in
> new file mode 100644
> index 0000000..17c6eec
> --- /dev/null
> +++ b/package/libpugixml/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_LIBPUGIXML
> +	bool "libpugixml"
> +	help
> +	  Light-weight, simple and fast XML parser for C++ with XPath support
> +
> +	  Features:
> +	  * DOM-like interface with rich traversal/modification capabilities
> +	  * Extremely fast non-validating XML parser which constructs the DOM tree
> +	    from an XML file/buffer
> +	  * XPath 1.0 implementation for complex data-driven tree queries
> +	  * Full Unicode support with Unicode interface variants and automatic
> +	    encoding conversions
> +
> +	  http://pugixml.org/
> +	  https://github.com/zeux/pugixml
> diff --git a/package/libpugixml/libpugixml.hash b/package/libpugixml/libpugixml.hash
> new file mode 100644
> index 0000000..9007f7c
> --- /dev/null
> +++ b/package/libpugixml/libpugixml.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256  fbe10d46f61d769f7d92a296102e4e2bd3ee16130f11c5b10a1aae590ea1f5ca  pugixml-1.7.tar.gz
> diff --git a/package/libpugixml/libpugixml.mk b/package/libpugixml/libpugixml.mk
> new file mode 100644
> index 0000000..3c9987e
> --- /dev/null
> +++ b/package/libpugixml/libpugixml.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# libpugixml
> +#
> +################################################################################
> +
> +LIBPUGIXML_VERSION = 1.7
> +LIBPUGIXML_SOURCE = pugixml-$(LIBPUGIXML_VERSION).tar.gz

 If the package is called pugixml, this line isn't needed.


 Regards,
 Arnout


> +LIBPUGIXML_SITE = http://github.com/zeux/pugixml/releases/download/v$(LIBPUGIXML_VERSION)
> +LIBPUGIXML_LICENSE = MIT
> +LIBPUGIXML_LICENSE_FILES = docs/manual.html
> +LIBPUGIXML_INSTALL_STAGING = YES
> +
> +LIBPUGIXML_SUBDIR = scripts
> +
> +# build libpugixml as a shared library
> +LIBPUGIXML_CONF_OPTS = -DBUILD_SHARED_LIBS=ON
> +
> +$(eval $(cmake-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
