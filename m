From: Romain Naour <romain.naour@smile.fr>
Date: Tue,  4 Jul 2017 23:53:39 +0200
Subject: [Buildroot] [PATCH] package/ratpoison: needs MMU
Message-ID: <20170704215339.28270-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/10c/10c0a41275ba53473c89881990ba608b7550b23a

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/ratpoison/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ratpoison/Config.in b/package/ratpoison/Config.in
index 0c78a1f..7b72429 100644
--- a/package/ratpoison/Config.in
+++ b/package/ratpoison/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RATPOISON
 	bool "ratpoison"
+	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_LIBERATION
-- 
2.9.4
