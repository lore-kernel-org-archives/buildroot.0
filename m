From: Martin Bark <martin@barkynet.com>
Date: Fri,  3 Jun 2016 20:15:45 +0100
Subject: [Buildroot] [PATCH 3/4] package/nodejs: Update openssl to use
	NODEJS_CONF_OPTS
In-Reply-To: <1464981346-11741-1-git-send-email-martin@barkynet.com>
References: <1464981346-11741-1-git-send-email-martin@barkynet.com>
Message-ID: <1464981346-11741-3-git-send-email-martin@barkynet.com>
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
index e5844b0..aff73e8 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -21,6 +21,9 @@ NODEJS_CONF_OPTS = --without-snapshot \
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 NODEJS_DEPENDENCIES += openssl
+NODEJS_CONF_OPTS += --shared-openssl
+else
+NODEJS_CONF_OPTS += --without-ssl
 endif
 
 ifeq ($(BR2_PACKAGE_ICU),y)
@@ -106,7 +109,6 @@ define NODEJS_CONFIGURE_CMDS
 		PYTHON=$(HOST_DIR)/usr/bin/python2 \
 		$(HOST_DIR)/usr/bin/python2 ./configure \
 		--prefix=/usr \
-		$(if $(BR2_PACKAGE_OPENSSL),--shared-openssl,--without-ssl) \
 		$(if $(BR2_PACKAGE_NODEJS_NPM),,--without-npm) \
 		--dest-cpu=$(NODEJS_CPU) \
 		$(if $(NODEJS_ARM_FP),--with-arm-float-abi=$(NODEJS_ARM_FP)) \
-- 
2.7.4
