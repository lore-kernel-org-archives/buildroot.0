From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Oct 2013 17:25:47 -0300
Subject: [Buildroot] [PATCH 6/7] mrouted: needs mmu
In-Reply-To: <1381350348-25751-1-git-send-email-gustavo@zacarias.com.ar>
References: <1381350348-25751-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1381350348-25751-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mrouted/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mrouted/Config.in b/package/mrouted/Config.in
index 1503cc6..bf4614d 100644
--- a/package/mrouted/Config.in
+++ b/package/mrouted/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MROUTED
 	bool "mrouted"
+	depends on BR2_USE_MMU # fork()
 	help
 	  An implementation of the DVMRP multicast routing protocol.
 
-- 
1.8.1.5
