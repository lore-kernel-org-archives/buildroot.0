From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Dec 2013 13:28:00 -0300
Subject: [Buildroot] [PATCH] gnutls: revert bump
Message-ID: <1386088080-4286-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Revert bump to 3.2.7 from commit 8238e744b813e9922c0a81f21b271263ef0e216a
It causes build issues because of an internal gnulib bump:
http://autobuild.buildroot.net/results/48d/48d5c6364fec55e84309b2fb6986f206699f1800/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnutls/gnutls.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 8a7f3f7..8ab0665 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUTLS_VERSION = 3.2.7
+GNUTLS_VERSION = 3.2.6
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v3.2
 GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
-- 
1.8.3.2
