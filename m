From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Jun 2014 13:30:24 -0300
Subject: [Buildroot] [PATCH] pax-utils: needs largefile support
Message-ID: <1403109024-16137-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/2f8/2f833cc285eac99daba96949b9601f4e64b6f6be/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pax-utils/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pax-utils/Config.in b/package/pax-utils/Config.in
index 58100e4..2591e2f 100644
--- a/package/pax-utils/Config.in
+++ b/package/pax-utils/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_PAX_UTILS
 	bool "pax-utils"
+	depends on BR2_LARGEFILE
 	help
 	  ELF related utils for ELF 32/64 binaries that can check files
 	  for security relevant properties.
 
 	  http://www.gentoo.org/proj/en/hardened/pax-utils.xml
+
+comment "pax-utils needs a toolchain w/ largefile"
+	depends on !BR2_LARGEFILE
-- 
1.8.5.5
