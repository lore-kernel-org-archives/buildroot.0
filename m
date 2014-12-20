From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Dec 2014 15:59:01 +0100
Subject: [Buildroot] [git commit] json-c: change upstream location to Github
Message-ID: <20141220145945.BBC2A8055C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3abcdc5cd31b8a72ec92fbfcafb04c38a2706ffd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

json-c website and download locations have changed, the project is now
hosted on Github.

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/json-c/Config.in |    2 +-
 package/json-c/json-c.mk |    4 ++--
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
