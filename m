From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Oct 2013 18:30:41 -0300
Subject: [Buildroot] [PATCH 3/8] samba: needs mmu
In-Reply-To: <1381354246-29140-1-git-send-email-gustavo@zacarias.com.ar>
References: <1381354246-29140-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1381354246-29140-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/samba/Config.in b/package/samba/Config.in
index a3218b5..5339d41 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SAMBA
 	bool "samba"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_POPT
 	help
 	  Provides print services to all manner of SMB/CIFS clients,
-- 
1.8.1.5
