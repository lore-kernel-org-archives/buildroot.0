From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 May 2020 21:52:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/cage: bump to latest upstream
 version
In-Reply-To: <20200503144356.275259-1-gilles.talis@gmail.com>
References: <20200503144356.275259-1-gilles.talis@gmail.com>
Message-ID: <20200503195210.GD12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gilles, All,

On 2020-05-03 16:43 +0200, Gilles Talis spake thusly:
> cage v0.1.1 can't build with wlroots 0.10.1, as it uses
> a set of wlroots API that are no longer available.
> 
> Moving to latest upstream version fixes the issue.
> 
> Also:
> - added license file information
> - updated license file hash
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/cage/cage.hash | 6 +++---
>  package/cage/cage.mk   | 5 +++--
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/cage/cage.hash b/package/cage/cage.hash
> index 49b84f98af..3177474960 100644
> --- a/package/cage/cage.hash
> +++ b/package/cage/cage.hash
> @@ -1,5 +1,5 @@
> -# Generated locally, after checking https://github.com/Hjdskes/cage/releases/download/v0.1.1/cage-0.1.1.tar.gz.sig
> -sha256 63efbe96cf307381f2bedf9b80153343e255970a70d612515da7dc325dd49478  cage-0.1.1.tar.gz
> +# Generated locally
> +sha256 2f9bc2bd3c61cddb0d3b406754c4906eabf5a5d1aade26eb361dffccff2601e3  cage-6eb693c05b5b34d4ed5ad8234a9f79a14ac8e07d.tar.gz
>  
>  # Hashes for license files:
> -sha256 1fd28695090b961ed2846627365489228d84f784bff60a90e933febcedaeb65d  LICENSE
> +sha256 e117104073335dbaf78596fb1bedf89dda63c71f60f0b665947b2d369c77ecee  LICENSE
> diff --git a/package/cage/cage.mk b/package/cage/cage.mk
> index 6a9c067735..3d259912cc 100644
> --- a/package/cage/cage.mk
> +++ b/package/cage/cage.mk
> @@ -4,9 +4,10 @@
>  #
>  ################################################################################
>  
> -CAGE_VERSION = 0.1.1
> -CAGE_SITE = $(call github,Hjdskes,cage,v$(CAGE_VERSION))
> +CAGE_VERSION = 6eb693c05b5b34d4ed5ad8234a9f79a14ac8e07d
> +CAGE_SITE = $(call github,Hjdskes,cage,$(CAGE_VERSION))
>  CAGE_LICENSE = MIT
> +CAGE_LICENSE_FILES = LICENSE
>  CAGE_DEPENDENCIES = host-pkgconf wlroots
>  
>  ifeq ($(BR2_PACKAGE_XORG7),y)
> -- 
> 2.25.1
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
