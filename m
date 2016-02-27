From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 27 Feb 2016 20:56:35 +0100
Subject: [Buildroot] [PATCH] package/pax-utils: needs kernel headers >= 3.5
Message-ID: <1456602995-22546-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pax-utils require a toolchain with kernel headers >= 3.5 to provide
PR_SET_NO_NEW_PRIVS.

Fixes:
http://autobuild.buildroot.net/results/a9e/a9e0287e67c03e5e385bf54578aa6c5c85206ec2

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/pax-utils/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pax-utils/Config.in b/package/pax-utils/Config.in
index 58100e4..e61d9b3 100644
--- a/package/pax-utils/Config.in
+++ b/package/pax-utils/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_PAX_UTILS
 	bool "pax-utils"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5 # needs PR_SET_NO_NEW_PRIVS
 	help
 	  ELF related utils for ELF 32/64 binaries that can check files
 	  for security relevant properties.
 
 	  http://www.gentoo.org/proj/en/hardened/pax-utils.xml
+
+comment "pax-utils needs a toolchain w/ headers >= 3.5"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
-- 
2.5.0
