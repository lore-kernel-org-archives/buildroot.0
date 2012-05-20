From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 May 2012 19:50:52 +0200
Subject: [Buildroot] [git commit] cifs-utils: needs MMU
Message-ID: <20120520180450.AB41096D47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a89e0e8721a19b907d39afe75bdf3e9222a40976
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cifs-utils/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/cifs-utils/Config.in b/package/cifs-utils/Config.in
index 4331986..b433850 100644
--- a/package/cifs-utils/Config.in
+++ b/package/cifs-utils/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_CIFS_UTILS
 	bool "cifs-utils"
+	# uses fork()
+	depends on BR2_USE_MMU
 	help
 	  The in-kernel CIFS filesystem is generally the preferred
 	  method for mounting SMB/CIFS shares on Linux. The in-kernel
