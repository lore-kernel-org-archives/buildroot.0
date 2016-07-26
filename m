From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jul 2016 10:01:01 +0200
Subject: [Buildroot] [PATCH] ipkg: needs MMU
In-Reply-To: <20160726095929.63583d2e@free-electrons.com>
References: <b8ef63602bd75ed7fe6b8d87d48e5d36680f3c91.1469505637.git.baruch@tkos.co.il>
 <20160726095929.63583d2e@free-electrons.com>
Message-ID: <20160726100101.208d0299@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Sorry, last e-mail sent mistakenly.

On Tue, 26 Jul 2016 09:59:29 +0200, Thomas Petazzoni wrote:

> I think this needs more investigation, because:
> 
> BR2_bfin=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_INIT_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_IPKG=y
> # BR2_TARGET_ROOTFS_TAR is not set
> 
> which is a noMMU configuration, is able to build ipkg just fine.

I was indeed a bit surprised to see this patch: we have been having
Blackfin configurations for a long time in the autobuilders, and we
never had to add a BR2_USE_MMU dependency on this package.

So I believe there's something a bit more subtle going on here.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
