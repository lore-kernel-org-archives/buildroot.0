From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 18 Jan 2015 20:53:06 +0100
Subject: [Buildroot] [PATCH v2 1/5] package/rpm: sort selected packages
Message-ID: <1421610790-18508-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sort selected packages alphabetically in Config.in

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v2: new patch

 package/rpm/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index 620eb1a..379b15b 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -7,12 +7,12 @@ config BR2_PACKAGE_RPM
 	depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_BEECRYPT
-	select BR2_PACKAGE_POPT
-	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_NEON
+	select BR2_PACKAGE_NEON_SSL
 	select BR2_PACKAGE_NEON_XML
 	select BR2_PACKAGE_NEON_ZLIB
-	select BR2_PACKAGE_NEON_SSL
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_ZLIB
 	help
 	  The RPM package management system.
-- 
1.9.3
