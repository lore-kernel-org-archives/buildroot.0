From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Feb 2016 22:07:16 +0100
Subject: [Buildroot] [PATCH v2 2/2] util-linux: add findfs option
In-Reply-To: <1455295206-15684-2-git-send-email-james.knight@rockwellcollins.com>
References: <1455295206-15684-1-git-send-email-james.knight@rockwellcollins.com>
 <1455295206-15684-2-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20160214220716.568ff860@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

On Fri, 12 Feb 2016 11:40:06 -0500, James Knight wrote:

> diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
> index df89f99..bf6d5c0 100644
> --- a/package/util-linux/Config.in
> +++ b/package/util-linux/Config.in
> @@ -96,6 +96,11 @@ config BR2_PACKAGE_UTIL_LINUX_FSCK
>  	help
>  	  Check and repair a linux filesystem
>  
> +config BR2_PACKAGE_UTIL_LINUX_FINDFS
> +	bool "findfs"
> +	help
> +	  Find a filesystem by label or UUID
> +
>  config BR2_PACKAGE_UTIL_LINUX_HWCLOCK
>  	bool "hwclock"
>  	help
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index f6e5d62..a892b01 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -74,6 +74,7 @@ UTIL_LINUX_CONF_OPTS += \
>  	$(if $(BR2_PACKAGE_UTIL_LINUX_FALLOCATE),--enable-fallocate,--disable-fallocate) \
>  	$(if $(BR2_PACKAGE_UTIL_LINUX_FDFORMAT),--enable-fdformat,--disable-fdformat) \
>  	$(if $(BR2_PACKAGE_UTIL_LINUX_FSCK),--enable-fsck,--disable-fsck) \
> +	$(if $(BR2_PACKAGE_UTIL_LINUX_FINDFS),--enable-findfs,--disable-findfs) \
>  	$(if $(BR2_PACKAGE_UTIL_LINUX_HWCLOCK),--enable-hwclock,--disable-hwclock) \
>  	$(if $(BR2_PACKAGE_UTIL_LINUX_KILL),--enable-kill,--disable-kill) \
>  	$(if $(BR2_PACKAGE_UTIL_LINUX_LAST),--enable-last,--disable-last) \

Alphabetic ordering was not correct in both the Config.in and
util-linux.mk files. I've fixed that up and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
