From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  4 Jul 2015 09:32:30 -0300
Subject: [Buildroot] [PATCH] polarssl: security bump to version 1.2.14
Message-ID: <1436013150-29494-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes one remotely-triggerable issue that was found by the Codenomicon
Defensics tool, one potential remote crash and countermeasures against
the "Lucky 13 strikes back" cache-based attack.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/polarssl/polarssl.hash | 4 ++--
 package/polarssl/polarssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/polarssl/polarssl.hash b/package/polarssl/polarssl.hash
index d68185b..e7883fd 100644
--- a/package/polarssl/polarssl.hash
+++ b/package/polarssl/polarssl.hash
@@ -1,2 +1,2 @@
-# From https://polarssl.org/tech-updates/releases/polarssl-1.2.13-released
-sha256	62f44f2a9f39b5cefb229e5dd2644ca20ead477cb1843d6ff30671624315b021	polarssl-1.2.13-gpl.tgz
+# From https://polarssl.org/tech-updates/releases/polarssl-1.2.14-released
+sha256	d7cbd8314aa3a5441f6282d13d07df610f49b4bc678088b04188adf093d17d37	polarssl-1.2.14-gpl.tgz
diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index ebd0651..289a28d 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 POLARSSL_SITE = https://tls.mbed.org/code/releases
-POLARSSL_VERSION = 1.2.13
+POLARSSL_VERSION = 1.2.14
 POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
 POLARSSL_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_POLARSSL_PROGRAMS),ON,OFF)
-- 
2.3.6
