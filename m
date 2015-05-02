From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 02 May 2015 12:39:13 +0200
Subject: [Buildroot] [PATCH v2 2/5] linux: add option to specify config
 fragments
In-Reply-To: <1430231675-8613-2-git-send-email-bos@je-eigen-domein.nl>
References: <1430231675-8613-1-git-send-email-bos@je-eigen-domein.nl>
 <1430231675-8613-2-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <5544A951.6090108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/04/15 16:34, Floris Bos wrote:
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  linux/Config.in | 6 ++++++
>  linux/linux.mk  | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 0ab9f26..ac483c1 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -164,6 +164,12 @@ config BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
>  	  Note: this can be a defconfig file or a complete .config file,
>  	  which can later be saved back with make linux-update-(def)config.
>  
> +config BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES
> +	string "Additional configuration fragment files"
> +	help
> +	  A space-separated list of kernel configuration fragment files,
> +	  that will be merged to the main kernel configuration file.

 Oh, of course we'll still need this additional config option, because the main
defconfig could be in-tree while the fragments are external. Silly me.

 I'll come back to the first patch.

 This one already gets my

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> +
>  #
>  # Binary format
>  #
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 0c348da..694061e 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -175,6 +175,7 @@ KERNEL_SOURCE_CONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
>  endif
>  
>  LINUX_KCONFIG_FILE = $(KERNEL_SOURCE_CONFIG)
> +LINUX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES))
>  LINUX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
>  LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS)
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
