From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Oct 2010 12:08:55 +0200
Subject: [Buildroot] [git commit master 1/1] hdparm: needs largefile support
Message-ID: <20101005101042.40C6D8B865@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c1d0fae7d0226f044ffab26965213d9785deca27
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/hdparm/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/hdparm/Config.in b/package/hdparm/Config.in
index 1b57439..32bd247 100644
--- a/package/hdparm/Config.in
+++ b/package/hdparm/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_HDPARM
 	bool "hdparm"
+	depends on BR2_LARGEFILE
 	help
 	  hdparm - get/set hard disk parameters for Linux IDE drives.
 
 	  http://www.ibiblio.org/pub/Linux/system/hardware/
+
+comment "hdparm requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
-- 
1.7.1
