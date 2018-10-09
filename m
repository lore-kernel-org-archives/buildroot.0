From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 09 Oct 2018 15:07:15 +0300
Subject: [Buildroot] [PATCH] glibc: bump version for more post-2.28 fixes
In-Reply-To: <20181009114552.27794-1-yegorslists@googlemail.com>
References: <20181009114552.27794-1-yegorslists@googlemail.com>
Message-ID: <8736tfmih8.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,

yegorslists at googlemail.com writes:
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> This version bump fixes following issue:
>
> sysdeps/ieee754/soft-fp: ignore maybe-uninitialized with -O [BZ
> #19444]

Are you sure? Upstream commit 4a06ceea33ec is not included in the
release/2.28/master branch as of 5473739a7b44, which is the version you
bump to.

> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

[snip]

> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 708c22f723..526bca8146 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -10,7 +10,7 @@ GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VE
>  else
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
> -GLIBC_VERSION = glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab
> +GLIBC_VERSION = 5a580643111ef6081be7b4c7bd1997a5447c903f

The hash prefix is useful, please keep it. Should be 'glibc-2.28-21-g'
for this commit. This is taken from the output of 'git describe'.

>  # Upstream doesn't officially provide an https download link.
>  # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
>  # sometimes the connection times out. So use an unofficial github mirror.

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
