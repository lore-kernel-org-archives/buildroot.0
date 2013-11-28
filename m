From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2013 23:29:50 +0100
Subject: [Buildroot] [git commit] ecryptfs-utils: add a dependencies comment
Message-ID: <20131128223008.579B79BE26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5be04371a33fa464ff31c55c91c7cf133c65a507
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ecryptfs-utils/Config.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index 4b34e0f..62cf6c8 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -21,3 +21,9 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	  for another method.
 
 	  http://ecryptfs.org
+
+comment "ecryptfs-utils needs a toolchain w/ largefile, threads"
+	depends on !BR2_avr32 && !BR2_microblaze
+	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
+	depends on BR2_USE_MMU
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
