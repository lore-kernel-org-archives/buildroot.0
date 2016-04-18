From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 18 Apr 2016 11:48:13 -0300
Subject: [Buildroot] [PATCH 2/2] rp-pppoe: select pppd
In-Reply-To: <1460990893-10820-1-git-send-email-gustavo@zacarias.com.ar>
References: <1460990893-10820-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1460990893-10820-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There's no benefit on it being an autodep since it makes it harder to
find, and pppd can be selected directly.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rp-pppoe/Config.in | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/rp-pppoe/Config.in b/package/rp-pppoe/Config.in
index d37203c..7f6afe2 100644
--- a/package/rp-pppoe/Config.in
+++ b/package/rp-pppoe/Config.in
@@ -1,6 +1,12 @@
+comment "rp-pppoe needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_RP_PPPOE
 	bool "rp-pppoe"
-	depends on BR2_PACKAGE_PPPD
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_PPPD
 	help
 	  An implementation of the Point-to-point protocol over Ethernet.
 	  Has userspace client and server deamons. You likely only need
-- 
2.7.3
