From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Sep 2013 16:48:23 +0200
Subject: [Buildroot] [git commit] socat: needs mmu
Message-ID: <20130926151558.DE8949B892@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4cb5ec7c6cf1ac7360f12dd079eec069d2996aec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/socat/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/socat/Config.in b/package/socat/Config.in
index c478282..ec69c96 100644
--- a/package/socat/Config.in
+++ b/package/socat/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SOCAT
 	bool "socat"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	help
 	  Multipurpose socket relay program.
 
