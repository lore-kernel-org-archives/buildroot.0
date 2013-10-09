From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Oct 2013 18:30:44 -0300
Subject: [Buildroot] [PATCH 6/8] xl2tp: needs mmu
In-Reply-To: <1381354246-29140-1-git-send-email-gustavo@zacarias.com.ar>
References: <1381354246-29140-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1381354246-29140-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/xl2tp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xl2tp/Config.in b/package/xl2tp/Config.in
index 8f9d9b1..7e2d2f6 100644
--- a/package/xl2tp/Config.in
+++ b/package/xl2tp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XL2TP
 	bool "xl2tp"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBPCAP
 	help
 	  Layer 2 Tunnelling Protocol (RFC2661).
-- 
1.8.1.5
