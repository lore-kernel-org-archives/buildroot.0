From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 19 Feb 2020 10:11:51 +0100
Subject: [Buildroot] [PATCH] package/libxml2: properly set
 LIBXML2_IGNORE_CVES
In-Reply-To: <20200218233647.128671-1-thomas.petazzoni@bootlin.com>
References: <20200218233647.128671-1-thomas.petazzoni@bootlin.com>
Message-ID: <CAAXf6LX65aoXZG+4+M71g-XZqha53aFrg6KFcOta=pBy2DkUJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El mi?., 19 feb. 2020 a las 0:37, Thomas Petazzoni
(<thomas.petazzoni@bootlin.com>) escribi?:
>
> The libxml2 package has two patches that fix the two CVEs affecting
> libxml2 in version 2.9.10, so let's use LIBXML2_IGNORE_CVES to ensure
> these CVEs are no longer reported by pkg-stats.
>
> Cc: Titouan Christophe <titouan.christophe@railnova.eu>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/libxml2/libxml2.mk | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
> index f6cf084b2b..ea6a8c1f6d 100644
> --- a/package/libxml2/libxml2.mk
> +++ b/package/libxml2/libxml2.mk
> @@ -9,6 +9,10 @@ LIBXML2_SITE = http://xmlsoft.org/sources
>  LIBXML2_INSTALL_STAGING = YES
>  LIBXML2_LICENSE = MIT
>  LIBXML2_LICENSE_FILES = COPYING
> +# 0001-Fix-infinite-loop-in-xmlStringLenDecodeEntities.patch
> +LIBXML2_IGNORE_CVES += CVE-2020-7595
> +# 0002-Fix-memory-leak-in-xmlSchemaValidateStream.patch
> +LIBXML2_IGNORE_CVES += CVE-2019-20388
>  LIBXML2_CONFIG_SCRIPTS = xml2-config
>
>  # relocation truncated to fit: R_68K_GOT16O
> --

Thanks, I was just going to make this change after Peter's mail :-)

What is the update frequency of http://autobuild.buildroot.org/stats/ ?

/Thomas
