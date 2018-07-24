From: Geoff Levand <geoff@infradead.org>
Date: Tue, 24 Jul 2018 19:32:17 +0000
Subject: [Buildroot] [PATCH v1 2/2] dmidecode: Enable for aarch64
Message-ID: <5a39bc20074e6dc63b2e07c1114fa172160bf7e3.1532460521.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

arm64 systems support SMBIOS, so update the dmidecode config
to allow building dmidecode for arm64.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/dmidecode/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dmidecode/Config.in b/package/dmidecode/Config.in
index 22272ed294..58e7a785ce 100644
--- a/package/dmidecode/Config.in
+++ b/package/dmidecode/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_DMIDECODE
 	bool "dmidecode"
-	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_aarch64 || BR2_i386 || BR2_x86_64
 	help
 	  Dmidecode reports information about your system's hardware
 	  as described in your system BIOS according to the SMBIOS/DMI
-- 
2.14.1
