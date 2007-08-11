From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sun, 12 Aug 2007 01:46:08 +0300
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl
In-Reply-To: <20070811214751.1B202A606F@busybox.net>
References: <20070811214751.1B202A606F@busybox.net>
Message-ID: <46BE3C30.1090803@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ulf at uclibc.org ?????:
> Author: ulf
> Date: 2007-08-11 14:47:51 -0700 (Sat, 11 Aug 2007)
> New Revision: 19439
> 
> Log:
> Run $\(CONFIG_UPDATE\) in the unpack rules for sdl, Use $\(MAKE1\)
> 
> Modified:
>    trunk/buildroot/package/sdl/sdl.mk
> 
> 
> Changeset:
> Modified: trunk/buildroot/package/sdl/sdl.mk
> ===================================================================
> --- trunk/buildroot/package/sdl/sdl.mk	2007-08-11 21:47:28 UTC (rev 19438)
> +++ trunk/buildroot/package/sdl/sdl.mk	2007-08-11 21:47:51 UTC (rev 19439)
> @@ -17,6 +17,7 @@
>  $(SDL_DIR)/.unpacked: $(DL_DIR)/$(SDL_SOURCE)
>  	$(SDL_CAT) $(DL_DIR)/$(SDL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
>  	toolchain/patch-kernel.sh $(SDL_DIR) package/sdl sdl\*.patch
> +	$(CONFIG_UPDATE) $(SDL_DIR)/build-scripts
>  	touch $@
>  
>  $(SDL_DIR)/.configured: $(SDL_DIR)/.unpacked
> @@ -46,7 +47,7 @@
>  	touch $@
>  
>  $(SDL_DIR)/.compiled: $(SDL_DIR)/.configured
> -	$(MAKE) -C $(SDL_DIR) 
> +	$(MAKE1) -C $(SDL_DIR) 
>  	touch $@
>  
>  $(STAGING_DIR)/usr/lib/libSDL.so: $(SDL_DIR)/.compiled
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

Ulf,

please correct

toolchain/patch-kernel.sh $(SDL_DIR) package/sdl sdl\*.patch

to

toolchain/patch-kernel.sh $(SDL_DIR) package/sdl SDL\*.patch

or rename

SDL-1.2.11-patch_PAGE_SIZE.patch to lowercase sdl-1.2.11-patch_PAGE_SIZE.patch

BR,
Ivan
