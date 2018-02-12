From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 12 Feb 2018 11:55:01 +0000
Subject: [Buildroot] [PATCH] dropbear: use https URLs
In-Reply-To: <20180212092150.1ac237c5@x2000>
References: <20180212092150.1ac237c5@x2000>
Message-ID: <20180212115501.GB1936@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 12 Feb 2018 09:21:50 +0100, Danilo Bargen <mail@dbrgn.ch> wrote:
> While a hash check is being done, it's still better to use a download
> URL with HTTPS.
> 
> Signed-off-by: Danilo Bargen <mail@dbrgn.ch>
> ---
>  package/dropbear/Config.in   | 2 +-
>  package/dropbear/dropbear.mk | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
> index d92361fa39..6700778161 100644
> --- a/package/dropbear/Config.in
> +++ b/package/dropbear/Config.in
> @@ -13,7 +13,7 @@ config BR2_PACKAGE_DROPBEAR
>  	  Alternatively, mount a persistent unionfs over your root
>  	  filesystem.
>  
> -	  http://matt.ucc.asn.au/dropbear/dropbear.html
> +	  https://matt.ucc.asn.au/dropbear/dropbear.html
>  
>  if BR2_PACKAGE_DROPBEAR
>  
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index bf7f99d975..01a1a07b76 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  DROPBEAR_VERSION = 2017.75
> -DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
> +DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
>  DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
>  DROPBEAR_LICENSE = MIT, BSD-2-Clause-like, BSD-2-Clause
>  DROPBEAR_LICENSE_FILES = LICENSE
> -- 
> 2.16.1

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

--
 Adri?n ?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180212/4b708142/attachment.asc>
