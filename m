From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 15:56:50 +0100
Subject: [Buildroot] [PATCH] package/uacme: mention openssl crypto
 backend in description
In-Reply-To: <aef48f32740b8b832ec46d1a5616d000744637c6.1584887973.git.baruch@tkos.co.il>
References: <aef48f32740b8b832ec46d1a5616d000744637c6.1584887973.git.baruch@tkos.co.il>
Message-ID: <20200322155650.5e0c556c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 22 Mar 2020 16:39:33 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> uacme supports OpenSSL as crypto backend since version 1.0.8.
> 
> Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/uacme/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/uacme/Config.in b/package/uacme/Config.in
> index ac59764e1ace..128131bbafce 100644
> --- a/package/uacme/Config.in
> +++ b/package/uacme/Config.in
> @@ -6,9 +6,9 @@ config BR2_PACKAGE_UACME
>  	help
>  	  uacme is a client for the ACMEv2 protocol described in
>  	  RFC8555, written in plain C code with minimal dependencies
> -	  (libcurl and GnuTLS or mbedTLS). The ACMEv2 protocol allows
> -	  a Certificate Authority (https://letsencrypt.org is a
> -	  popular one) and an applicant to automate the process of
> +	  (libcurl and either of GnuTLS, OpenSSL or mbedTLS). The ACMEv2
> +	  protocol allows a Certificate Authority (https://letsencrypt.org
> +	  is a popular one) and an applicant to automate the process of
>  	  verification and certificate issuance.

Some lines were too long in the help text after your changes, and
caused some check-package warnings. I fixed that and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
