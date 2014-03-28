From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 28 Mar 2014 11:16:07 +0100
Subject: [Buildroot] [PATCH 1/1] systemd: disable build for unsupported
	architectures.
Message-ID: <1396001767-4910-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Systemd only supports the architectures defined in
src/shared/architecture.h. This list does not contain ARC, Blackfin,
Xtensa, Microblaze and Nios2, so this package is disabled for these
architectures.

Fixes http://autobuild.buildroot.net/results/bcc/bcce95eb0748505c0d62db21a6e420aae3c3181b/

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/systemd/Config.in |    2 ++
 system/Config.in          |    2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 838e13e..66b5fc4 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_SYSTEMD
 	bool "systemd"
 	depends on BR2_INIT_SYSTEMD
 	depends on !BR2_avr32 # no epoll_create1
+	depends on !BR2_arc && !BR2_bfin && !BR2_xtensa
+	depends on !BR2_microblaze && !BR2_nios2
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_INET_IPV6
diff --git a/system/Config.in b/system/Config.in
index e8f1ed6..217dbd4 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -88,6 +88,8 @@ config BR2_INIT_SYSV
 config BR2_INIT_SYSTEMD
 	bool "systemd"
 	depends on !BR2_avr32 # no epoll_create1
+	depends on !BR2_arc && !BR2_bfin && !BR2_xtensa
+	depends on !BR2_microblaze && !BR2_nios2
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
-- 
1.7.9.5
