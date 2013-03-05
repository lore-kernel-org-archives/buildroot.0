From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Tue, 05 Mar 2013 13:01:39 +0200
Subject: [Buildroot] [PATCH v2] new package: libtasn1
In-Reply-To: <87obey8eji.fsf@dell.be.48ers.dk>
References: <1361219338-27624-1-git-send-email-stefan.froberg@petroprogram.com>
 <87obey8eji.fsf@dell.be.48ers.dk>
Message-ID: <5135D093.5060001@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

5.3.2013 9:57, Peter Korsgaard kirjoitti:
>>>>>> "Stefan" == Stefan Fr?berg <stefan.froberg@petroprogram.com> writes:
>  Stefan> Libtasn1
>  Stefan> Libtasn1 is the ASN.1 library used by GnuTLS, GNU Shishi and some
>  Stefan> other packages. It was written by Fabio Fiorina, and has been
>  Stefan> shipped as part of GnuTLS for some time but is now a proper
>  Stefan> GNU package.
>
>  Stefan> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
>  Stefan> ---
>  Stefan> Changes v1 -> v2:
>  Stefan> 	- removed unneeded host-microperl dependency (Thomas Petazzoni)
>  Stefan> 	- removed unneeded LIBTASN1_SOURCE because default value for it is
>  Stefan> 	  packagename-version.tar.gz (Baruch Siach)
>
>  Stefan>  package/Config.in            |    1 +
>  Stefan>  package/libtasn1/Config.in   |    7 +++++++
>  Stefan>  package/libtasn1/libtasn1.mk |   14 ++++++++++++++
>  Stefan>  3 files changed, 22 insertions(+), 0 deletions(-)
>  Stefan>  create mode 100644 package/libtasn1/Config.in
>  Stefan>  create mode 100644 package/libtasn1/libtasn1.mk
>
>  Stefan> diff --git a/package/Config.in b/package/Config.in
>  Stefan> index 8588951..7b9b2c9 100644
>  Stefan> --- a/package/Config.in
>  Stefan> +++ b/package/Config.in
>  Stefan> @@ -554,6 +554,7 @@ source "package/libglib2/Config.in"
>  Stefan>  source "package/libical/Config.in"
>  Stefan>  source "package/libnspr/Config.in"
>  Stefan>  source "package/libsigc/Config.in"
>  Stefan> +source "package/libtasn1/Config.in"
>  Stefan>  source "package/libtpl/Config.in"
>  Stefan>  source "package/libseccomp/Config.in"
>  Stefan>  source "package/liburcu/Config.in"
>  Stefan> diff --git a/package/libtasn1/Config.in b/package/libtasn1/Config.in
>  Stefan> new file mode 100644
>  Stefan> index 0000000..2812157
>  Stefan> --- /dev/null
>  Stefan> +++ b/package/libtasn1/Config.in
>  Stefan> @@ -0,0 +1,7 @@
>  Stefan> +config BR2_PACKAGE_LIBTASN1
>  Stefan> +	bool "libtasn1"
>  Stefan> +	help
>  Stefan> +	  ASN.1 library
>  Stefan> +
>  Stefan> +	  http://www.gnu.org/software/libtasn1
>  Stefan> +
>
> Extra line here.
>
>  Stefan> diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
>  Stefan> new file mode 100644
>  Stefan> index 0000000..2326d76
>  Stefan> --- /dev/null
>  Stefan> +++ b/package/libtasn1/libtasn1.mk
>  Stefan> @@ -0,0 +1,14 @@
>  Stefan> +#############################################################
>  Stefan> +#
>  Stefan> +# libtasn1
>  Stefan> +#
>  Stefan> +#############################################################
>  Stefan> +
>  Stefan> +LIBTASN1_VERSION = 3.2
>  Stefan> +LIBTASN1_SITE = http://ftp.gnu.org/gnu/libtasn1
>  Stefan> +LIBTASN1_DEPENDENCIES = host-bison
>  Stefan> +LIBTASN1_LICENSE = GPLv3 LGPLv2.1
>
> Both licenses are 'any layter version', so they should have a '+'.
>
> Committed with these fixes, thanks.
>

Thanks Peter!

Best Regards
Stefan
