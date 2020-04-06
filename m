From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Apr 2020 22:19:40 +0200
Subject: [Buildroot] [PATCH 6/7] support/testing: don't use
 TestPythonPackageBase.config and linaro toolchain
In-Reply-To: <20200405230414.416403-6-romain.naour@gmail.com>
References: <20200405230414.416403-1-romain.naour@gmail.com>
 <20200405230414.416403-6-romain.naour@gmail.com>
Message-ID: <20200406221940.57e37346@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  6 Apr 2020 01:04:13 +0200
Romain Naour <romain.naour@gmail.com> wrote:

>  class TestGst1Python(TestPythonPackageBase):
>      __test__ = True
> -    config = TestPythonPackageBase.config + \
> +    config = \
>          """
>          BR2_TOOLCHAIN_EXTERNAL=y
>          BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        BR2_arm=y
>          BR2_cortex_a9=y
>          BR2_ARM_ENABLE_VFP=y
>          BR2_ARM_EABIHF=y

I like when options are in the same order as they would appear in a
defconfig, so I took this opportunity to re-order them this way.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
