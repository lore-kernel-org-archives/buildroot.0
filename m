From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 27 Mar 2019 17:40:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/bird: BFD protocol needs threads
Message-ID: <20190327164059.24223-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/e1f879cb34f9cfbbd14b75f63d25897c5bee53cd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bird/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/bird/Config.in b/package/bird/Config.in
index 63170ee470..bb5fbf92d5 100644
--- a/package/bird/Config.in
+++ b/package/bird/Config.in
@@ -29,9 +29,13 @@ config BR2_PACKAGE_BIRD_BABEL
 
 config BR2_PACKAGE_BIRD_BFD
 	bool "bfd"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Enable BFD protocol.
 
+comment "BFD protocol needs threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_BIRD_BGP
 	bool "bgp"
 	default y
-- 
2.14.1
