From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 10 Feb 2017 15:12:32 +0100
Subject: [Buildroot] [PATCH 2/4] ed: use generic extract command
In-Reply-To: <d61a070418fd158bef1420dbd16e48f0cbd8ddee.1486705936.git.baruch@tkos.co.il>
References: <fc3fe88b52644ba99855a47be4950f2b9d8b7dd9.1486705936.git.baruch@tkos.co.il>
 <d61a070418fd158bef1420dbd16e48f0cbd8ddee.1486705936.git.baruch@tkos.co.il>
Message-ID: <20170210151232.22f5ce03@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Feb 2017 07:52:14 +0200, Baruch Siach <baruch@tkos.co.il> wrote:

> The generic code now knows how to extract .tar.lz archives. Remove the local
> extract code.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/ed/ed.mk | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/package/ed/ed.mk b/package/ed/ed.mk
> index 50adeb4ec5b4..6b9f65ec5280 100644
> --- a/package/ed/ed.mk
> +++ b/package/ed/ed.mk
> @@ -10,15 +10,9 @@ ED_SOURCE = ed-$(ED_VERSION).tar.lz
>  ED_CONF_OPTS = \
>  	CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
>  	LDFLAGS="$(TARGET_LDFLAGS)"
> -ED_DEPENDENCIES = host-lzip
>  ED_LICENSE = GPLv3+
>  ED_LICENSE_FILES = COPYING
>  
> -define ED_EXTRACT_CMDS
> -	$(HOST_DIR)/usr/bin/lzip -d -c $(DL_DIR)/$(ED_SOURCE) | \
> -		tar --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
> -endef
> -
>  define ED_CONFIGURE_CMDS
>  	(cd $(@D); \
>  		$(TARGET_MAKE_ENV) ./configure \

Reviewed-by: Peter Seiderer <ps.report@gmx.net>
