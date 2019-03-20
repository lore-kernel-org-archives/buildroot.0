From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 20 Mar 2019 20:10:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/jq: security bump to version 1.6
Message-ID: <20190320191001.6968-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fix CVE-2015-8863 and  CVE-2016-4074:
  https://github.com/stedolan/jq/issues/1406
- Add hash for license file
- Disable oniguruma (enabled by default)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jq/jq.hash | 3 ++-
 package/jq/jq.mk   | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/jq/jq.hash b/package/jq/jq.hash
index 2cd640563a..449619b024 100644
--- a/package/jq/jq.hash
+++ b/package/jq/jq.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256  c4d2bfec6436341113419debf479d833692cc5cdab7eb0326b5a4d4fbe9f493c  jq-1.5.tar.gz
+sha256  5de8c8e29aaa3fb9cc6b47bb27299f271354ebb72514e3accadc7d38b5bbaa72  jq-1.6.tar.gz
+sha256  111136aebcbfa68b6b0084e582b30e981da76adcff84eab6f9be32a1f38c5bf1  COPYING
diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index 79629faa5e..aebe8c86e4 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JQ_VERSION = 1.5
+JQ_VERSION = 1.6
 JQ_SITE = https://github.com/stedolan/jq/releases/download/jq-$(JQ_VERSION)
 JQ_LICENSE = MIT (code), CC-BY-3.0 (documentation)
 JQ_LICENSE_FILES = COPYING
@@ -17,8 +17,8 @@ JQ_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99 -D_GNU_SOURCE"
 HOST_JQ_CONF_ENV += CFLAGS="$(HOST_CFLAGS) -std=c99 -D_GNU_SOURCE"
 
 # jq explicitly enables maintainer mode, which we don't need/want
-JQ_CONF_OPTS += --disable-maintainer-mode
-HOST_JQ_CONF_OPTS += --disable-maintainer-mode
+JQ_CONF_OPTS += --disable-maintainer-mode --without-oniguruma
+HOST_JQ_CONF_OPTS += --disable-maintainer-mode --without-oniguruma
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.14.1
