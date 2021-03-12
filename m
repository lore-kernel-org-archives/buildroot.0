From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Mar 2021 23:16:07 +0100
Subject: [Buildroot] [PATCH v1] package/dosfstools: bump version to 4.2
In-Reply-To: <20210312215635.27893-1-ps.report@gmx.net>
References: <20210312215635.27893-1-ps.report@gmx.net>
Message-ID: <20210312221607.GG2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-03-12 22:56 +0100, Peter Seiderer spake thusly:
> For details see [1].
> 
> [1] https://github.com/dosfstools/dosfstools/releases/tag/v4.2
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/dosfstools/dosfstools.hash | 7 ++++---
>  package/dosfstools/dosfstools.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/dosfstools/dosfstools.hash b/package/dosfstools/dosfstools.hash
> index d5f396f69f..840bb4d563 100644
> --- a/package/dosfstools/dosfstools.hash
> +++ b/package/dosfstools/dosfstools.hash
> @@ -1,5 +1,6 @@
> -# Locally calculated after checking pgp signature
> -sha256 e6b2aca70ccc3fe3687365009dd94a2e18e82b688ed4e260e04b7412471cc173  dosfstools-4.1.tar.xz
> +# Locally calculated after checking pgp signature from
> +# https://github.com/dosfstools/dosfstools/releases/download/v4.2/dosfstools-4.2.tar.gz.sig
> +sha256  64926eebf90092dca21b14259a5301b7b98e7b1943e8a201c7d726084809b527  dosfstools-4.2.tar.gz
>  
>  # Locally calculated
> -sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
> index b5da490dbd..f1dc63991f 100644
> --- a/package/dosfstools/dosfstools.mk
> +++ b/package/dosfstools/dosfstools.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -DOSFSTOOLS_VERSION = 4.1
> -DOSFSTOOLS_SOURCE = dosfstools-$(DOSFSTOOLS_VERSION).tar.xz
> +DOSFSTOOLS_VERSION = 4.2
> +#DOSFSTOOLS_SOURCE = dosfstools-$(DOSFSTOOLS_VERSION).tar.xz

We do not keep commented-out code, so I've dropped it. I've also
slightly expanded the commit log to explain that upstream dos not
provide an xz-compressed tarball this time.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  DOSFSTOOLS_SITE = https://github.com/dosfstools/dosfstools/releases/download/v$(DOSFSTOOLS_VERSION)
>  DOSFSTOOLS_LICENSE = GPL-3.0+
>  DOSFSTOOLS_LICENSE_FILES = COPYING
> -- 
> 2.30.1
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
