From: Martin Bark <martin@barkynet.com>
Date: Sat, 15 Jul 2017 18:38:29 +0100
Subject: [Buildroot] [PATCH 3/3] package/nodejs: use shared libuv if
	available
In-Reply-To: <1500140309-26534-1-git-send-email-martin@barkynet.com>
References: <1500140309-26534-1-git-send-email-martin@barkynet.com>
Message-ID: <1500140309-26534-3-git-send-email-martin@barkynet.com>
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
index ba7ad3f..d229d75 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -44,6 +44,11 @@ NODEJS_DEPENDENCIES += libhttpparser
 NODEJS_CONF_OPTS += --shared-http-parser
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUV),y)
+NODEJS_DEPENDENCIES += libuv
+NODEJS_CONF_OPTS += --shared-libuv
+endif
+
 ifneq ($(BR2_PACKAGE_NODEJS_NPM),y)
 NODEJS_CONF_OPTS += --without-npm
 endif
-- 
2.7.4
