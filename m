From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Sep 2013 18:59:52 +0200
Subject: [Buildroot] [PATCH v2 2/7] sunxi-cedarx: bump to newer version,
 use armel2 binaries, add demo
In-Reply-To: <1378441521-10050-3-git-send-email-spenser@gillilanding.com>
References: <1378441521-10050-1-git-send-email-spenser@gillilanding.com>
 <1378441521-10050-3-git-send-email-spenser@gillilanding.com>
Message-ID: <20130908185952.03236a0d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

It'd be great if your patches were split in a slightly more
fine-grained fashion. I.e this patch should have been three patches,
for the three different things you mention in the patch title.

On Thu,  5 Sep 2013 23:25:16 -0500, Spenser Gilliland wrote:
>  SUNXI_CEDARX_INSTALL_STAGING = YES
> @@ -14,7 +14,12 @@ SUNXI_CEDARX_CONFIGURE_OPTS = \
>  
>  ifeq ($(BR2_ARM_EABIHF),y)
>  SUNXI_CEDARX_BIN_DIR = $(@D)/libcedarv/linux-armhf
> -# libavheap.so is only available on EABIHF
> +SUNXI_CEDARX_SAMPLE_LOC = $(SUNXI_CEDARX_BIN_DIR)/sample/ve
> +else
> +SUNXI_CEDARX_BIN_DIR = $(@D)/libcedarv/linux-armel2
> +SUNXI_CEDARX_SAMPLE_LOC = $(SUNXI_CEDARX_BIN_DIR)/sample/output/ve
> +endif

I was confused by this for a while, but now I understand: since you've
bumped the version, the libavheap.so library is now available for
non-EABIhf toolchains.

BTW, silly from the cedarx people that the sample binary is not in the
same location between EABIhf and EABI.

Also, what is the difference between the linux-armel2 and linux-armel
directories in the CedarX stuff?

So, essentially, patch looks good to me.

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
