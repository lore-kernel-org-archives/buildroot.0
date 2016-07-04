From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 11:08:49 +0200
Subject: [Buildroot] [PATCH v3 2/3] toolchain: add bfin support
In-Reply-To: <20160603040531.GA31560@waldemar-brodkorb.de>
References: <20160603040531.GA31560@waldemar-brodkorb.de>
Message-ID: <20160704110849.28f815fc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 3 Jun 2016 06:05:31 +0200, Waldemar Brodkorb wrote:

>  config BR2_TOOLCHAIN_BUILDROOT
>  	bool "Buildroot toolchain"
> -	depends on !BR2_bfin
>  	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS

BTW, uClibc-ng has linuxthreads support for Blackfin, but this patch
series does not enable it. I tried to enable it, but it fails to build.

Do you plan on enabling thread support on Blackfin at some point ?

If we have good enough Blackfin support in the internal toolchain
backend, this would ultimately allow us to get rid of the old Analog
Devices external toolchains for Blackfin (they use gcc 4.3, a
prehistoric version of uClibc, etc.), so getting rid of them would
really be nice.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
