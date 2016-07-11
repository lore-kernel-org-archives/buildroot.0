From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 11 Jul 2016 06:26:15 +0300
Subject: [Buildroot] [PATCH] core: do not remove dl/ directory on
 distclean
In-Reply-To: <1468187749-3955-1-git-send-email-yann.morin.1998@free.fr>
References: <1468187749-3955-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160711032615.GJ3870@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Jul 10, 2016 at 11:55:49PM +0200, Yann E. MORIN wrote:
> Currently, if the dl/ directory is the default location, it is removed
> on distclean.
> 
> However, the dl/ directory is a precious location: it contains all the
> tarballs downloaded so far, and some can be relatively huge, taking some
> previous time to re-download, especially on slowish links.
> 
> Don't remove it on distclean. If the user really needs to regain some
> space, leave it to him to clean this directory up manually.

Current Makefile help text for 'distclean' says:

  delete all non-source files (including .config)

Not deleting the dl/ directory is not consistent with this description, IMO.

baruch

> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  Makefile | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 027f21c..5d840f6 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -901,9 +901,6 @@ clean:
>  		$(LEGAL_INFO_DIR) $(GRAPHS_DIR)
>  
>  distclean: clean
> -ifeq ($(DL_DIR),$(TOPDIR)/dl)
> -	rm -rf $(DL_DIR)
> -endif
>  ifeq ($(O),output)
>  	rm -rf $(O)
>  endif

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
