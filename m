From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 31 Jul 2017 08:22:30 +0300
Subject: [Buildroot] [PATCH] package/stella: bump version to 5.0.1
In-Reply-To: <1501452974-7781-1-git-send-email-sergio.prado@e-labworks.com>
References: <1501452974-7781-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20170731052230.fqat554x3zxjbq6l@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sergio,

On Sun, Jul 30, 2017 at 07:16:14PM -0300, Sergio Prado wrote:
> Switched _SITE to github helper function.
> 
> Removed 0003-Use-gnu-11-standard-to-prevent-errors-on-PPC.patch, since
> stella now uses -std=c++14 that builds fine when using PPC altivec
> vectorization.
> 
> Fixes:
> http://autobuild.buildroot.net/results/0e787fd27537e1ff84a76bf71121048596d808a1/
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---

[...]

> diff --git a/package/stella/stella.mk b/package/stella/stella.mk
> index e610a9bdfd6f..5c13251bf5a0 100644
> --- a/package/stella/stella.mk
> +++ b/package/stella/stella.mk
> @@ -4,9 +4,8 @@
>  #
>  ################################################################################
>  
> -STELLA_VERSION = 4.7.3
> -STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
> -STELLA_SITE = https://github.com/stella-emu/stella/releases/download/release-$(STELLA_VERSION)
> +STELLA_VERSION = 5.0.1
> +STELLA_SITE = $(call github,stella-emu,stella,$(STELLA_VERSION))

Upstream tarball releases are generally preferred over git checkouts. The 
5.0.1 tarball seems to be available at the same location.

https://github.com/stella-emu/stella/releases/download/5.0.1/stella-5.0.1-src.tar.xz

Also, Changes.txt says:

 * Codebase now uses C++14 features.

So the toolchain dependencies (gcc 4.9) should be update accordingly.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
