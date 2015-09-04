From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 4 Sep 2015 10:03:04 +0100
Subject: [Buildroot] [PATCH] libcurl: bump to version 7.44.0
In-Reply-To: <1441221373-7712-1-git-send-email-gustavo@zacarias.com.ar>
References: <1441221373-7712-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <55E95E48.6070202@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 09/02/2015 08:16 PM, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libcurl/libcurl.hash | 2 +-
>  package/libcurl/libcurl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
> index ee68922..db012a4 100644
> --- a/package/libcurl/libcurl.hash
> +++ b/package/libcurl/libcurl.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated after checking pgp signature
> -sha256  baa654a1122530483ccc1c58cc112fec3724a82c11c6a389f1e6a37dc8858df9  curl-7.43.0.tar.bz2
> +sha256  1e2541bae6582bb697c0fbae49e1d3e6fad5d05d5aa80dbd6f072e0a44341814  curl-7.44.0.tar.bz2
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 29a888c..6a5348b 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCURL_VERSION = 7.43.0
> +LIBCURL_VERSION = 7.44.0
>  LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
>  LIBCURL_SITE = http://curl.haxx.se/download
>  LIBCURL_DEPENDENCIES = host-pkgconf \
> 

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Compile test for MIPS architecture:

$ grep ^LIBCURL_VERSION package/libcurl/libcurl.mk
LIBCURL_VERSION = 7.44.0

$ file output/target/usr/lib/libcurl.so.4.4.0
output/target/usr/lib/libcurl.so.4.4.0: ELF 32-bit MSB shared object,
MIPS, MIPS32 rel2 version 1 (SYSV), dynamically linked, with unknown
capability 0x41000000 = 0xf676e75, with unknown capability 0x10000 =
0x70401, stripped

Regards,

Vincent.
