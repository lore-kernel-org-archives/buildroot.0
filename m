From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 08:49:00 +0200
Subject: [Buildroot] [PATCH v3 04/11] fs/ext2: allow reserving zero
 block for root
In-Reply-To: <20170703225106.1492-5-s.martin49@gmail.com>
References: <20170703225106.1492-1-s.martin49@gmail.com>
 <20170703225106.1492-5-s.martin49@gmail.com>
Message-ID: <20170704084900.7b25225d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Jul 2017 00:50:59 +0200, Samuel Martin wrote:

>  config BR2_TARGET_ROOTFS_EXT2_RESBLKS
>  	int "reserved blocks percentage"
> -	default 0
> +	default 5
> +	help
> +	  The number of blocks on the filesystem (as a percentage of the
> +	  total number of blocksi), that are reserved for use by root.
> +	  Traditionally, this has been 5%, and all ext-related tools still
> +	  default to reserving 5% when creating a nez ext filesystem.

Typo: nez -> new.

Fixed when applying to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
