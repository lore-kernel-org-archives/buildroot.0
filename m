From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 14 Jul 2015 07:28:54 +0300
Subject: [Buildroot] [PATCH v5 5/5] package/speex: remove no longer
 needed hook
In-Reply-To: <1436824511-1601-5-git-send-email-s.martin49@gmail.com>
References: <1436824511-1601-1-git-send-email-s.martin49@gmail.com>
 <1436824511-1601-5-git-send-email-s.martin49@gmail.com>
Message-ID: <20150714042853.GW2451@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Mon, Jul 13, 2015 at 11:55:11PM +0200, Samuel Martin wrote:
> Remove the LIBTOOL_FIXUP hook since RPATH are now sanitized in
> target-finalize hooks.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
> changes v4->v5:
> - new patch (suggested by Baruch)
> ---
>  package/speex/speex.mk | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/package/speex/speex.mk b/package/speex/speex.mk
> index a34bfac..24782ec 100644
> --- a/package/speex/speex.mk
> +++ b/package/speex/speex.mk
> @@ -24,11 +24,6 @@ ifeq ($(BR2_PACKAGE_SPEEX_ARM5E),y)
>  SPEEX_CONF_OPTS += --enable-arm5e-asm
>  endif
>  
> -define SPEEX_LIBTOOL_FIXUP
> -	$(SED) 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' $(@D)/libtool
> -	$(SED) 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' $(@D)/libtool
> -endef
> -
>  SPEEX_POST_CONFIGURE_HOOKS += SPEEX_LIBTOOL_FIXUP

You can remove this line as well.

baruch

>  define SPEEX_BUILD_CMDS

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
