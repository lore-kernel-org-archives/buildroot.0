From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Oct 2020 23:36:06 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/uboot-tools: migrate
 BR2_TARGET_UBOOT_ENVIMAGE from U-Boot pkg
In-Reply-To: <20200924192912.51913-2-matthew.weber@rockwellcollins.com>
References: <20200924192912.51913-1-matthew.weber@rockwellcollins.com>
 <20200924192912.51913-2-matthew.weber@rockwellcollins.com>
Message-ID: <9df3ef91-e578-4bef-ce95-dd1b27301b7f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24/09/2020 21:29, Matt Weber wrote:
> Note: This patch creates a circular dependency with uboot until the
> similar migration patch is merged for uboot scripts

 Actually, there is still a circular dependency after this series: uboot ->
arm-trusted-firmware -> host-uboot-tools -> uboot.

 However, this would only be the case if both
BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT and BR2_TARGET_UBOOT_NEEDS_ATF_BL31
are selected. This is possible, but in practice not useful AFAIU.

 Anyway, to reduce the chance even further I've added the uboot dependency only
if _ENVIMAGE_SOURCE is empty.

 Regards,
 Arnout
