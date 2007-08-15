From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 15 Aug 2007 10:11:58 +0200
Subject: [Buildroot] [patch] kernel-headers: lzma causing issues
In-Reply-To: <46C24F7F.1020203@mainstreetsoftworks.com>
References: <46C24F7F.1020203@mainstreetsoftworks.com>
Message-ID: <1187165518.4942.6.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2007-08-14 klockan 20:57 -0400 skrev Brad House:
> The lzma patches really should be optional, so I've attached a patch
> which does exactly that.
> 
> I find myself having to remove the lzma patches because my build system
> doesn't natively have lzma.  I tried to compensate for this by
> installing the latest lzma from gentoo's package tree, and apparently,
> it accepts different flags than the one these patches expect, so my
> kernel build still fails.  Finally, I used the lzma from this buildroot
> and compiled it by hand, and it _mostly_ worked.  Regardless, it seems
> silly to make this a requirement.  Personally, I gzip my initramfs,
> and that's enough compression for me...
> 
> Please apply this patch and create a toolchain/kernel-headers/lzma
> directory and move the linux-*lzma*.patch files to that directory.
> I'm sure I can't be the only person who's had to simply delete those
> patches from my tree.
> 

<snip>

>  
> +config BR2_KERNEL_HEADERS_LZMA
> +	bool "use lzma initramfs kernel patches"
> +	default y
> +	help
> +	  Apply patches which allow for lzma compressed
> +	  initramfs filesystems.  This requires the lzma
> +	  program in your development environment.	
> +

Since it also breaks unless you have lzma causing headache, 
I think the default should be to not use the lzma patch...

I am working on a new scheme where the target/linux and
toolchain/kernel-headers are integrated, but this
needs a lot more testing and will (as agreed with Bernhard
be reviewed before applied, but it seems reasonable
to do this as an intermediate fix.

BR
Ulf Samuelsson
