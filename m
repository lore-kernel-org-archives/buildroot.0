From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 08 Jun 2021 12:21:56 +0300
Subject: [Buildroot] [PATCH 1/1] package/rpcbind fix version number
In-Reply-To: <20210608085332.19296-1-br015@umbiko.net>
References: <20210608085332.19296-1-br015@umbiko.net>
Message-ID: <87pmww4sp7.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andreas,

On Tue, Jun 08 2021, Andreas Ziegler wrote:
> Commit d13b292cec8166c4712cf4a0defbeee827ffaf78 introduced a patch for
> rpcbind but also changed the version number to a non-existing value.
>
> Change rpcbind to last released version and adapt hash value. 
>
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>
> ---
>  package/rpcbind/rpcbind.hash | 2 +-
>  package/rpcbind/rpcbind.mk   | 2 +-

The comment in 0001-Remove-yellow-pages-support.patch also mentions this
non existing version number.

baruch

>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/rpcbind/rpcbind.hash b/package/rpcbind/rpcbind.hash
> index 1960b86c13..6ab7d89265 100644
> --- a/package/rpcbind/rpcbind.hash
> +++ b/package/rpcbind/rpcbind.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256 2ce360683963b35c19c43f0ee2c7f18aa5b81ef41c3fdbd15ffcb00b8bffda7a  rpcbind-1.2.5.tar.bz2
> +sha256 5613746489cae5ae23a443bb85c05a11741a5f12c8f55d2bb5e83b9defeee8de  rpcbind-1.2.6.tar.bz2
>  sha256 2b9477d2f4ab277b29702958f0058546edc120aae4b5fb8b8d1a9652104e1ba3  COPYING
> diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
> index fea2103794..d9f25e698e 100644
> --- a/package/rpcbind/rpcbind.mk
> +++ b/package/rpcbind/rpcbind.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RPCBIND_VERSION = 1.3.2
> +RPCBIND_VERSION = 1.2.6
>  RPCBIND_SITE = http://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIND_VERSION)
>  RPCBIND_SOURCE = rpcbind-$(RPCBIND_VERSION).tar.bz2
>  RPCBIND_LICENSE = BSD-3-Clause


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
