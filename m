From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2020 13:46:51 +0100
Subject: [Buildroot] [git commit] package/mbedtls: security bump to
 version 2.16.4
In-Reply-To: <20200118123413.D20CF825FF@busybox.osuosl.org>
References: <20200118123413.D20CF825FF@busybox.osuosl.org>
Message-ID: <20200118124651.GZ22540@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-01-18 13:44 +0100, Yann E. MORIN spake thusly:
> commit: https://git.buildroot.net/buildroot/commit/?id=a7186d0913f4df2f86439abfdadbaec60f359818
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Fix CVE-2019-18222: Our bignum implementation is not constant
> time/constant trace, so side channel attacks can retrieve the blinded
> value, factor it (as it is smaller than RSA keys and not guaranteed to
> have only large prime factors), and then, by brute force, recover the
> key. Reported by Alejandro Cabrera Aldaya and Billy Brumley.

This one is a candidate as a security backport to the stable branches.

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/mbedtls/mbedtls.hash | 6 +++---
>  package/mbedtls/mbedtls.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
> index db136c17d9..db9d29d1d5 100644
> --- a/package/mbedtls/mbedtls.hash
> +++ b/package/mbedtls/mbedtls.hash
> @@ -1,5 +1,5 @@
> -# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.3-and-2.7.12-released
> -sha1	dce8550f8f9465f3aea44cb7d0f9d0ba8140034a	mbedtls-2.16.3-apache.tgz
> -sha256	ec1bee6d82090ed6ea2690784ea4b294ab576a65d428da9fe8750f932d2da661	mbedtls-2.16.3-apache.tgz
> +# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.4-and-2.7.13-released
> +sha1	e446cbac7d24fc3ff1b1c4ee7c021694ede86db6	mbedtls-2.16.4-apache.tgz
> +sha256	3441f32bda9c8ef58acc9e18028d09eb9c17d199eb27141bec074905152fb2fb	mbedtls-2.16.4-apache.tgz
>  # Locally calculated
>  sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30	apache-2.0.txt
> diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
> index f58aad4bca..c6a7adc72a 100644
> --- a/package/mbedtls/mbedtls.mk
> +++ b/package/mbedtls/mbedtls.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  MBEDTLS_SITE = https://tls.mbed.org/code/releases
> -MBEDTLS_VERSION = 2.16.3
> +MBEDTLS_VERSION = 2.16.4
>  MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION)-apache.tgz
>  MBEDTLS_CONF_OPTS = \
>  	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
