From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Jan 2011 13:29:06 +0100
Subject: [Buildroot] [PATCH 3/7] toolchain: add a USE_MMU build option
In-Reply-To: <1294669725-5379-3-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Mon, 10 Jan 2011 09:28:41 -0500")
References: <1294669718-5339-1-git-send-email-vapier@gentoo.org>
	<1294669725-5379-1-git-send-email-vapier@gentoo.org>
	<1294669725-5379-3-git-send-email-vapier@gentoo.org>
Message-ID: <87y66nvfcd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> Some packages need to know whether the MMU is in play, so add a toolchain
 Mike> option to expose the feature to them.

 Mike> +++ b/toolchain/toolchain-common.in
 Mike> @@ -66,6 +66,13 @@ config BR2_NEEDS_GETTEXT_IF_LOCALE
 Mike>  	bool
 Mike>  	default y if (BR2_NEEDS_GETTEXT && BR2_ENABLE_LOCALE)
 
 Mike> +config BR2_USE_MMU
 Mike> +	bool "Enable MMU support"
 Mike> +	default y
 Mike> +	help
 Mike> +	  If your target has a MMU, you should say Y here.  If you
 Mike> +	  are unsure, just say Y.

I think it makes sense to only show this option on archs where nommu
makes sense to not confuse users. - E.G.:

bool "Enable MMU support" if BR2_arm || BR2_armeb ...

What archs currently have working nommu support in uClibc?

-- 
Bye, Peter Korsgaard
