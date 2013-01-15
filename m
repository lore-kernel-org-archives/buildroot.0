From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 15 Jan 2013 08:39:39 +0100
Subject: [Buildroot] [git commit] package/tvheadend: requires IPv6
Message-ID: <20130115082314.D6D609A18F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3222862f62ebe80c0cb4b680e6fb46c03cc5706
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes autobuild failure:
    http://autobuild.buildroot.org/results/40cc7428b25afe3cddae50ec2098ee43127a2f41/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tvheadend/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index e6dee3a..67badce 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -1,9 +1,9 @@
-comment "tvheadend requires a toolchain with LARGEFILE support"
-    depends on !BR2_LARGEFILE
+comment "tvheadend requires a toolchain with LARGEFILE and IPv6 support"
+    depends on !BR2_LARGEFILE || !BR2_INET_IPV6
 
 config BR2_PACKAGE_TVHEADEND
 	bool "tvheadend"
-	depends on BR2_LARGEFILE
+	depends on BR2_LARGEFILE && BR2_INET_IPV6
 	select BR2_PACKAGE_DVB_APPS
 	select BR2_PACKAGE_OPENSSL
 	help
