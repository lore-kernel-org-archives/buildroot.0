From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 09 Jan 2009 18:40:22 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <87hc48rg53.fsf@macbook.be.48ers.dk>
References: <20090109063009.8E640768C5@busybox.osuosl.org>
	<87hc48rg53.fsf@macbook.be.48ers.dk>
Message-ID: <1231522822.9711.32.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2009-01-09 klockan 10:19 +0100 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2009-01-09 06:30:08 +0000 (Fri, 09 Jan 2009)
>  ulf> New Revision: 24729
> 
>  ulf> Log:
>  ulf> Make sure U-boot is built, if we do make uImage
> 
>  ulf> Modified:
>  ulf>    trunk/buildroot/target/linux/Config.in.advanced
> 
> 
>  ulf> Changeset:
>  ulf> Modified: trunk/buildroot/target/linux/Config.in.advanced
>  ulf> ===================================================================
>  ulf> --- trunk/buildroot/target/linux/Config.in.advanced	2009-01-08 23:01:50 UTC (rev 24728)
>  ulf> +++ trunk/buildroot/target/linux/Config.in.advanced	2009-01-09 06:30:08 UTC (rev 24729)
>  ulf> @@ -464,6 +464,7 @@
>  ulf>  config BR2_LINUX_BIN_UIMAGE
>  ulf>  	bool "uImage"
>  ulf>  	depends on BR2_PACKAGE_LINUX
>  ulf> +	select BR2_TARGET_UBOOT
> 
> Silently selecting something as big and with so many configuration
> options as U-Boot isn't that nice - I think it would be nicer to
> depend on UBOOT instead.

No, that means that it will silently ignore this alternative.
?if u-boot is not selected.

	bool "uImage"

can be replaced by

	bool "uImage - Will force build of u-boot"

or something

BR
Ulf Samuelsson
