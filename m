From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 26 Apr 2013 22:17:57 +0200
Subject: [Buildroot] [PATCH] jansson: new package
In-Reply-To: <1364380437-28214-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Wed, 27 Mar 2013 10:33:57 +0000")
References: <1364380437-28214-1-git-send-email-spdawson@gmail.com>
Message-ID: <87r4hx6o7e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>
 spdawson> ---
 spdawson>  package/Config.in          |    1 +
 spdawson>  package/jansson/Config.in  |    7 +++++++
 spdawson>  package/jansson/jansson.mk |   12 ++++++++++++
 spdawson>  3 files changed, 20 insertions(+)
 spdawson>  create mode 100644 package/jansson/Config.in
 spdawson>  create mode 100644 package/jansson/jansson.mk

 spdawson> diff --git a/package/Config.in b/package/Config.in
 spdawson> index 5d8f4f6..35a6c5a 100644
 spdawson> --- a/package/Config.in
 spdawson> +++ b/package/Config.in
 spdawson> @@ -602,6 +602,7 @@ menu "JSON/XML"
 spdawson>  source "package/cjson/Config.in"
 spdawson>  source "package/expat/Config.in"
 spdawson>  source "package/ezxml/Config.in"
 spdawson> +source "package/jansson/Config.in"
 spdawson>  source "package/json-c/Config.in"
 spdawson>  source "package/json-glib/Config.in"
 spdawson>  source "package/libroxml/Config.in"
 spdawson> diff --git a/package/jansson/Config.in b/package/jansson/Config.in
 spdawson> new file mode 100644
 spdawson> index 0000000..960a7c4
 spdawson> --- /dev/null
 spdawson> +++ b/package/jansson/Config.in
 spdawson> @@ -0,0 +1,7 @@
 spdawson> +config BR2_PACKAGE_JANSSON
 spdawson> +	bool "jansson"
 spdawson> +	help
 spdawson> +	  Jansson is a C library for encoding, decoding and manipulating JSON
 spdawson> +	  data.
 spdawson> +
 spdawson> +	  http://www.digip.org/jansson/
 spdawson> diff --git a/package/jansson/jansson.mk b/package/jansson/jansson.mk
 spdawson> new file mode 100644
 spdawson> index 0000000..c7183df
 spdawson> --- /dev/null
 spdawson> +++ b/package/jansson/jansson.mk
 spdawson> @@ -0,0 +1,12 @@
 spdawson> +#############################################################
 spdawson> +#
 spdawson> +# jansson
 spdawson> +#
 spdawson> +#############################################################
 spdawson> +JANSSON_VERSION = 2.4

We normally have an empty line between the header and the JANSSON_*
variables. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
