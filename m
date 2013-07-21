From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 22 Jul 2013 00:10:32 +0200
Subject: [Buildroot] [PATCH 2 of 3] u-boot: add support for custom
	Mercurial repository
In-Reply-To: <21dda5e59e1c88ea78ef.1374233233@BEANTN0L019720> (Thomas De
 Schampheleire's message of "Fri, 19 Jul 2013 13:27:13 +0200")
References: <patchbomb.1374233231@BEANTN0L019720>
 <21dda5e59e1c88ea78ef.1374233233@BEANTN0L019720>
Message-ID: <87txjnr2cn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 Thomas> ---
 Thomas>  boot/uboot/Config.in |  15 +++++++++------
 Thomas>  boot/uboot/uboot.mk  |   5 ++++-
 Thomas>  2 files changed, 13 insertions(+), 7 deletions(-)

 Thomas> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
 Thomas> --- a/boot/uboot/Config.in
 Thomas> +++ b/boot/uboot/Config.in
 Thomas> @@ -31,6 +31,9 @@ config BR2_TARGET_UBOOT_CUSTOM_TARBALL
 Thomas>  config BR2_TARGET_UBOOT_CUSTOM_GIT
 Thomas>  	bool "Custom Git repository"
 
 Thomas> +config BR2_TARGET_UBOOT_CUSTOM_HG
 Thomas> +	bool "Custom Mercurial repository"
 Thomas> +
 Thomas>  endchoice
 
 Thomas>  config BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE
 Thomas> @@ -49,7 +52,7 @@ config BR2_TARGET_UBOOT_VERSION
 Thomas>  	default "2013.04"	if BR2_TARGET_UBOOT_LATEST_VERSION
 Thomas>  	default $BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE if BR2_TARGET_UBOOT_CUSTOM_VERSION
 Thomas>  	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
 Thomas> -	default $BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION if BR2_TARGET_UBOOT_CUSTOM_GIT
 Thomas> +	default $BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
 
 Thomas>  config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 Thomas>  	string "custom patch dir"
 Thomas> @@ -60,13 +63,13 @@ config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 
 Thomas>  	  Most users may leave this empty
 
 Thomas> -if BR2_TARGET_UBOOT_CUSTOM_GIT
 Thomas> +if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
 
 Thomas> -config BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL
 Thomas> -	string "URL of custom Git repository"
 Thomas> +config BR2_TARGET_UBOOT_CUSTOM_REPO_URL
 Thomas> +	string "URL of custom repository"
 
 Thomas> -config BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION
 Thomas> -	string "Custom Git version"
 Thomas> +config BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION
 Thomas> +	string "Custom repository version"

Same comment about Config.in.legacy.

-- 
Bye, Peter Korsgaard
