From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 12:51:05 +0100
Subject: [Buildroot] [PATCH] linux: adding CIP RT
In-Reply-To: <20191125225846.13484-1-angelo@amarulasolutions.com>
References: <20191125225846.13484-1-angelo@amarulasolutions.com>
Message-ID: <20191126125105.06cd2fcb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The .hash file should be updated with the hash of this kernel tarball.

The commit log can be improved, we prefer using imperative sentence
"add <foo>", "fix <bar>" rather than "adding <foo>", "fixing <bar>".

Maybe:

	linux: add option to select the CIP real-time kernel

> -else ifeq ($(BR2_LINUX_KERNEL_LATEST_CIP_VERSION),y)
> +else ifneq ($(filter $(BR2_LINUX_KERNEL_LATEST_CIP_VERSION) $(BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION),y),)

Since it's a choice, this is sufficient:

ifeq ($(BR2_LINUX_KERNEL_LATEST_CIP_VERSION)$(BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION),y)

>  LINUX_SOURCE = linux-cip-$(LINUX_VERSION).tar.gz
>  LINUX_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git/snapshot
>  else ifneq ($(findstring -rc,$(LINUX_VERSION)),)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
