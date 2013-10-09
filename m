From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Oct 2013 16:49:37 -0300
Subject: [Buildroot] [PATCH 5/5] vpnc: needs mmu
In-Reply-To: <1381348177-2189-1-git-send-email-gustavo@zacarias.com.ar>
References: <1381348177-2189-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1381348177-2189-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/vpnc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/vpnc/Config.in b/package/vpnc/Config.in
index 9abc0c5..bc27331 100644
--- a/package/vpnc/Config.in
+++ b/package/vpnc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_VPNC
 	bool "vpnc"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGPG_ERROR
 	help
-- 
1.8.1.5
