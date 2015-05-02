From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 02 May 2015 14:55:21 +0200
Subject: [Buildroot] [PATCH v2 4/5] uclibc: add option to specify config
 fragments
In-Reply-To: <1430231675-8613-4-git-send-email-bos@je-eigen-domein.nl>
References: <1430231675-8613-1-git-send-email-bos@je-eigen-domein.nl>
 <1430231675-8613-4-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <5544C939.2010601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/04/15 16:34, Floris Bos wrote:
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/uclibc/Config.in | 6 ++++++
>  package/uclibc/uclibc.mk | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index b5525e5..dd23853 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -86,6 +86,12 @@ config BR2_UCLIBC_CONFIG
>  	  See also docs/README in this package.
>  	  If unsure, use the default.
>  
> +config BR2_UCLIBC_CONFIG_FRAGMENT_FILES
> +	string "Additional uClibc configuration fragment files"
> +	help
> +	  A space-separated list of configuration fragment files,
> +	  that will be merged to the main uClibc configuration file.
> +
>  config BR2_TOOLCHAIN_BUILDROOT_INET_RPC
>  	bool "Enable RPC support"
>  	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index ce9b2b4..b9dce7e 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -42,6 +42,7 @@ UCLIBC_CONFIG_FILE = $(call qstrip,$(BR2_UCLIBC_CONFIG))
>  endif
>  
>  UCLIBC_KCONFIG_FILE = $(UCLIBC_CONFIG_FILE)
> +UCLIBC_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_UCLIBC_CONFIG_FRAGMENT_FILES))
>  
>  UCLIBC_KCONFIG_OPTS = \
>  	$(UCLIBC_MAKE_FLAGS) \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
