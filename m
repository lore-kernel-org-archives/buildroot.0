From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 21 Nov 2018 22:16:11 +0100
Subject: [Buildroot] [PATCH/next 2/2] keepalived: enable hardening option
In-Reply-To: <20181121211611.8521-1-fontaine.fabrice@gmail.com>
References: <20181121211611.8521-1-fontaine.fabrice@gmail.com>
Message-ID: <20181121211611.8521-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable or disable hardening option depending on BR2_TOOLCHAIN_HAS_SSP

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/keepalived/keepalived.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index 584da6bb48..f9049bf391 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -9,7 +9,12 @@ KEEPALIVED_SITE = http://www.keepalived.org/software
 KEEPALIVED_DEPENDENCIES = host-pkgconf openssl
 KEEPALIVED_LICENSE = GPL-2.0+
 KEEPALIVED_LICENSE_FILES = COPYING
-KEEPALIVED_CONF_OPTS = --disable-hardening
+
+ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
+KEEPALIVED_CONF_OPTS += --enable-hardening
+else
+KEEPALIVED_CONF_OPTS += --disable-hardening
+endif
 
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 KEEPALIVED_DEPENDENCIES += json-c
-- 
2.17.1
