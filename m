From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 May 2016 20:54:27 +0200
Subject: [Buildroot] [git commit] package/mtr: uses fork(), needs mmu
Message-ID: <20160517185650.80A73807E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a4cc78bb7d5ae3ab45f0593503549ac4fa594ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/dcb/dcbd39878b1a80d6a16032e967bd8e2b928f7a78/
http://autobuild.buildroot.net/results/e05/e05632e0b160ee995ce46aaf3ceddf46d3658adf/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtr/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mtr/Config.in b/package/mtr/Config.in
index 5e2d5b2..ec83e25 100644
--- a/package/mtr/Config.in
+++ b/package/mtr/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MTR
 	bool "mtr"
+	depends on BR2_USE_MMU # fork()
 	help
 	  mtr combines the functionality of the 'traceroute' and 'ping'
 	  programs in a single network diagnostic tool.
