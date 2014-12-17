From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 17 Dec 2014 22:09:03 +0100
Subject: [Buildroot] [PATCH 1/1] json-c : moved to github
Message-ID: <1418850543-20668-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

json-c website and download locations have changed.
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/json-c/Config.in | 2 +-
 package/json-c/json-c.mk | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/json-c/Config.in b/package/json-c/Config.in
index dbdd75b..67348fb 100644
--- a/package/json-c/Config.in
+++ b/package/json-c/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_JSON_C
 	  them as JSON formatted strings and parse JSON formatted
 	  strings back into the C representation of JSON objects.
 
-	  http://oss.metaparadigm.com/json-c/
+	  https://github.com/json-c/json-c/
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index dfce96f..b8212ca 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-JSON_C_VERSION = 0.11
-JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases
+JSON_C_VERSION = json-c-0.11-20130402
+JSON_C_SITE = $(call github,json-c,json-c,$(JSON_C_VERSION))
 JSON_C_INSTALL_STAGING = YES
 JSON_C_MAKE = $(MAKE1)
 JSON_C_CONF_OPTS = --disable-oldname-compat
-- 
2.1.3
