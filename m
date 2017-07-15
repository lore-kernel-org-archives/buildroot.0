From: Martin Bark <martin@barkynet.com>
Date: Sat, 15 Jul 2017 18:38:28 +0100
Subject: [Buildroot] [PATCH 2/3] package/nodejs: use shared libhttpparser if
	available
In-Reply-To: <1500140309-26534-1-git-send-email-martin@barkynet.com>
References: <1500140309-26534-1-git-send-email-martin@barkynet.com>
Message-ID: <1500140309-26534-2-git-send-email-martin@barkynet.com>
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
index a469153..ba7ad3f 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -39,6 +39,11 @@ NODEJS_DEPENDENCIES += c-ares
 NODEJS_CONF_OPTS += --shared-cares
 endif
 
+ifeq ($(BR2_PACKAGE_LIBHTTPPARSER),y)
+NODEJS_DEPENDENCIES += libhttpparser
+NODEJS_CONF_OPTS += --shared-http-parser
+endif
+
 ifneq ($(BR2_PACKAGE_NODEJS_NPM),y)
 NODEJS_CONF_OPTS += --without-npm
 endif
-- 
2.7.4
