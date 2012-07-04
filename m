From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 4 Jul 2012 14:52:27 +0200
Subject: [Buildroot] [git commit] bonnie: needs MMU
Message-ID: <20120704125534.C248B8010E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=528607d04cb5ecbf367fa30a17481b0dded55ceb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/08cc7fdf21f8e51b793c0cf7a51b3f190ea7668c/build-end.log

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bonnie/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/bonnie/Config.in b/package/bonnie/Config.in
index 9dda4b6..91b1e96 100644
--- a/package/bonnie/Config.in
+++ b/package/bonnie/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_BONNIE
 	bool "bonnie++"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
 	help
 	  Filesystem tester
 
