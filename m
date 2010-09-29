From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 Sep 2010 14:47:04 +0200
Subject: [Buildroot] [git commit master 1/1] dosfstools: needs largefile
	support
Message-ID: <20100929124804.B6E328B7A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7477b474da77e2a3d2bf75c3b6a75c2bf865bc51
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dosfstools/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/dosfstools/Config.in b/package/dosfstools/Config.in
index 4906fff..1b92026 100644
--- a/package/dosfstools/Config.in
+++ b/package/dosfstools/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DOSFSTOOLS
 	bool "dosfstools"
+	depends on BR2_LARGEFILE
 	help
 	  Tools for creating and checking DOS FAT filesystems.
 
@@ -22,3 +23,6 @@ config BR2_PACKAGE_DOSFSTOOLS_DOSFSLABEL
 	depends on BR2_PACKAGE_DOSFSTOOLS
 	help
 	  Get or set the DOS FAT filesystem label.
+
+comment "dosfstools requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
-- 
1.7.1
