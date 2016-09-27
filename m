From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 27 Sep 2016 06:39:41 +0300
Subject: [Buildroot] [PATCH] openssl: security bump to version 1.0.2j
In-Reply-To: <1474933495-2967-1-git-send-email-gustavo@zacarias.com.ar>
References: <1474933495-2967-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160927033941.rowe2sz5dtrd5jtz@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Mon, Sep 26, 2016 at 08:44:55PM -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2016-6309 - Fix Use After Free for large message sizes

According to https://www.openssl.org/news/secadv/20160926.txt, CVE-2016-6309 
only affects 1.1.0a.

baruch

> CVE-2016-7052 - Missing CRL sanity check
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/openssl/openssl.hash | 4 ++--
>  package/openssl/openssl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/openssl/openssl.hash b/package/openssl/openssl.hash
> index 50a0cc7..0dc5450 100644
> --- a/package/openssl/openssl.hash
> +++ b/package/openssl/openssl.hash
> @@ -1,5 +1,5 @@
> -# From https://www.openssl.org/source/openssl-1.0.2i.tar.gz.sha256
> -sha256	9287487d11c9545b6efb287cdb70535d4e9b284dd10d51441d9b9963d000de6f	openssl-1.0.2i.tar.gz
> +# From https://www.openssl.org/source/openssl-1.0.2j.tar.gz.sha256
> +sha256	e7aff292be21c259c6af26469c7a9b3ba26e9abaaffd325e3dccc9785256c431	openssl-1.0.2j.tar.gz
>  # Locally computed
>  sha256	eddd8a5123748052c598214487ac178e4bfa4e31ba2ec520c70d59c8c5bfa2e9	openssl-1.0.2a-parallel-install-dirs.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
>  sha256	147c3eeaad614c044749ea527cb433eae5e2d5cad34a78c6ba61cd967bfbe01f	openssl-1.0.2a-parallel-obj-headers.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
> diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
> index 055ed79..6dc4b85 100644
> --- a/package/openssl/openssl.mk
> +++ b/package/openssl/openssl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OPENSSL_VERSION = 1.0.2i
> +OPENSSL_VERSION = 1.0.2j
>  OPENSSL_SITE = http://www.openssl.org/source
>  OPENSSL_LICENSE = OpenSSL or SSLeay
>  OPENSSL_LICENSE_FILES = LICENSE

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
