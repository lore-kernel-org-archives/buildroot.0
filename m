From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Jan 2019 22:25:39 +0100
Subject: [Buildroot] [PATCH 2/2] support/testing: add atop test
In-Reply-To: <20190128021406.27477-2-ricardo.martincoski@gmail.com>
References: <20190128021406.27477-1-ricardo.martincoski@gmail.com>
 <20190128021406.27477-2-ricardo.martincoski@gmail.com>
Message-ID: <20190129222539.54bafd2a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ricardo,

On Mon, 28 Jan 2019 00:14:06 -0200
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> +class TestAtop(infra.basetest.BRTest):
> +    config = \
> +        """
> +        BR2_arm=y
> +        BR2_cortex_a9=y
> +        BR2_ARM_ENABLE_NEON=y
> +        BR2_ARM_ENABLE_VFP=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_SYSTEM_DHCP="eth0"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
> +        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
> +        BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"

Is there a good reason to build the kernel as part of this test case,
instead of using the prebuilt kernel, like most other package test
cases are doing ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
