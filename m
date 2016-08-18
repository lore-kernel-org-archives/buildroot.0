From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 18 Aug 2016 09:49:56 +0300
Subject: [Buildroot] [PATCH] linux-pam: uses fork() needs MMU
In-Reply-To: <20160818062345.GA28431@waldemar-brodkorb.de>
References: <20160818062345.GA28431@waldemar-brodkorb.de>
Message-ID: <20160818064956.jf7gt374yeehslfi@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

On Thu, Aug 18, 2016 at 08:23:45AM +0200, Waldemar Brodkorb wrote:
> Fixes:
>   http://autobuild.buildroot.net/results/8c9/8c9a5fe52f762b4ff4444cf41efdf0d3cf203986/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

[...]

> diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
> index 429dfa7..657bcdd 100644
> --- a/package/util-linux/Config.in
> +++ b/package/util-linux/Config.in
> @@ -63,6 +63,7 @@ config BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH
>  	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
>  	depends on !BR2_STATIC_LIBS
>  	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
> +	depends on BR2_USE_MMU # linux-pam
>  	select BR2_PACKAGE_LINUX_PAM
>  	help
>  	  Change login shell, real user name and information

Lots of packages select BR2_PACKAGE_UTIL_LINUX. All of them (and all packages 
that select them) now need to depend on BR2_USE_MMU.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
