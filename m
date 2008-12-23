From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 23 Dec 2008 10:05:33 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <20081220205708.1766876CEB@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Sat\, 20 Dec 2008 20\:57\:07 +0000 \(UTC\)")
References: <20081220205708.1766876CEB@busybox.osuosl.org>
Message-ID: <87fxkf8dnm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2008-12-20 20:57:07 +0000 (Sat, 20 Dec 2008)
 ulf> New Revision: 24465

 ulf> Log:
 ulf> Put latest version info in separate file for easier maintenance

 ulf> Added:
 ulf>    trunk/buildroot/target/linux/Config.in.versions

 ulf> Modified:
 ulf>    trunk/buildroot/target/linux/Config.in.advanced

Is this an improvement? Don't you now need to maintain 2 files?

 ulf> Changeset:
 ulf> Modified: trunk/buildroot/target/linux/Config.in.advanced
 ulf> ===================================================================
 ulf> --- trunk/buildroot/target/linux/Config.in.advanced	2008-12-20 18:26:38 UTC (rev 24464)
 ulf> +++ trunk/buildroot/target/linux/Config.in.advanced	2008-12-20 20:57:07 UTC (rev 24465)
 ulf> @@ -30,21 +30,24 @@
 ulf>  #
 ulf>  # ---------------------------------------------------------------------------
 ulf>  # --- These 'constants' requires regular maintenance, so put them first
 ulf> +
 ulf> +source "target/linux/Config.in.versions"
 ulf> +
 ulf>  config BR2_KERNEL_PATCH_LEVEL
 ulf>  	string
 ulf> -	default "9" if BR2_LINUX_2_6_27 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 ulf> -	default "8" if BR2_LINUX_2_6_26 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 ulf> -	default "9" if BR2_LINUX_2_6_25 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 ulf> -	default "7" if BR2_LINUX_2_6_24 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 ulf> -	default "17" if BR2_LINUX_2_6_23 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 ulf> -	default "19" if BR2_LINUX_2_6_22 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 ulf> -	default "7" if BR2_LINUX_2_6_21 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 ulf> -	default "21" if BR2_LINUX_2_6_20 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 ulf> +	default $(BR2_KERNEL_LATEST_2_6_27) if BR2_LINUX_2_6_27 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 ulf> +	default $(BR2_KERNEL_LATEST_2_6_26) if BR2_LINUX_2_6_26 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 ulf> +	default $(BR2_KERNEL_LATEST_2_6_25) if BR2_LINUX_2_6_25 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 ulf> +	default $(BR2_KERNEL_LATEST_2_6_24) if BR2_LINUX_2_6_24 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 ulf> +	default $(BR2_KERNEL_LATEST_2_6_23) if BR2_LINUX_2_6_23 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 ulf> +	default $(BR2_KERNEL_LATEST_2_6_22) if BR2_LINUX_2_6_22 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 ulf> +	default $(BR2_KERNEL_LATEST_2_6_21) if BR2_LINUX_2_6_21 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 ulf> +	default $(BR2_KERNEL_LATEST_2_6_20) if BR2_LINUX_2_6_20 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 ulf>  	default "$(BR2_KERNEL_MINORLEVEL)" if BR2_KERNEL_ADD_MINORPATCH

Do we really need to support that many kernel versions? Shouldn't some
of them atlest be marked as deprecated?

-- 
Bye, Peter Korsgaard
