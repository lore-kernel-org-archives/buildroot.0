From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 18 Mar 2019 22:41:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/keepalived: drop autoreconf
Message-ID: <20190318214103.2240-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 78d4ddbf3b416885d2e99b32363b174755f9bb30 removed all patches so
autoreconf is not needed anymore

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/keepalived/keepalived.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index 037da2b0aa..5efdcc7831 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -10,8 +10,6 @@ KEEPALIVED_DEPENDENCIES = host-pkgconf openssl
 KEEPALIVED_LICENSE = GPL-2.0+
 KEEPALIVED_LICENSE_FILES = COPYING
 KEEPALIVED_CONF_OPTS = --disable-hardening
-# We're patching configure.ac
-KEEPALIVED_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 KEEPALIVED_DEPENDENCIES += json-c
-- 
2.14.1
