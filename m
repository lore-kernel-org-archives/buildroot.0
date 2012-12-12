From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Dec 2012 08:45:48 -0300
Subject: [Buildroot] [PATCH] boa: needs MMU
Message-ID: <1355312748-20664-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/0909856aea5ea5d13206c9a46b8b5174661239b4/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/boa/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/boa/Config.in b/package/boa/Config.in
index 48943ff..982833a 100644
--- a/package/boa/Config.in
+++ b/package/boa/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_BOA
 	bool "boa"
+	depends on BR2_USE_MMU # uses fork()
 	help
 	  A very small and very fast http daemon.  Not intended as
 	  a feature-packed server.
-- 
1.7.8.6
