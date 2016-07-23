From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 23 Jul 2016 13:03:32 -0300
Subject: [Buildroot] [PATCH] stunnel: security bump to version 5.35
Message-ID: <1469289812-15705-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
TLS session caching memory leak
Malfunctioning "verify = 4"

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/stunnel/stunnel.hash | 4 ++--
 package/stunnel/stunnel.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index 3f0d6e5..abea1a2 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,2 +1,2 @@
-# From http://www.stunnel.org/pipermail/stunnel-announce/2016-March/000120.html
-sha256	a746b71ab3dc6c23eacb0daf7342467870e43ac933430905eb1b1d050bbae0b7	stunnel-5.31.tar.gz
+# From http://www.stunnel.org/pipermail/stunnel-announce/2016-July/000124.html
+sha256	ffa386ae4c825f35f35157c285e7402a6d58779ad8c3822f74a9d355b54aba1d	stunnel-5.35.tar.gz
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index a222a1c..ab4457e 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).31
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).35
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
-- 
2.7.3
