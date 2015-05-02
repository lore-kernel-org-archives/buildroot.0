From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 02 May 2015 14:47:40 +0200
Subject: [Buildroot] [PATCH v2 3/5] busybox: add option to specify
 config fragments
In-Reply-To: <1430231675-8613-3-git-send-email-bos@je-eigen-domein.nl>
References: <1430231675-8613-1-git-send-email-bos@je-eigen-domein.nl>
 <1430231675-8613-3-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <5544C76C.9000300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/04/15 16:34, Floris Bos wrote:
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Not tested but obviously correct :-)

 Regards,
 Arnout

> ---
>  package/busybox/Config.in  | 6 ++++++
>  package/busybox/busybox.mk | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/package/busybox/Config.in b/package/busybox/Config.in
> index b4f949f..6847a60 100644
> --- a/package/busybox/Config.in
> +++ b/package/busybox/Config.in
> @@ -20,6 +20,12 @@ config BR2_PACKAGE_BUSYBOX_CONFIG
>  
>  	  Most people will just use the default BusyBox configuration file.
>  
> +config BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES
> +	string "Additional BusyBox configuration fragment files"
> +	help
> +	  A space-separated list of configuration fragment files,
> +	  that will be merged to the main BusyBox configuration file.
> +
>  config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	bool "Show packages that are also provided by busybox"
>  	help
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 1ce508a..090e174 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -46,6 +46,7 @@ ifndef BUSYBOX_CONFIG_FILE
>  endif
>  
>  BUSYBOX_KCONFIG_FILE = $(BUSYBOX_CONFIG_FILE)
> +BUSYBOX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES))
>  BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
>  BUSYBOX_KCONFIG_OPTS = $(BUSYBOX_MAKE_OPTS)
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
