From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 18 Aug 2016 09:41:36 +0300
Subject: [Buildroot] [PATCH] squeezelite: needs NPTL
In-Reply-To: <20160818062704.GA28543@waldemar-brodkorb.de>
References: <20160818062704.GA28543@waldemar-brodkorb.de>
Message-ID: <20160818064136.lam5pibsjvz4kqc7@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

On Thu, Aug 18, 2016 at 08:27:04AM +0200, Waldemar Brodkorb wrote:
> It uses PTHREAD_PRIO_INHERIT, which isn't available in Linuxthreads.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/455/455465c332d291929c1612d18a9e7448d9c76e73/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/squeezelite/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/squeezelite/Config.in b/package/squeezelite/Config.in
> index 79d2947..154daaa 100644
> --- a/package/squeezelite/Config.in
> +++ b/package/squeezelite/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_SQUEEZELITE
>  	bool "squeezelite"
>  	depends on BR2_USE_WCHAR # flac
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # alsa-lib

The 'alsa-lib' comment should be dropped, then. NPTL (or threading for that 
matter) is a dependency of squeezelite itself.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
