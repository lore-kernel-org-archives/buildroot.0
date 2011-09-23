From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Sep 2011 09:55:37 +0200
Subject: [Buildroot] [PATCH] barebox: add support for custom version,
 tarball, git and patch dir
In-Reply-To: <CAAXf6LU7pHVFm8vexDJrw_2kWT0KAS-J-saG07qRs-xn8iwrgg@mail.gmail.com>
References: <1316290988-25108-1-git-send-email-plagnioj@jcrosoft.com>
 <201109221920.37170.arnout@mind.be>
 <87d3es1he8.fsf@macbook.be.48ers.dk>
 <CAAXf6LU7pHVFm8vexDJrw_2kWT0KAS-J-saG07qRs-xn8iwrgg@mail.gmail.com>
Message-ID: <20110923095537.05830b8b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 23 Sep 2011 08:27:24 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> Of the approaches described above, I prefer Thomas' one: use the
> board/<company>/<project>/ directory for such patches. But are these
> patches automatically detected and applied by buildroot?

Depends on what you call automatically. As long as you tell the kernel
config, u-boot config or barebox config to apply those patches, then,
they will be applied.

Here is the config that I have for a project:

BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BOARDNAME="myboard"
BR2_TARGET_UBOOT_1_3_4=y
BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR="board/company/boardname/u-boot-1.3.4-patches/"
# BR2_TARGET_UBOOT_NETWORK is not set
BR2_TARGET_AT91BOOTSTRAP=y
BR2_TARGET_AT91BOOTSTRAP_BOARD="myboard"
BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR="board/company/boardname/at91bootstrap-1.16-patches/"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.39"
BR2_LINUX_KERNEL_PATCH="board/company/boardname/linux-2.6.39-patches/"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/company/boardname/linux-2.6.39.config"

This allows to build U-Boot 1.3.4 (old!) with patches, AT91Bootstrap
1.16 with patches, and Linux 2.6.39 with patches.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
