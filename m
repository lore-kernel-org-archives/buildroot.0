From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:17:10 -0000
Subject: [Buildroot] [git commit] package/tini: needs MMU
Message-ID: <20180907111558.037AA7FD5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8974192b7486f9d404f471d970eb802a4c1ce258
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tini uses fork(), so needs an MMU.

Fixes:
    http://autobuild.buildroot.org/results/410/410ad9ea6a6652a7db691f537acb38db279b996a/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tini/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tini/Config.in b/package/tini/Config.in
index 235fc1a8fb..719e1e1f22 100644
--- a/package/tini/Config.in
+++ b/package/tini/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TINI
 	bool "tini"
+	depends on BR2_USE_MMU # fork()
 	help
 	  tini is a simple but valid init binary to
 	  act as PID 1 for containers.
