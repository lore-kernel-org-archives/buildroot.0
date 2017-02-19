From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Feb 2017 23:01:24 +0100
Subject: [Buildroot] [git commit] cjson: do not build tests
Message-ID: <20170301170422.8CB3E80279@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0cb7dfc6f511482e6120d90275365888b9b4080
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cjson/cjson.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 5ff990e..aea9578 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -9,5 +9,7 @@ CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
 CJSON_LICENSE_FILES = LICENSE
+CJSON_CONF_OPTS += \
+	-DENABLE_CJSON_TEST=OFF
 
 $(eval $(cmake-package))
