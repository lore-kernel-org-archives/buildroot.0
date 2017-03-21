From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Mar 2017 23:00:11 +0100
Subject: [Buildroot] [PATCH] ghostscript: drop the ijs subfolder to fix
 build
In-Reply-To: <1490132895-7625-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490132895-7625-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170321220010.GF3735@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-03-21 22:48 +0100, Thomas Petazzoni spake thusly:
> The ijs/ subfolder contains a bogus ltmain.sh file, which is actually a
> broken symbolic link. Due to this, our logic to patch ltmain.sh files
> fail with some patch versions:
> 
>   >>> ghostscript 9.21 Patching libtool
>   File /home/buildroot/build/instance-0/output/build/ghostscript-9.21/ijs/ltmain.sh is not a regular file -- refusing to patch
> 
> Since we are anyway not using the ijs support (--without-ijs is passed),
> do like we do for all other sub-components of ghostscript: get rid of
> the ijs/ subfolder completely.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/ca683d69b7fb564788c8877c3bb6466390e976a8/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/ghostscript/ghostscript.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
> index d563e77..e568b20 100644
> --- a/package/ghostscript/ghostscript.mk
> +++ b/package/ghostscript/ghostscript.mk
> @@ -26,7 +26,7 @@ GHOSTSCRIPT_DEPENDENCIES = \
>  # Inspired by linuxfromscratch:
>  # http://www.linuxfromscratch.org/blfs/view/svn/pst/gs.html
>  define GHOSTSCRIPT_REMOVE_LIBS
> -	rm -rf $(@D)/freetype $(@D)/jpeg $(@D)/lcms2 $(@D)/libpng $(@D)/tiff $(@D)/zlib
> +	rm -rf $(@D)/freetype $(@D)/ijs $(@D)/jpeg $(@D)/lcms2 $(@D)/libpng $(@D)/tiff $(@D)/zlib
>  endef
>  GHOSTSCRIPT_POST_PATCH_HOOKS += GHOSTSCRIPT_REMOVE_LIBS
>  
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
