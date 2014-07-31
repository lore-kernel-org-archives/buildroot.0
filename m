From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 19:54:08 +0200
Subject: [Buildroot] [PATCH 3/3] aufs: added 'fs' dir to $(LINUX_DIR)
In-Reply-To: <1406827250-11821-1-git-send-email-s.hoenig@openthinclient.com>
References: <1406827250-11821-1-git-send-email-s.hoenig@openthinclient.com>
Message-ID: <20140731195408.29cdee0b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steffen Hoenig,

On Thu, 31 Jul 2014 19:20:50 +0200, Steffen Hoenig wrote:
> For later calls of linux-menuconfig, you need the Kconfig of aufs
> 
> Signed-off-by: Steffen Hoenig <s.hoenig@openthinclient.com>
> ---
>  package/aufs/aufs.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/aufs/aufs.mk b/package/aufs/aufs.mk
> index c1b21c4..5d072bb 100644
> --- a/package/aufs/aufs.mk
> +++ b/package/aufs/aufs.mk
> @@ -27,6 +27,7 @@ define AUFS_INSTALL_STAGING_CMDS
>  	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KDIR=$(LINUX_DIR) usr/include/linux/aufs_type.h
>  	$(INSTALL) -p -m 0644 $(@D)/usr/include/linux/aufs_type.h \
>  		$(STAGING_DIR)/usr/include/linux
> +	tar cf - -C $(@D) fs | (cd $(LINUX_DIR) && tar xf -)
>  endef
>  
>  define AUFS_INSTALL_TARGET_CMDS

Your original patches have not been applied (yet). So if you have
changes to do, please resend a new version of your original patches
with whatever fixes are needed. When you do so, please include a
changelog that describes the changes between the previous version.

See
http://buildroot.org/downloads/manual/manual.html#submitting-patches
for more details.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
