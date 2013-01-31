From: Stephan Hoffmann <sho@relinux.de>
Date: Thu, 31 Jan 2013 17:41:14 +0100
Subject: [Buildroot] [PATCH] Clean kernel when "make linux-clean" is
	called
In-Reply-To: <1354886413-28939-1-git-send-email-sho@relinux.de>
References: <20120827210633.608e9bfe@skate>
 <1354886413-28939-1-git-send-email-sho@relinux.de>
Message-ID: <510A9EAA.5050907@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ping
Am 07.12.2012 14:20, schrieb Stephan Hoffmann:
> When "make linux-clean" is typed one expects that the kernel tree
> gets cleaned. Before this patch, only the stamp files had been
> removed.
>
> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
> ---
>  linux/linux.mk |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/linux/linux.mk b/linux/linux.mk
> index c4bdf90..e517d1d 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -221,6 +221,9 @@ define LINUX_BUILD_CMDS
>  	$(LINUX_APPEND_DTB)
>  endef
>  
> +define LINUX_CLEAN_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) clean
> +endef
>  
>  ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),y)
>  define LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
