From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Feb 2011 14:32:41 +0100
Subject: [Buildroot] [PATCH 2/3] initial support for Blackfin processors
In-Reply-To: <1297057752-5850-2-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Mon, 7 Feb 2011 00:49:11 -0500")
References: <1297057741-5809-1-git-send-email-vapier@gentoo.org>
	<1297057752-5850-1-git-send-email-vapier@gentoo.org>
	<1297057752-5850-2-git-send-email-vapier@gentoo.org>
Message-ID: <87mxm8vukm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

Hi,

 Mike> +++ b/toolchain/toolchain-common.in
 Mike> @@ -67,7 +67,7 @@ config BR2_NEEDS_GETTEXT_IF_LOCALE
 Mike>  	default y if (BR2_NEEDS_GETTEXT && BR2_ENABLE_LOCALE)
 
 Mike>  config BR2_USE_MMU
 Mike> -	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_sh || BR2_xtensa
 Mike> +	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_bfin || BR2_mips || BR2_mipsel || BR2_sh || BR2_xtensa
 Mike>  	default y

Bfin doesn't have MMU, right? So enabling USE_MMU doesn't make sense.
I've changed it to be 'default y if !BR2_bfin' - Committed, thanks.

-- 
Bye, Peter Korsgaard
