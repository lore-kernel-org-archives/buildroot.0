From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 26 Jul 2016 07:00:37 +0300
Subject: [Buildroot] [PATCH] ipkg: needs MMU
Message-ID: <b8ef63602bd75ed7fe6b8d87d48e5d36680f3c91.1469505637.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/6cf/6cf75e08795d9ab194ce4e882c0f4858bad979c3/
http://autobuild.buildroot.net/results/964/964d8f694bc7d05b35411eabfbadf40bbf6337ae/
http://autobuild.buildroot.net/results/0f2/0f2cddf89af3ad4330556acd04ab6cb080370e24/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ipkg/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ipkg/Config.in b/package/ipkg/Config.in
index 4b2078d9cd70..d93e1d17b3dd 100644
--- a/package/ipkg/Config.in
+++ b/package/ipkg/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_IPKG
 	bool "ipkg"
+	depends on BR2_USE_MMU # fork()
 	help
 	  The Itsy Package Installer from handhelds.org
 
-- 
2.8.1
