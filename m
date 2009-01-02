From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 02 Jan 2009 23:45:20 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <87fxkf8dnm.fsf@macbook.be.48ers.dk>
References: <20081220205708.1766876CEB@busybox.osuosl.org>
	<87fxkf8dnm.fsf@macbook.be.48ers.dk>
Message-ID: <1230936320.8886.28.camel@linux-yrgm.site>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2008-12-23 klockan 10:05 +0100 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2008-12-20 20:57:07 +0000 (Sat, 20 Dec 2008)
>  ulf> New Revision: 24465
> 
>  ulf> Log:
>  ulf> Put latest version info in separate file for easier maintenance
> 
>  ulf> Added:
>  ulf>    trunk/buildroot/target/linux/Config.in.versions
> 
>  ulf> Modified:
>  ulf>    trunk/buildroot/target/linux/Config.in.advanced
> 
> Is this an improvement? Don't you now need to maintain 2 files?
> 
>  ulf> Changeset:
>  ulf> Modified: trunk/buildroot/target/linux/Config.in.advanced
>  ulf> ===================================================================
>  ulf> --- trunk/buildroot/target/linux/Config.in.advanced	2008-12-20 18:26:38 UTC (rev 24464)
>  ulf> +++ trunk/buildroot/target/linux/Config.in.advanced	2008-12-20 20:57:07 UTC (rev 24465)
>  ulf> @@ -30,21 +30,24 @@
>  ulf>  #
>  ulf>  # ---------------------------------------------------------------------------
>  ulf>  # --- These 'constants' requires regular maintenance, so put them first
>  ulf> +
>  ulf> +source "target/linux/Config.in.versions"
>  ulf> +
>  ulf>  config BR2_KERNEL_PATCH_LEVEL
>  ulf>  	string
>  ulf> -	default "9" if BR2_LINUX_2_6_27 && BR2_KERNEL_ADD_LATEST_MINORPATCH
>  ulf> -	default "8" if BR2_LINUX_2_6_26 && BR2_KERNEL_ADD_LATEST_MINORPATCH
>  ulf> -	default "9" if BR2_LINUX_2_6_25 && BR2_KERNEL_ADD_LATEST_MINORPATCH
>  ulf> -	default "7" if BR2_LINUX_2_6_24 && BR2_KERNEL_ADD_LATEST_MINORPATCH
>  ulf> -	default "17" if BR2_LINUX_2_6_23 && BR2_KERNEL_ADD_LATEST_MINORPATCH
>  ulf> -	default "19" if BR2_LINUX_2_6_22 && BR2_KERNEL_ADD_LATEST_MINORPATCH
>  ulf> -	default "7" if BR2_LINUX_2_6_21 && BR2_KERNEL_ADD_LATEST_MINORPATCH
>  ulf> -	default "21" if BR2_LINUX_2_6_20 && BR2_KERNEL_ADD_LATEST_MINORPATCH
>  ulf> +	default $(BR2_KERNEL_LATEST_2_6_27) if BR2_LINUX_2_6_27 && BR2_KERNEL_ADD_LATEST_MINORPATCH
>  ulf> +	default $(BR2_KERNEL_LATEST_2_6_26) if BR2_LINUX_2_6_26 && BR2_KERNEL_ADD_LATEST_MINORPATCH
>  ulf> +	default $(BR2_KERNEL_LATEST_2_6_25) if BR2_LINUX_2_6_25 && BR2_KERNEL_ADD_LATEST_MINORPATCH
>  ulf> +	default $(BR2_KERNEL_LATEST_2_6_24) if BR2_LINUX_2_6_24 && BR2_KERNEL_ADD_LATEST_MINORPATCH
>  ulf> +	default $(BR2_KERNEL_LATEST_2_6_23) if BR2_LINUX_2_6_23 && BR2_KERNEL_ADD_LATEST_MINORPATCH
>  ulf> +	default $(BR2_KERNEL_LATEST_2_6_22) if BR2_LINUX_2_6_22 && BR2_KERNEL_ADD_LATEST_MINORPATCH
>  ulf> +	default $(BR2_KERNEL_LATEST_2_6_21) if BR2_LINUX_2_6_21 && BR2_KERNEL_ADD_LATEST_MINORPATCH
>  ulf> +	default $(BR2_KERNEL_LATEST_2_6_20) if BR2_LINUX_2_6_20 && BR2_KERNEL_ADD_LATEST_MINORPATCH
>  ulf>  	default "$(BR2_KERNEL_MINORLEVEL)" if BR2_KERNEL_ADD_MINORPATCH
> 
> Do we really need to support that many kernel versions? Shouldn't some
> of them atlest be marked as deprecated?

It all depends on why Buildroot exists.
If it is to be more than a toy, then you need some stability.

I regularily talk to customers which plans to use the
same platform for > 10 years.
At some stage products are put into maintenace mode.
I can see people wanting to keep an old kernel while
updating the file system,

The system currently allows people to EASILY 
build any kernel from 2.6.20 and upwards, instead of 
the old makefile which had a fairly small flexibility.
YOu can apply any type of patch, including your own.

What is the real drawback of that?

> 
