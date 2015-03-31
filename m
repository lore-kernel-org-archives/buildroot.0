From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 31 Mar 2015 07:59:20 -0300
Subject: [Buildroot] [PATCH] polarssl: switch download URL
Message-ID: <1427799560-9170-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Old wget versions aren't very happy with https moves/alt names hence
complain when trying to download from said sites.
Since polarssl is now mbed tls and everything got renamed switch to the
new URL to avoid this.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/polarssl/Config.in   | 2 +-
 package/polarssl/polarssl.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/polarssl/Config.in b/package/polarssl/Config.in
index 90788d8..17125a3 100644
--- a/package/polarssl/Config.in
+++ b/package/polarssl/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_POLARSSL
 	  use it in your own proprietary applications, you have to
 	  purchase a commercial license.
 
-	  http://polarssl.org/
+	  https://tls.mbed.org/
 
 if BR2_PACKAGE_POLARSSL
 
diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index 83e1851..ebd0651 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POLARSSL_SITE = https://polarssl.org/code/releases
+POLARSSL_SITE = https://tls.mbed.org/code/releases
 POLARSSL_VERSION = 1.2.13
 POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
 POLARSSL_CONF_OPTS = \
-- 
2.0.5
