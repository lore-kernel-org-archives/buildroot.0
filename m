From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 7 Apr 2017 14:01:34 +0200
Subject: [Buildroot] [PATCH] libbson: new package
In-Reply-To: <1491565334-23914-1-git-send-email-semenak94@mail.ru>
References: <libbson: new package>
 <1491565334-23914-1-git-send-email-semenak94@mail.ru>
Message-ID: <22edf29c-a147-32f5-17e1-03d1eb4b239d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-04-17 13:42, Semyon Kolganov wrote:
> Signed-off-by: Semyon Kolganov <semenak94@mail.ru>
> ---
>  package/Config.in            |  1 +
>  package/libbson/Config.in    |  5 +++++
>  package/libbson/libbson.hash |  2 ++
>  package/libbson/libbson.mk   | 16 ++++++++++++++++
>  4 files changed, 24 insertions(+)
>  create mode 100644 package/libbson/Config.in
>  create mode 100644 package/libbson/libbson.hash
>  create mode 100644 package/libbson/libbson.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 71bd44a..f312e42 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1434,6 +1434,7 @@ menu "Text and terminal handling"
>  	source "package/augeas/Config.in"
>  	source "package/enchant/Config.in"
>  	source "package/icu/Config.in"
> +	source "package/libbson/Config.in"
>  	source "package/libcli/Config.in"
>  	source "package/libedit/Config.in"
>  	source "package/libenca/Config.in"
> diff --git a/package/libbson/Config.in b/package/libbson/Config.in
> new file mode 100644
> index 0000000..5e361ea
> --- /dev/null
> +++ b/package/libbson/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_LIBBSON
> +	bool "libbson"
> +	help
> +	  libbson is a library providing useful routines related to 
> +	  building, parsing, and iterating BSON documents.
> diff --git a/package/libbson/libbson.hash b/package/libbson/libbson.hash
> new file mode 100644
> index 0000000..a0abdb6
> --- /dev/null
> +++ b/package/libbson/libbson.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256	d9a1b2229a4aac2edb1564b909f0770a972af9bf94994acce2b21b2905913aed libbson-1.6.2.tar.gz
> diff --git a/package/libbson/libbson.mk b/package/libbson/libbson.mk
> new file mode 100644
> index 0000000..9941a2f
> --- /dev/null
> +++ b/package/libbson/libbson.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# libbson
> +#
> +################################################################################
> +
> +LIBBSON_VERSION = 1.6.2
> +LIBBSON_SITE = $(call github,mongodb,libbson,$(LIBBSON_VERSION))
> +LIBBSON_LICENSE = GPL-2.0
> +LIBBSON_LICENSE_FILES = COPYING

 jsonl is covered by MIT license, which can be found in src/jsonl/LICENSE.

 The rest seems to be Apache-2.0. Please use Debian's licensecheck to evaluate
the license. Or at least, open the COPYING file and read it!


> +LIBBSON_INSTALL_STAGING = YES
> +
> +LIBBSON_CONF_OPTS = \
> +	-DENABLE_TESTS=OFF
> +
> +$(eval $(cmake-package))
> \ No newline at end of file

 Please add a newline at the end of the file (not an empty line, just make sure
that the last line has a newline at the end).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
