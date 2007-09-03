From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 03 Sep 2007 10:54:24 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/libdaemon
In-Reply-To: <20070903085610.67BDDA616F@busybox.net>
References: <20070903085610.67BDDA616F@busybox.net>
Message-ID: <1188809664.4069.62.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2007-09-03 klockan 01:56 -0700 skrev jacmet at uclibc.org:
> Author: jacmet
> Date: 2007-09-03 01:56:06 -0700 (Mon, 03 Sep 2007)
> New Revision: 19771
> 
> Log:
> Don't apply broken patch from r19595 with hardcoded path names.
> Ulf, what was this supposed to fix?
> 
> 
> Modified:
>    trunk/buildroot/package/libdaemon/libdaemon.mk
> 

OK I see the problem.

It does not build for ARM as is, 
so I ran autotools, after which it builds.
How run autotools to generate an address relative to the buildroot tree?

> 
> Changeset:
> Modified: trunk/buildroot/package/libdaemon/libdaemon.mk
> ===================================================================
> --- trunk/buildroot/package/libdaemon/libdaemon.mk	2007-09-03 06:26:06 UTC (rev 19770)
> +++ trunk/buildroot/package/libdaemon/libdaemon.mk	2007-09-03 08:56:06 UTC (rev 19771)
> @@ -26,11 +26,13 @@
>  $(LIBDAEMON_DIR)/.unpacked: $(DL_DIR)/$(LIBDAEMON_SOURCE)
>  	$(LIBDAEMON_CAT) $(DL_DIR)/$(LIBDAEMON_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
>  	toolchain/patch-kernel.sh $(LIBDAEMON_DIR) package/libdaemon/ \*.patch
> -	mkdir -p $(PROJECT_BUILD_DIR)/patches
> -	$(BZCAT) package/libdaemon/$(LIBDAEMON_NAME).patch.bz2 \
> -		> $(PROJECT_BUILD_DIR)/patches/$(LIBDAEMON_NAME).patch
> -	toolchain/patch-kernel.sh $(LIBDAEMON_DIR) $(PROJECT_BUILD_DIR)/patches/ $(LIBDAEMON_NAME)\*.patch
> -	$(CONFIG_UPDATE) $(LIBDAEMON_DIR)
> +# Ulf, what was this supposed to fix? Your patch is broken
> +# (hardcoded for /home/ulf/..)
> +#	mkdir -p $(PROJECT_BUILD_DIR)/patches
> +#	$(BZCAT) package/libdaemon/$(LIBDAEMON_NAME).patch.bz2 \
> +#		> $(PROJECT_BUILD_DIR)/patches/$(LIBDAEMON_NAME).patch
> +#	toolchain/patch-kernel.sh $(LIBDAEMON_DIR) $(PROJECT_BUILD_DIR)/patches/ $(LIBDAEMON_NAME)\*.patch
> +#	$(CONFIG_UPDATE) $(LIBDAEMON_DIR)
>  	touch $(LIBDAEMON_DIR)/.unpacked
>  
>  $(LIBDAEMON_DIR)/.configured: $(LIBDAEMON_DIR)/.unpacked
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
-- 
Best Regards,
Ulf Samuelsson
