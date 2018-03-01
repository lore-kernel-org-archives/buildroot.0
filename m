From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 2 Mar 2018 00:55:41 +0200
Subject: [Buildroot] [PATCH 1/1] efivar: update to version 34 to pick up
 gcc7 compile fixes
In-Reply-To: <20180301190042.92091-1-charles.hardin@storagecraft.com>
References: <20180301190042.92091-1-charles.hardin@storagecraft.com>
Message-ID: <20180301225541.jlrgmtkvth6otxdc@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Charles,

On Thu, Mar 01, 2018 at 11:00:42AM -0800, charles.hardin at storagecraft.com wrote:
> From: Charles Hardin <charles.hardin@storagecraft.com>
> 
> Instead of patching the prior version of efivar, just update to
> a current version 34 to fix some gcc7 compile errors like the
> following:
> 
> dp-media.c: In function '_format_media_dn':
> dp.h:121:12: error: argument 1 value '18446744073709551610'
>              exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]
>    uint16_t _ucs2buf[(len)];    \
> 
> Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>
> ---
>  ...fs-to-avoid-the-multiple-definitions-bug-.patch | 29 -------------
>  package/efivar/0002-Allow-build-with-uClibc.patch  |  2 +-

Please renumber this patch to 0001.

>  ...some-extra-const-that-gcc-complains-about.patch | 47 ----------------------
>  package/efivar/efivar.hash                         |  2 +-
>  package/efivar/efivar.mk                           |  4 +-
>  5 files changed, 4 insertions(+), 80 deletions(-)
>  delete mode 100644 package/efivar/0001-Use-z-muldefs-to-avoid-the-multiple-definitions-bug-.patch
>  delete mode 100644 package/efivar/0003-Remove-some-extra-const-that-gcc-complains-about.patch

For removed patches please mention why they are not needed anymore. In this 
case I guess that's because they are all upstream.

[snip]

> diff --git a/package/efivar/efivar.mk b/package/efivar/efivar.mk
> index d06192ed22..f7974c9d1d 100644
> --- a/package/efivar/efivar.mk
> +++ b/package/efivar/efivar.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -EFIVAR_VERSION = 30
> -EFIVAR_SITE = $(call github,rhinstaller,efivar,$(EFIVAR_VERSION))
> +EFIVAR_VERSION = 34
> +EFIVAR_SITE = $(call github,rhboot,efivar,$(EFIVAR_VERSION))

Why are you changing _SITE? Has upstream changed? Please explain in the commit 
log.

>  EFIVAR_LICENSE = LGPL-2.1
>  EFIVAR_LICENSE_FILES = COPYING
>  EFIVAR_DEPENDENCIES = popt

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
