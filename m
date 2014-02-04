From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 04 Feb 2014 11:16:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/util-linux: add a host variant
In-Reply-To: <1391361752-2112-1-git-send-email-danomimanchego123@gmail.com>
References: <1391361752-2112-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <52F0BE08.6040508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/02/14 18:22, Danomi Manchego wrote:
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> 
> ---
> 
> This was useful to us, to get reproducable versions of host
> utils for post-build scripts - so maybe it will be useful
> to others as well.
> ---
>  package/Config.in.host            |    1 +
>  package/util-linux/Config.in.host |    8 ++++++++
>  2 files changed, 9 insertions(+)
>  create mode 100644 package/util-linux/Config.in.host
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 34e84bf..41c0071 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -14,5 +14,6 @@ source "package/parted/Config.in.host"
>  source "package/sam-ba/Config.in.host"
>  source "package/sunxi-tools/Config.in.host"
>  source "package/uboot-tools/Config.in.host"
> +source "package/util-linux/Config.in.host"
>  
>  endmenu
> diff --git a/package/util-linux/Config.in.host b/package/util-linux/Config.in.host
> new file mode 100644
> index 0000000..f73dc43
> --- /dev/null
> +++ b/package/util-linux/Config.in.host
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_HOST_UTIL_LINUX
> +	bool "host util-linux"
> +	help
> +	  Various useful/essential linux libraries and utilities.
> +
> +	  Things like mkfs, mkswap, swapon, fdisk, mount, dmesg, etc...
> +
> +	  http://www.kernel.org/pub/linux/utils/util-linux/
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
