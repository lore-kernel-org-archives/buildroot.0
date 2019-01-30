From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Jan 2019 21:34:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/pugixml: add support for a
 limited set of configuration options
In-Reply-To: <20190130201416.9078-1-patrickdepinguin@gmail.com>
References: <20190130201416.9078-1-patrickdepinguin@gmail.com>
Message-ID: <20190130213451.6c45821d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Quick comments, not a full review.

On Wed, 30 Jan 2019 21:14:16 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> +config BR2_PACKAGE_PUGIXML_NO_XPATH_SUPPORT
> +	bool "Disable XPath support"
> +	help
> +	  Disables XPath support in pugixml. Both XPath interfaces and
> +	  XPath implementation are excluded from compilation. This
> +	  option is provided in case you do not need XPath functionality
> +	  and need to save code space.
> +
> +config BR2_PACKAGE_PUGIXML_NO_STL_SUPPORT
> +	bool "Disable STL support"
> +	help
> +	  Disables use of STL in pugixml. The functions that operate on
> +	  STL types are no longer present (i.e. load/save via iostream)
> +	  if this macro is defined.  This option is provided in case
> +	  your target platform does not have a standard-compliant STL
> +	  implementation.
> +
> +config BR2_PACKAGE_PUGIXML_NO_EXCEPTIONS
> +	bool "Disable exceptions"
> +	help
> +	  Disables use of exceptions in pugixml. This option is provided
> +	  in case your target platform does not have exception handling
> +	  capabilities.

These options that you enable to disable something are backwards. Could
you turn them over to actual enabling options, with "default y" if you
want to keep backward compatibility.

> +config BR2_PACKAGE_PUGIXML_HEADER_ONLY
> +	bool "Enable header-only version"
> +	help
> +	  All source code for pugixml will be included in every
> +	  translation unit that includes pugixml.hpp. This is how most
> +	  of Boost and STL libraries work.
> +
> +	  http://pugixml.org/docs/manual.html#install.building.header
> +
> +config BR2_PACKAGE_PUGIXML_HAS_LONG_LONG

"HAS_LONG_LONG" doesn't read like an enabling option, but like "does
this package has long long".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
