From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 22:04:22 +0200
Subject: [Buildroot] [git commit] package/haproxy: depends on
 BR2_TOOLCHAIN_HAS_SYNC_1
Message-ID: <20190917200002.5CDEA8E8ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf9a65dc6016123fbbef2466f1f4660313951bb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/512904ace780508de5e3a56b0094bbe6287d751e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/haproxy/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/haproxy/Config.in b/package/haproxy/Config.in
index db63143a74..b348eb9d8a 100644
--- a/package/haproxy/Config.in
+++ b/package/haproxy/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_HAPROXY
 	bool "haproxy"
 	depends on BR2_PACKAGE_HAPROXY_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrisics
+	depends on BR2_TOOLCHAIN_HAS_SYNC_1 && BR2_TOOLCHAIN_HAS_SYNC_4
 	help
 	  HAProxy is a free, very fast and reliable solution offering
 	  high availability, load balancing, and proxying for TCP and
