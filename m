From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Oct 2013 18:30:46 -0300
Subject: [Buildroot] [PATCH 8/8] vde2: needs mmu
In-Reply-To: <1381354246-29140-1-git-send-email-gustavo@zacarias.com.ar>
References: <1381354246-29140-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1381354246-29140-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/vde2/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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
-- 
1.8.1.5
