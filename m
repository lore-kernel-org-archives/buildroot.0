From: Nylon Chen <nylon7@andestech.com>
Date: Mon, 6 May 2019 16:21:46 +0800
Subject: [Buildroot] [PATCH 2/3] package/libbsd: disable for nds32
In-Reply-To: <20190506082146.21731-1-nylon7@andestech.com>
References: <20190506082146.21731-1-nylon7@andestech.com>
Message-ID: <20190506082146.21731-2-nylon7@andestech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nds32 no porting libbsd library

Fixes:
  http://autobuild.buildroot.net/results/eb79fbd8283f62ca08b85d851e3c817e0354f85c/
Signed-off-by: Nylon Chen <nylon7@andestech.com>
---
 package/libbsd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
index 0f320302b9..1a107d41f0 100644
--- a/package/libbsd/Config.in
+++ b/package/libbsd/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
 	depends on !BR2_microblaze
 	depends on !BR2_arc
 	depends on !BR2_xtensa
+	depends on !BR2_nds32
 	# uClibc on noMMU doesn't provide __register_atfork()
 	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)
 
-- 
2.18.0
