From: Martin Bark <martin@barkynet.com>
Date: Sat, 15 Jul 2017 18:38:27 +0100
Subject: [Buildroot] [PATCH 1/3] package/nodejs: use shared c-ares if
	available
Message-ID: <1500140309-26534-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/nodejs/nodejs.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 43c5ff3..a469153 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -34,6 +34,11 @@ else
 NODEJS_CONF_OPTS += --with-intl=none
 endif
 
+ifeq ($(BR2_PACKAGE_C_ARES),y)
+NODEJS_DEPENDENCIES += c-ares
+NODEJS_CONF_OPTS += --shared-cares
+endif
+
 ifneq ($(BR2_PACKAGE_NODEJS_NPM),y)
 NODEJS_CONF_OPTS += --without-npm
 endif
-- 
2.7.4
