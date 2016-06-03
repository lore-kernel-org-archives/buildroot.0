From: Martin Bark <martin@barkynet.com>
Date: Fri,  3 Jun 2016 20:15:44 +0100
Subject: [Buildroot] [PATCH 2/4] package/nodejs: Update icu to use
	NODEJS_CONF_OPTS
In-Reply-To: <1464981346-11741-1-git-send-email-martin@barkynet.com>
References: <1464981346-11741-1-git-send-email-martin@barkynet.com>
Message-ID: <1464981346-11741-2-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/nodejs/nodejs.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index b78ba79..e5844b0 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -25,6 +25,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_ICU),y)
 NODEJS_DEPENDENCIES += icu
+NODEJS_CONF_OPTS += --with-intl=system-icu
+else
+NODEJS_CONF_OPTS += --with-intl=none
 endif
 
 # nodejs build system is based on python, but only support python-2.6 or
@@ -104,7 +107,6 @@ define NODEJS_CONFIGURE_CMDS
 		$(HOST_DIR)/usr/bin/python2 ./configure \
 		--prefix=/usr \
 		$(if $(BR2_PACKAGE_OPENSSL),--shared-openssl,--without-ssl) \
-		$(if $(BR2_PACKAGE_ICU),--with-intl=system-icu,--with-intl=none) \
 		$(if $(BR2_PACKAGE_NODEJS_NPM),,--without-npm) \
 		--dest-cpu=$(NODEJS_CPU) \
 		$(if $(NODEJS_ARM_FP),--with-arm-float-abi=$(NODEJS_ARM_FP)) \
-- 
2.7.4
