From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Oct 2013 18:30:40 -0300
Subject: [Buildroot] [PATCH 2/8] vtun: needs mmu
In-Reply-To: <1381354246-29140-1-git-send-email-gustavo@zacarias.com.ar>
References: <1381354246-29140-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1381354246-29140-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/vtun/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/vtun/Config.in b/package/vtun/Config.in
index fe1f0d0..c1f6d38 100644
--- a/package/vtun/Config.in
+++ b/package/vtun/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_VTUN
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
+	depends on BR2_USE_MMU # fork()
 	help
 	  Tool for easily creating Virtual Tunnels over TCP/IP networks
 	  with traffic shaping, compression, and encryption.
-- 
1.8.1.5
