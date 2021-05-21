From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 May 2021 22:34:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/runc: security bump to version
 1.0.0-rc95
In-Reply-To: <20210521201517.214072-1-christian@paral.in>
References: <20210521201517.214072-1-christian@paral.in>
Message-ID: <20210521203402.GR3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2021-05-21 13:15 -0700, Christian Stewart spake thusly:
> Fixes CVE-2021-30465: runc 1.0.0-rc94 and earlier are vulnerable to a symlink
> exchange attack whereby an attacker can request a seemingly-innocuous container
> configuration that actually results in the host filesystem being bind-mounted
> into the container, allowing for a container escape.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/runc/runc.hash | 2 +-
>  package/runc/runc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/runc/runc.hash b/package/runc/runc.hash
> index d792947d5f..598bd3067f 100644
> --- a/package/runc/runc.hash
> +++ b/package/runc/runc.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256	28378df983a3c586ed3ec8c76a774a9b10f36a0c323590a284b801cce95cc61f  runc-1.0.0-rc92.tar.gz
> +sha256  02dac7f1a0dcfe55dd9820df787adedf030060870354915e7bba86f8487ce93c  runc-1.0.0-rc95.tar.gz
>  sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
> diff --git a/package/runc/runc.mk b/package/runc/runc.mk
> index 14689bbde1..62b9f09bf2 100644
> --- a/package/runc/runc.mk
> +++ b/package/runc/runc.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  RUNC_VERSION_MAJOR = 1.0.0
> -RUNC_VERSION_MINOR = rc92
> +RUNC_VERSION_MINOR = rc95
>  RUNC_VERSION = $(RUNC_VERSION_MAJOR)-$(RUNC_VERSION_MINOR)
>  RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
>  RUNC_LICENSE = Apache-2.0
> -- 
> 2.31.1
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
