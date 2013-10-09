From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 23:40:29 +0200
Subject: [Buildroot] [git commit] vde2: needs mmu
Message-ID: <20131009214150.241F39B970@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=92af118d82a6031c7d9750959d6dc07a82a54ac4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vde2/Config.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/vde2/Config.in b/package/vde2/Config.in
index f069a79..2bbd822 100644
--- a/package/vde2/Config.in
+++ b/package/vde2/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_VDE2
 	bool "vde2"
+	depends on BR2_USE_MMU # fork()
 	help
 	  VDE is an ethernet compliant virtual network that can be
 	  spawned over a set of physical computers over the Internet.
 	  VDE is part of the virtualsquare project.
-	  
+
 	  http://vde.sourceforge.net/
