From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  5 Feb 2013 10:49:54 -0300
Subject: [Buildroot] [PATCH] gnutls: tools require the package
Message-ID: <1360072194-22109-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From incomplete revert commit 68c3f5257d94d0fc0437747014f3c1ff4d02aa8b

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnutls/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index 3a34c48..25cd552 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_GNUTLS
 
 config BR2_PACKAGE_GNUTLS_TOOLS
 	bool "install tools"
+	depends on BR2_PACKAGE_GNUTLS
 	depends on BR2_USE_WCHAR
 	help
 	  Install GnuTLS command line tools for various cryptographic tasks.
-- 
1.7.12.4
