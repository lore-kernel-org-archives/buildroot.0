From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 23 May 2013 22:34:14 +0200
Subject: [Buildroot] [git commit] tvheadend: needs threads
Message-ID: <20130523205042.31E709A4E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f937306ead7605c1c8a9360503d1a5f92202c229
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tvheadend/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 19ab276..7083b01 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -1,9 +1,10 @@
-comment "tvheadend requires a toolchain with LARGEFILE and IPv6 support"
-    depends on !BR2_LARGEFILE || !BR2_INET_IPV6
+comment "tvheadend needs a toolchain with LARGEFILE, IPv6 and THREADS support"
+    depends on !BR2_LARGEFILE || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_TVHEADEND
 	bool "tvheadend"
 	depends on BR2_LARGEFILE && BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# tvheadend requires an atomic_add operation. Either you have
 	# a gcc >= 4.3 toolchain and it uses the gcc intrinsics, or it
 	# has special code for x86, x86-64, PPC and ARM. So in the
