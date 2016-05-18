From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 18 May 2016 09:30:57 +0200
Subject: [Buildroot] [PATCH 1/1] kodi: fix build when
 BR2_PACKAGE_LIBFSLVPUWRAP=y
In-Reply-To: <qucs0dxan9.ln2@ID-313208.user.individual.net>
References: <1463500440-25200-1-git-send-email-sebastien.szymanski@armadeus.com>
 <qucs0dxan9.ln2@ID-313208.user.individual.net>
Message-ID: <d95e26d4-d157-72cd-1cb2-33f23b3780aa@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On 05/17/2016 10:53 PM, Bernd Kuhls wrote:
> Hi S?bastien,
> 
> Am Tue, 17 May 2016 17:54:00 +0200 schrieb S?bastien Szymanski:
> 
>> Note: I had to install .py files to test Kodi on my target (APF6D) with
>> BR2_PACKAGE_PYTHON_PY_PYC otherwise Kodi complained that it couldn't
>> find site.py and crashed at startup.
> 
> please post your defconfig to help reproduce the problem. I remember Yann 
> said something similar about a year ago.

My defconfig:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_NEON=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-wandboard imx6dl-wandboard"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_FREESCALE_IMX=y
BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q=y
BR2_PACKAGE_IMX_GPU_VIV=y
BR2_PACKAGE_LIBFSLVPUWRAP=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_PACKAGE_HOST_GENIMAGE=y


> 
>> +KODI_DEPENDENCIES += imx-gpu-viv libfslvpuwrap linux
> 
> What happens if no kernel package is enabled? I have no contact with the 
> i.MX platform besides seeing regular commits for it in OpenELEC so I am 
> at a loss here ;)

You're right. I have to edit the Config.in file to add a "depends on the
kernel" like the imx-lib package.

Thank you.

Regards,

> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
S?bastien Szymanski
Software Engineer
Armadeus Systems - A new vision of the embedded world
sebastien.szymanski at armadeus.com
Tel: +33 (0)9 72 29 41 44
Fax: +33 (0)9 72 28 79 26
