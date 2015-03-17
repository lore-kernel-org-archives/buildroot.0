From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 17 Mar 2015 11:17:59 +0200
Subject: [Buildroot] [PATCH 1/2] package/cmake: disable on unsupported
 architectures
In-Reply-To: <1426583299-21207-1-git-send-email-s.martin49@gmail.com>
References: <1426583299-21207-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20150317091759.GK2415@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Tue, Mar 17, 2015 at 10:08:18AM +0100, Samuel Martin wrote:
> Supported architectures are listed at [1].
> 
> Fixes:
>   http://autobuild.buildroot.net/results/de9/de9021fdc63600536ffa91e4b8718584e3e5702c/
>   http://autobuild.buildroot.net/results/0f1/0f1afc62e91ab798fa65685af3dea3caac663f11/
> 
> [1] https://github.com/Kitware/CMake/blob/master/Utilities/KWIML/ABI.h.in#L339
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/cmake/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/cmake/Config.in b/package/cmake/Config.in
> index 0b5bba9..eee2461 100644
> --- a/package/cmake/Config.in
> +++ b/package/cmake/Config.in
> @@ -10,6 +10,12 @@ config BR2_PACKAGE_CMAKE_CTEST
>  	select BR2_PACKAGE_EXPAT
>  	select BR2_PACKAGE_BZIP2
>  	select BR2_PACKAGE_XZ
> +	depends on !BR2_arcle && !BR2_arceb
> +	depends on !BR2_bfin
> +	depends on !BR2_microblazeel && !BR2_microblazebe
> +	depends on !BR2_nios2
> +	depends on !BR2_sh && !BR2_sh64
> +	depends on !BR2_xtensa

Please update the dependencies comment below.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
