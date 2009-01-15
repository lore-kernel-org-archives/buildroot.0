From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 15 Jan 2009 22:52:37 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/liberation
In-Reply-To: <20090113103749.5AC7B76850@busybox.osuosl.org>
References: <20090113103749.5AC7B76850@busybox.osuosl.org>
Message-ID: <1232056357.4757.52.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2009-01-13 klockan 10:37 +0000 skrev laird at uclibc.org:
> Author: laird
> Date: 2009-01-13 10:37:48 +0000 (Tue, 13 Jan 2009)
> New Revision: 24813
> 
> Log:
> package/liberation/liberation.mk: A further tidy up.....
> 
> Use touch -c $@
> Do not install fonts into staging dir.
> 
> Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>
> 
> 
> 
> Modified:
>    trunk/buildroot/package/liberation/liberation.mk
> 
> 
> Changeset:
> Modified: trunk/buildroot/package/liberation/liberation.mk
> ===================================================================
> --- trunk/buildroot/package/liberation/liberation.mk	2009-01-13 10:26:28 UTC (rev 24812)
> +++ trunk/buildroot/package/liberation/liberation.mk	2009-01-13 10:37:48 UTC (rev 24813)
> @@ -16,23 +16,17 @@
>  
>  $(LIBERATION_DIR)/.unpacked: $(DL_DIR)/$(LIBERATION_SOURCE)
>  	$(LIBERATION_CAT) $(DL_DIR)/$(LIBERATION_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
> -	touch $(LIBERATION_DIR)/.unpacked
> +	touch -c $@
>  
> -$(STAGING_DIR)/usr/share/fonts/LiberationMono-Bold.ttf: $(LIBERATION_DIR)/.unpacked
> -	-mkdir -p $(STAGING_DIR)/usr/share/fonts/liberation
> -	$(INSTALL) -m0644 $(LIBERATION_DIR)/*.ttf $(STAGING_DIR)/usr/share/fonts/liberation/
> -	touch -c $(STAGING_DIR)/usr/share/fonts/.ttf
> -
> -$(TARGET_DIR)/usr/share/fonts/LiberationMono-Bold.ttf: $(STAGING_DIR)/usr/share/fonts/LiberationMono-Bold.ttf
> +$(TARGET_DIR)/usr/share/fonts/LiberationMono-Bold.ttf: $(LIBERATION_DIR)/.unpacked
>  	-mkdir -p $(TARGET_DIR)/usr/share/fonts/liberation
>  	$(INSTALL) -m0644 $(LIBERATION_DIR)/*.ttf $(TARGET_DIR)/usr/share/fonts/liberation/
> -	touch -c $(TARGET_DIR)/usr/share/fonts/.ttf
> +	touch -c $@

You *still* put stamp files in the target root file system.

BR
Ulf Samuelsson
