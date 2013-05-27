From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 May 2013 00:09:34 +0200
Subject: [Buildroot] [PATCH 11/20] sunxi-tools: new host/target package
In-Reply-To: <1369606110-8088-12-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 27 May 2013 00:08:21 +0200")
References: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369606110-8088-12-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zjvgaxcx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> From: Carlo Caione <carlo.caione@gmail.com>
 Thomas> Signed-off-by: Carlo Caione <carlo.caione@gmail.com>
 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/Config.in                  |    1 +
 Thomas>  package/Config.in.host             |    1 +
 Thomas>  package/sunxi-tools/Config.in      |   10 ++++++++++
 Thomas>  package/sunxi-tools/Config.in.host |   12 ++++++++++++
 Thomas>  package/sunxi-tools/sunxi-tools.mk |   37 ++++++++++++++++++++++++++++++++++++
 Thomas>  5 files changed, 61 insertions(+)
 Thomas>  create mode 100644 package/sunxi-tools/Config.in
 Thomas>  create mode 100644 package/sunxi-tools/Config.in.host
 Thomas>  create mode 100644 package/sunxi-tools/sunxi-tools.mk

 Thomas> diff --git a/package/Config.in b/package/Config.in
 Thomas> index 6094c1b..1bd9309 100644
 Thomas> --- a/package/Config.in
 Thomas> +++ b/package/Config.in
 Thomas> @@ -207,6 +207,7 @@ source "package/ntfs-3g/Config.in"
 Thomas>  source "package/squashfs/Config.in"
 Thomas>  source "package/squashfs3/Config.in"
 Thomas>  source "package/sshfs/Config.in"
 Thomas> +source "package/sunxi-tools/Config.in"
 Thomas>  source "package/unionfs/Config.in"
 Thomas>  source "package/xfsprogs/Config.in"
 Thomas>  endmenu
 Thomas> diff --git a/package/Config.in.host b/package/Config.in.host
 Thomas> index 7c0dd20..54178ea 100644
 Thomas> --- a/package/Config.in.host
 Thomas> +++ b/package/Config.in.host
 Thomas> @@ -10,6 +10,7 @@ source "package/mtools/Config.in.host"
 Thomas>  source "package/omap-u-boot-utils/Config.in.host"
 Thomas>  source "package/openocd/Config.in.host"
 Thomas>  source "package/sam-ba/Config.in.host"
 Thomas> +source "package/sunxi-tools/Config.in.host"
 Thomas>  source "package/uboot-tools/Config.in.host"
 
 Thomas>  endmenu
 Thomas> diff --git a/package/sunxi-tools/Config.in b/package/sunxi-tools/Config.in
 Thomas> new file mode 100644
 Thomas> index 0000000..a085aeb
 Thomas> --- /dev/null
 Thomas> +++ b/package/sunxi-tools/Config.in
 Thomas> @@ -0,0 +1,10 @@
 Thomas> +config BR2_PACKAGE_SUNXI_TOOLS
 Thomas> +	bool "sunxi nand-part"
 Thomas> +	depends on BR2_arm
 Thomas> +	help
 Thomas> +	  nand-part is part of sunxi-tools for Allwinner A10 (aka sun4i) and
 Thomas> +	  A13 (aka sun5i) based devices. It is a tool to repartition the
 Thomas> +	  internal NAND on sunxi devices.
 Thomas> +
 Thomas> +	  http://linux-sunxi.org/Sunxi-tools
 Thomas> +

Extra newline.

 Thomas> diff --git a/package/sunxi-tools/Config.in.host b/package/sunxi-tools/Config.in.host
 Thomas> new file mode 100644
 Thomas> index 0000000..b5e4193
 Thomas> --- /dev/null
 Thomas> +++ b/package/sunxi-tools/Config.in.host
 Thomas> @@ -0,0 +1,12 @@
 Thomas> +config BR2_PACKAGE_HOST_SUNXI_TOOLS
 Thomas> +	bool "host sunxi-tools"
 Thomas> +	depends on BR2_arm
 Thomas> +	help
 Thomas> +	  Tools for Allwinner A10 (aka sun4i) and A13 (aka sun5i) based devices.
 Thomas> +	  This includes fex2bin  which can be used to compile .fex board definition
 Thomas> +	  files to the binary script.bin format required by the linux-sunxi kernel.
 Thomas> +	  These tools are specific for linux-sunxi kernel and do not apply to
 Thomas> +	  the mainline Linux kernel version.
 Thomas> +
 Thomas> +	  http://linux-sunxi.org/Sunxi-tools
 Thomas> +

Too long lines and extra newline.

Committed to next with those issues fixed, thanks.

-- 
Bye, Peter Korsgaard
