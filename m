From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 24 Apr 2017 09:11:28 +0300
Subject: [Buildroot] [PATCH 1/1] Bump version and use github helper
In-Reply-To: <20170424044421.2872-1-skenton@ou.edu>
References: <20170424044421.2872-1-skenton@ou.edu>
Message-ID: <20170424061128.mkks7c3z3gtwisfw@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steve,

On Mon, Apr 24, 2017 at 04:44:20AM +0000, Steve Kenton wrote:
> Signed-off-by: Steve Kenton <skenton@ou.edu>
> ---
>  package/tovid/tovid.mk | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tovid/tovid.mk b/package/tovid/tovid.mk
> index 079fada..0aa8c6c 100644
> --- a/package/tovid/tovid.mk
> +++ b/package/tovid/tovid.mk
> @@ -3,9 +3,8 @@
>  # tovid
>  #
>  ################################################################################
> -
> -TOVID_VERSION = 0.35.0
> -TOVID_SITE = https://github.com/tovid-suite/tovid/releases/download/v$(TOVID_VERSION)
> +TOVID_VERSION = 0.35.2
> +TOVID_SITE = $(call github,<tovid-suite>,<tovid>,$(TOVID_VERSION))

We prefer upstream provided tarballs when available.

You need to update the tovid.hash file as well.

Thanks,
baruch

>  TOVID_LICENSE = GPL-2.0+
>  TOVID_LICENSE_FILES = COPYING
>  TOVID_SETUP_TYPE = distutils

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
