From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 22:23:53 +0200
Subject: [Buildroot] [PATCH RFC] Revert "Added local directory as source
 of kernel code"
In-Reply-To: <1467066844-28355-1-git-send-email-yann.morin.1998@free.fr>
References: <1467066844-28355-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160827222353.02bc0df2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Yann,

Peter: do you have an opinion on this patch. If not, I think I'm going
to apply it, so please raise your opinion if you disagree.

Yann: a few questions below.

On Tue, 28 Jun 2016 00:34:04 +0200, Yann E. MORIN wrote:
> -config BR2_LINUX_KERNEL_CUSTOM_LOCAL
> -	bool "Local directory"
> -	help
> -	  This option allows Buildroot to get the Linux kernel source
> -	  code from a local directory.

What about Config.in.legacy handling?

>  # Compute LINUX_SOURCE and LINUX_SITE from the configuration
> -ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
> +ifeq ($(LINUX_VERSION),custom)

Why are you doing this change?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
