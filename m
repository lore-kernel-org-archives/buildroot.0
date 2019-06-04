From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue,  4 Jun 2019 17:14:18 +0200
Subject: [Buildroot] [PATCH] boost: allow building on Microblaze
Message-ID: <20190604151418.128836-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package boost builds correctly on Microblaze with Gcc 4.9/5/6/7/8/9 so
add 'default y if BR2_microblaze' to
BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 4e6bbff6df..783e86dc09 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -78,6 +78,7 @@ config BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	default y if BR2_mipsel
 	default y if BR2_powerpc
 	default y if BR2_x86_64
+	default y if BR2_microblaze
 
 config BR2_PACKAGE_BOOST_CONTEXT
 	bool "boost-context"
-- 
2.17.1
