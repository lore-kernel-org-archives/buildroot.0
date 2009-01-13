From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 13 Jan 2009 11:28:21 +1100
Subject: [Buildroot] svn commit: trunk/buildroot/package/liberation
In-Reply-To: <20090112124048.BBE95766E4@busybox.osuosl.org>
References: <20090112124048.BBE95766E4@busybox.osuosl.org>
Message-ID: <20090113002821.GB32708@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 12, 2009 at 12:40:48PM +0000, laird at uclibc.org wrote:
> -$(STAGING_DIR)/usr/share/fonts/.ttf: $(LIBERATION_DIR)/.unpacked
> +$(STAGING_DIR)/usr/share/fonts/LiberationMono-Bold.ttf: $(LIBERATION_DIR)/.unpacked
>  	-mkdir -p $(STAGING_DIR)/usr/share/fonts/liberation
>  	$(INSTALL) -m0644 $(LIBERATION_DIR)/*.ttf $(STAGING_DIR)/usr/share/fonts/liberation/
>  	touch -c $(STAGING_DIR)/usr/share/fonts/.ttf
>  
> -$(TARGET_DIR)/usr/share/fonts/LiberationMono-Bold.ttf: $(STAGING_DIR)/usr/share/fonts/.ttf
> +$(TARGET_DIR)/usr/share/fonts/LiberationMono-Bold.ttf: $(STAGING_DIR)/usr/share/fonts/LiberationMono-Bold.ttf
>  	-mkdir -p $(TARGET_DIR)/usr/share/fonts/liberation
>  	$(INSTALL) -m0644 $(LIBERATION_DIR)/*.ttf $(TARGET_DIR)/usr/share/fonts/liberation/
>  	touch -c $(TARGET_DIR)/usr/share/fonts/.ttf

What's the purpose of the .ttf file touched in the staging and target
dirs?

Why is the font installed into the staging dir at all?

thanks
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
