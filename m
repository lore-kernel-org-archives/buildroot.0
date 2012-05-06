From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 May 2012 20:08:50 +0200
Subject: [Buildroot] [git commit] wget: needs MMU
Message-ID: <20120506180941.995D88F738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=702c251d3c8268611da7a48746853d64b2a5a1d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wget/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/wget/Config.in b/package/wget/Config.in
index 3877a3a..3f79a64 100644
--- a/package/wget/Config.in
+++ b/package/wget/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_WGET
 	bool "wget"
+	# fork()
+	depends on BR2_USE_MMU
 	help
 	  Network utility to retrieve files from http, https and ftp.
 
