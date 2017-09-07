From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 7 Sep 2017 11:18:51 +0300
Subject: [Buildroot] [PATCH] mbedtls: security bump to version 2.6.0
In-Reply-To: <20170907081201.8397-1-peter@korsgaard.com>
References: <20170907081201.8397-1-peter@korsgaard.com>
Message-ID: <20170907081851.5x6mxczcydx7ut4t@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, Sep 07, 2017 at 10:12:01AM +0200, Peter Korsgaard wrote:
> Fixes CVE-2017-14032: Bypass of authentication of peer possible when the
> authentication mode is configured as 'optional'
> 
> For more details, see
> https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2017-02

Posted already: http://patchwork.ozlabs.org/patch/810255/.

baruch

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/mbedtls/mbedtls.hash | 4 ++--
>  package/mbedtls/mbedtls.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
> index 70a0dc506d..0dea548431 100644
> --- a/package/mbedtls/mbedtls.hash
> +++ b/package/mbedtls/mbedtls.hash
> @@ -1,2 +1,2 @@
> -# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.4.2-2.1.7-and-1.3.19-released
> -sha256	17dd98af7478aadacc480c7e4159e447353b5b2037c1b6d48ed4fd157fb1b018	mbedtls-2.4.2-apache.tgz
> +# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.6.0-2.1.9-and-1.3.21-released
> +sha256	99bc9d4212d3d885eeb96273bcde8ecc649a481404b8d7ea7bb26397c9909687	mbedtls-2.6.0-apache.tgz
> diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
> index a571ed0e52..64ce18cf6f 100644
> --- a/package/mbedtls/mbedtls.mk
> +++ b/package/mbedtls/mbedtls.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  MBEDTLS_SITE = https://tls.mbed.org/code/releases
> -MBEDTLS_VERSION = 2.4.2
> +MBEDTLS_VERSION = 2.6.0
>  MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION)-apache.tgz
>  MBEDTLS_CONF_OPTS = \
>  	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
