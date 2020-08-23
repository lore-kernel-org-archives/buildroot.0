From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Aug 2020 15:32:00 +0200
Subject: [Buildroot] [PATCH] package/bind: security bump to version
 9.11.22
In-Reply-To: <20200821212612.9029-1-peter@korsgaard.com>
References: <20200821212612.9029-1-peter@korsgaard.com>
Message-ID: <20200823133200.GH8728@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-08-21 23:26 +0200, Peter Korsgaard spake thusly:
> Fixes the following security issues:
> 
> CVE-2020-8622: A truncated TSIG response can lead to an assertion failure
> https://kb.isc.org/docs/cve-2020-8622
> 
> CVE-2020-8623: A flaw in native PKCS#11 code can lead to a remotely
> triggerable assertion failure in pk11.c
> https://kb.isc.org/docs/cve-2020-8623
> 
> CVE-2020-8624: update-policy rules of type "subdomain" are enforced incorrectly
> https://kb.isc.org/docs/cve-2020-8624
> 
> For more details, see the release notes:
> https://downloads.isc.org/isc/bind9/9.11.22/RELEASE-NOTES-bind-9.11.22.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Security fix => applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/bind/bind.hash | 4 ++--
>  package/bind/bind.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bind/bind.hash b/package/bind/bind.hash
> index 282b2aeba3..4ba0182b1c 100644
> --- a/package/bind/bind.hash
> +++ b/package/bind/bind.hash
> @@ -1,4 +1,4 @@
> -# Verified from https://ftp.isc.org/isc/bind9/9.11.20/bind-9.11.20.tar.gz.asc
> +# Verified from https://ftp.isc.org/isc/bind9/9.11.22/bind-9.11.22.tar.gz.asc
>  # with key AE3FAC796711EC59FC007AA474BB6B9A4CBB3D38
> -sha256  306831a738a275693bbe1d6839a09b34a2c8b5c26f8a42ea57ef000a6a99c2b6  bind-9.11.20.tar.gz
> +sha256  afc6d8015006f1cabf699ff19f517bb8fd9c1811e5231f26baf51c3550262ac9  bind-9.11.22.tar.gz
>  sha256  da2aec2b7f6f0feb16bcb080e2c587375fd3195145f047e4d92d112f5b9db501  COPYRIGHT
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index 80f8defca8..18fc4845f9 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BIND_VERSION = 9.11.20
> +BIND_VERSION = 9.11.22
>  BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
>  # bind does not support parallel builds.
>  BIND_MAKE = $(MAKE1)
> -- 
> 2.20.1
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
