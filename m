From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 23 Nov 2015 07:41:01 +0200
Subject: [Buildroot] [PATCH 1/1] autofs: new package
In-Reply-To: <1448200100-29006-1-git-send-email-yba@tkos.co.il>
References: <1448200100-29006-1-git-send-email-yba@tkos.co.il>
Message-ID: <20151123054101.GH2177@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yonatan,

On Sun, Nov 22, 2015 at 03:48:20PM +0200, Jonathan Ben-Avraham wrote:
> +config BR2_PACKAGE_AUTOFS
> +	bool "autofs"
> +	select BR2_PACKAGE_NFS_UTILS # runtime
> +	select BR2_PACKAGE_RPCBIND # runtime
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # rpcbind
> +	depends on BR2_USE_MMU # nfs-utils, rpcbind
> +	help
> +	  Based on the Debian autofs package description:
> +	  Autofs controls the operation of the automount daemons. The automount
> +	  daemons automatically mount filesystems when they are used and unmount
> +	  them after a period of inactivity based on a set of pre-configured
> +	  maps defined by default in /etc/auto.master. The kernel automounter
> +	  implements SunOS style automounter under Linux and requires a kernel
> +	  version of at least 2.6.17 and the autofs4 kernel module.
> +
> +	  git://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git

The browser friendly link 
https://git.kernel.org/cgit/linux/storage/autofs/autofs.git/ would be better 
here, I believe.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
