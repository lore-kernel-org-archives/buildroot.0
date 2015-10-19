From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Oct 2015 22:27:10 +0200
Subject: [Buildroot] [PATCH 1/2 v2] package/nodejs: fix architectural
 dependencies on ARM
In-Reply-To: <03bfe81f7d32e7eb9b032d41d8c720d7ab95cb69.1445277033.git.yann.morin.1998@free.fr>
References: <cover.1445277033.git.yann.morin.1998@free.fr>
 <03bfe81f7d32e7eb9b032d41d8c720d7ab95cb69.1445277033.git.yann.morin.1998@free.fr>
Message-ID: <20151019222710.74159e82@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 19 Oct 2015 19:51:00 +0200, Yann E. MORIN wrote:

> +# Starting with 0.12.x, on ARM, V8 (the JS engine)
> +# requires an armv6+ and a VFPv2+.
> +config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
> +	bool
> +	default y
> +	depends on !BR2_arm || !BR2_ARM_CPU_ARMV5 && BR2_ARM_CPU_HAS_VFPV2

I would find the following to be a bit easier to understand:

	# On supported architectures other than ARM, no special requirement
	default y if !BR2_arm
	# On ARM, at least ARMv6+ with VFPv2+ is needed
	default y if !BR2_ARM_CPU_ARMV5 && BR2_ARM_CPU_HAS_VFPV2

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
