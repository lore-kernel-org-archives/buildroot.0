From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 30 Jan 2013 10:02:59 +0200
Subject: [Buildroot] [PATCH] ebtables: needs MMU
Message-ID: <2421772085e9da9e5df5944b3f8ddbb581413052.1359532928.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/201f8d3d58cdff0c3501a673003558103237fb22/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ebtables/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ebtables/Config.in b/package/ebtables/Config.in
index 40bc45c..ce67285 100644
--- a/package/ebtables/Config.in
+++ b/package/ebtables/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_EBTABLES
 	bool "ebtables"
 	depends on BR2_INET_IPV6
+	depends on BR2_USE_MMU # fork()
 	help
 	  Ethernet bridge frame table administration
 
-- 
1.7.10.4
