From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 19 Apr 2020 00:02:40 +0300
Subject: [Buildroot] [PATCH] package/uacme: bump version to 1.2.2
In-Reply-To: <20200418205420.4ydbzo35ogl2gsuw@einstein.dilieto.eu>
References: <20200418205420.4ydbzo35ogl2gsuw@einstein.dilieto.eu>
Message-ID: <87lfmscxsf.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nicola,

On Sat, Apr 18 2020, Nicola Di Lieto wrote:
> This version includes a new binary named "ualpn", a proxying
> ACMEv2 tls-alpn-01 responder.
>
> Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
> ---
>  package/uacme/Config.in  | 24 ++++++++++++++++++------
>  package/uacme/uacme.hash |  2 +-
>  package/uacme/uacme.mk   |  8 +++++++-
>  3 files changed, 26 insertions(+), 8 deletions(-)
>
> diff --git a/package/uacme/Config.in b/package/uacme/Config.in
> index ea9babfda7..296dd8e5f2 100644
> --- a/package/uacme/Config.in
> +++ b/package/uacme/Config.in
> @@ -5,11 +5,23 @@ config BR2_PACKAGE_UACME
>  	select BR2_PACKAGE_LIBCURL
>  	help
>  	  uacme is a client for the ACMEv2 protocol described in
> -	  RFC8555, written in plain C code with minimal dependencies
> -	  (libcurl and either of GnuTLS, OpenSSL or mbedTLS). The
> -	  ACMEv2 protocol allows a Certificate Authority
> -	  (https://letsencrypt.org is a popular one) and an applicant
> -	  to automate the process of verification and certificate
> -	  issuance.
> +	  RFC8555, written in plain C with minimal dependencies
> +	  (libcurl and GnuTLS or mbedTLS). The ACMEv2 protocol allows
> +	  a Certificate Authority (https://letsencrypt.org is a
> +	  popular one) and an applicant to automate the process of
> +	  verification and certificate issuance.

This hunk reverts commit b7eacd41bba. Why?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
