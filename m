From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 May 2019 21:40:40 +0200
Subject: [Buildroot] [git commit] package/libbsd: disable for nds32
Message-ID: <20190506193621.578D783D90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92afce5951921451ab03aa88f36eeeab739ded67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no support for nds32 in libbsd.

Fixes:
  http://autobuild.buildroot.net/results/eb79fbd8283f62ca08b85d851e3c817e0354f85c/

Signed-off-by: Nylon Chen <nylon7@andestech.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
