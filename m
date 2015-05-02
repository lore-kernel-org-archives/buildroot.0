From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 02 May 2015 14:55:47 +0200
Subject: [Buildroot] [PATCH v2 5/5] barebox: add option to specify
 config fragments
In-Reply-To: <1430231675-8613-5-git-send-email-bos@je-eigen-domein.nl>
References: <1430231675-8613-1-git-send-email-bos@je-eigen-domein.nl>
 <1430231675-8613-5-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <5544C953.9030106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/04/15 16:34, Floris Bos wrote:
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  boot/barebox/Config.in  | 6 ++++++
>  boot/barebox/barebox.mk | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
> index 48431bd..dbe79e9 100644
> --- a/boot/barebox/Config.in
> +++ b/boot/barebox/Config.in
> @@ -91,6 +91,12 @@ config BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE
>  	help
>  	  Path to the barebox configuration file
>  
> +config BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES
> +	string "Additional configuration fragment files"
> +	help
> +	  A space-separated list of configuration fragment files,
> +	  that will be merged to the main Barebox configuration file.
> +
>  config BR2_TARGET_BAREBOX_BAREBOXENV
>  	bool "bareboxenv tool in target"
>  	help
> diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
> index 54f52bb..5095ffa 100644
> --- a/boot/barebox/barebox.mk
> +++ b/boot/barebox/barebox.mk
> @@ -60,6 +60,7 @@ BAREBOX_SOURCE_CONFIG = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE))
>  endif
>  
>  BAREBOX_KCONFIG_FILE = $(BAREBOX_SOURCE_CONFIG)
> +BAREBOX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES))
>  BAREBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
>  BAREBOX_KCONFIG_OPTS = $(BAREBOX_MAKE_FLAGS)
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
