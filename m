From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Jun 2020 23:06:09 +0200
Subject: [Buildroot] [PATCH 2/2] package/nodejs: security bump to 12.18.0
In-Reply-To: <20200603193151.502850-2-martin@barkynet.com>
References: <20200603193151.502850-1-martin@barkynet.com>
 <20200603193151.502850-2-martin@barkynet.com>
Message-ID: <20200603210609.GE13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2020-06-03 20:31 +0100, Martin Bark spake thusly:
> This is a security release.

I was surprisded to see that a bump 1.16.3 -> 1.18.0 was "just" about
security, but that's because the 12.x branch is LTS, right?

> Vulnerabilities fixed:
> 
> CVE-2020-8172: TLS session reuse can lead to host certificate verification bypass (High).
> CVE-2020-11080: HTTP/2 Large Settings Frame DoS (Low).
> CVE-2020-8174: napi_get_value_string_*() allows various kinds of memory corruption (High).
> 
> See https://nodejs.org/en/blog/release/v12.18.0/
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nodejs/nodejs.hash | 6 +++---
>  package/nodejs/nodejs.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
> index 411b4d52b9..60d69a8638 100644
> --- a/package/nodejs/nodejs.hash
> +++ b/package/nodejs/nodejs.hash
> @@ -1,5 +1,5 @@
> -# From https://nodejs.org/dist/v12.16.3/SHASUMS256.txt
> -sha256  f0559b0829c7f2ac10bf5b3e157e498227e95e26cdb6af814969c49f367359a3  node-v12.16.3.tar.xz
> +# From https://nodejs.org/dist/v12.18.0/SHASUMS256.txt
> +sha256  d4688636a378367f5157f02bd5c13902f5c193356f8f7a35c99dfa383b03b13f  node-v12.18.0.tar.xz
>  
>  # Hash for license file
> -sha256  3f5749f7a58edaadd77843057a90063a18067f472d8b26c0a76905cafa1063e3  LICENSE
> +sha256  cd2e5817a25d7d28efba927b01056cae04a616b673014159f9eafeb008a0e747  LICENSE
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index c46dc0e224..37d7877226 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NODEJS_VERSION = 12.16.3
> +NODEJS_VERSION = 12.18.0
>  NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
>  NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
>  NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
> -- 
> 2.26.2
> 
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
