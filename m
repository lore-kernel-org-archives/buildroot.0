From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Apr 2014 21:51:26 +0200
Subject: [Buildroot] [git commit] lsof: needs mmu
Message-ID: <20140428195235.68BA79C961@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=484e11aafe1ec747d4b8d661ec83e697e20765ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/f03/f03fd887cfb353149d88c97afa380bd95d6315f1/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lsof/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/lsof/Config.in b/package/lsof/Config.in
index cc7512c..820cbf7 100644
--- a/package/lsof/Config.in
+++ b/package/lsof/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LSOF
 	bool "lsof"
+	depends on BR2_USE_MMU # fork()
 	help
 	  lsof (LiSt Open Files)
 	  The lsof tool lists information about files opened by
