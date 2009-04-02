From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 2 Apr 2009 11:38:22 +1100
Subject: [Buildroot] [PATCH 5/5] target/ubifs: Switched to
	mkfs.ubifs	included in mtd-utils
In-Reply-To: <1238098807-5648-6-git-send-email-mroth@nessie.de>
References: <1238098807-5648-1-git-send-email-mroth@nessie.de>
	<1238098807-5648-6-git-send-email-mroth@nessie.de>
Message-ID: <20090402003822.GB29488@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 26, 2009 at 09:20:07PM +0100, Michael Roth wrote:
> The mkfs.ubifs is included in the upcomming mtd-utils. So
> the ubifs root filesytem target uses the mtd-utils package
> analog to the jffs2 root filesystem target.

Thanks, I just did something similar in my own tree.

> diff --git a/target/ubifs/Config.in b/target/ubifs/Config.in
> index 85229f6..7544b50 100644
> --- a/target/ubifs/Config.in
> +++ b/target/ubifs/Config.in
> @@ -1,9 +1,13 @@
>  config BR2_TARGET_ROOTFS_UBIFS
>  	bool "ubifs root filesystem"
>  	select BR2_HOST_FAKEROOT
> +	depends on BR2_PACKAGE_MTD_UTILS_GIT

This is needed due to the ugly multiple MTD versions stuff, but it 
has the unfortunate side-effect of adding target binaries too - 
all the default MTD utilities.

One solution would be to duplicate the mtd-utils.git stuff within a
separate host-only mkfs.ubifs target. Either inside target/ubifsroot, or
in toolchain or whatever. That could be switched over to mtd-utils 1.x.0
when it's released.



Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
