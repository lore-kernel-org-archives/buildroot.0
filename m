From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Oct 2018 19:33:53 +0200
Subject: [Buildroot] [PATCH] tar: adjust Config.in comment dependency
Message-ID: <20181026173353.9779-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 916b21a7fbf266f452b8dc4116133cc57fdad269 ("package/tar:
Depends on MMU"), BR2_PACKAGE_TAR depends on BR2_USE_MMU. However, the
Config.in comment does not take into account this dependency, an
inconsistency which is fixed by this commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tar/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tar/Config.in b/package/tar/Config.in
index b0be7a389f..caf12d6f16 100644
--- a/package/tar/Config.in
+++ b/package/tar/Config.in
@@ -12,4 +12,5 @@ config BR2_PACKAGE_TAR
 
 comment "tar needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
+	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-- 
2.14.4
