From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 12 Jan 2012 23:12:13 +0100
Subject: [Buildroot] [PATCH 5/7] util-linux: add host variant for
	host-lttng-babeltrace
In-Reply-To: <11bbfa19e9391b673b8ce8d76156a8b8871eb970.1324547779.git.thomas.petazzoni@free-electrons.com>
References: <cover.1324547779.git.thomas.petazzoni@free-electrons.com>
 <11bbfa19e9391b673b8ce8d76156a8b8871eb970.1324547779.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201201122312.13965.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 22 December 2011 10:57:21 Thomas Petazzoni wrote:
> lttng-babeltrace needs libuuid, which is provided by util-linux, and
> since we want to build lttng-babeltrace for the host, we need to build
> libuuid for the host. It's a shame that libuuid is part of such a big
> package as util-linux.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/util-linux/util-linux.mk |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
> 
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index a3d6e13..6bffc2c 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -67,7 +67,16 @@ UTIL_LINUX_CONF_OPT += \
>  	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-login-utils) \
>  	$(if $(BR2_PACKAGE_UTIL_LINUX_WRITE),--enable-write)
>  
> +HOST_UTIL_LINUX_CONF_OPT += \
> +	--enable-libuuid \
> +	--disable-mount --disable-fsck --disable-libmount \
> +	--disable-uuidd --disable-libblkid --disable-agetty \
> +	--disable-cramfs --disable-switch_root --disable-pivot_root \
> +	--disable-fallocate --disable-unshare --disable-rename \
> +	--disable-schedutils --disable-wall --disable-partx
> +

 I would put (part of) the comment of the commit message right here in the
mk file.  Else, two years down the road someone will look at this and wonder
what the hell is going on...

 Regards,
 Arnout


>  $(eval $(call AUTOTARGETS))
> +$(eval $(call AUTOTARGETS,host))
>  
>  # MKINSTALLDIRS comes from tweaked m4/nls.m4, but autoreconf uses staging
>  # one, so it disappears
> 

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
