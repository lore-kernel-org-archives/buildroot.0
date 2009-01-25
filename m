From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 25 Jan 2009 22:54:01 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <20090125214834.783FA76D28@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Sun\, 25 Jan 2009 21\:48\:34 +0000 \(UTC\)")
References: <20090125214834.783FA76D28@busybox.osuosl.org>
Message-ID: <871vurdpc6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-25 21:48:33 +0000 (Sun, 25 Jan 2009)
 ulf> New Revision: 25024

 ulf> Log:

 ulf> Use new SHELL variable BUILDROOT_KERNEL_CONFIG_METHOD
 ulf> which will override selection between xconfig and menuconfig

 ulf> make xconfig will, if it fails, or user does not save configuration
 ulf> result in make menuconfig beeing tried

Sigh, please don't make these changes to the tree before we come to an
agreement on the list.

 ulf> Fix several issues causing final part of linux to be regenerated
 ulf> on each make.
 
 ulf>  choice
 ulf>  	prompt "Preferred config tool"
 ulf> -	default BR2_MAKE_MENUCONFIG
 ulf> +	default BR2_MAKE_XCONFIG

Don't do that.

 ulf> +# Override config method with shell variable
 ulf> +ifneq ($(BUILDROOT_KERNEL_CONFIG_METHOD),)
 ulf> +KERNEL_CONFIG_METHOD:=$(strip $(subst ",,$(BUILDROOT_KERNEL_CONFIG_METHOD)))
 ulf> +#"))
 ulf> +else
 ulf>  KERNEL_CONFIG_METHOD:=$(strip $(subst ",,$(BR2_KERNEL_CONFIG_METHOD)))
 ulf>  #"))
 ulf>  ifeq ($(KERNEL_CONFIG_METHOD),)
 ulf> -KERNEL_CONFIG_METHOD:=menuconfig
 ulf> +KERNEL_CONFIG_METHOD:=xconfig
 ulf>  endif

But why?

-- 
Bye, Peter Korsgaard
