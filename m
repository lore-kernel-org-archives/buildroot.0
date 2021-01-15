From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Fri, 15 Jan 2021 12:03:18 -0800
Subject: [Buildroot] [PATCH 3/4] configs/snps_archs38_hsdk_defconfig: switch
 to glibc hard-float
In-Reply-To: <20210115200319.4139041-1-vgupta@synopsys.com>
References: <20210115200319.4139041-1-vgupta@synopsys.com>
Message-ID: <20210115200319.4139041-4-vgupta@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We are no longer actively working on uClibc and hard-float support is
pretty stable, so make that default for HSDK boards

The hard-float setting is a bit convulated since current ARC gcc lacks
--with-fpu - so this is done with BR2_TARGET_OPTIMIZATION

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 configs/snps_archs38_hsdk_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/snps_archs38_hsdk_defconfig b/configs/snps_archs38_hsdk_defconfig
index b8fd35636000..69d0b1936b3a 100644
--- a/configs/snps_archs38_hsdk_defconfig
+++ b/configs/snps_archs38_hsdk_defconfig
@@ -1,6 +1,9 @@
 BR2_arcle=y
 BR2_archs38_full=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
+BR2_PACKAGE_GLIBC_UTILS=y
+BR2_TARGET_OPTIMIZATION="-mfpu=fpud_all"
 BR2_TARGET_GENERIC_HOSTNAME="hsdk"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the HSDK Platform"
 BR2_SYSTEM_DHCP="eth0"
-- 
2.25.1
