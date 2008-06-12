From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 12 Jun 2008 15:14:30 +1000
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
In-Reply-To: <20080611130704.379E93C65A@busybox.net>
References: <20080611130704.379E93C65A@busybox.net>
Message-ID: <20080612051430.GD12527@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 11, 2008 at 06:07:04AM -0700, jacmet at uclibc.org wrote:
> -U_BOOT_ARCH:=$(shell echo $(KERNEL_ARCH)|$(HOST_SED_DIR)/bin/sed 's/powerpc/ppc/')
> +U_BOOT_ARCH=$(shell echo $(KERNEL_ARCH)|$(HOST_SED_DIR)/bin/sed 's/powerpc/ppc/')

How about

U_BOOT_ARCH=$(KERNEL_ARCH:powerpc=ppc)

anyway.. less ugly than calling the shell + sed.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
