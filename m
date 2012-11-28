From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 28 Nov 2012 10:24:02 -0300
Subject: [Buildroot] [PATCH 1/2] hiawatha: needs mmu
Message-ID: <1354109043-12022-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/hiawatha/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/hiawatha/Config.in b/package/hiawatha/Config.in
index 431a9fa..ac0aa10 100644
--- a/package/hiawatha/Config.in
+++ b/package/hiawatha/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_HIAWATHA
 	bool "hiawatha"
+	# needs fork()
+	depends on BR2_USE_MMU
 	help
 	  Hiawatha is a webserver for Unix and has been built with
 	  security in mind. This resulted in a highly secure
-- 
1.7.8.6
