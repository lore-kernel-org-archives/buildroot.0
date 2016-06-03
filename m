From: Martin Bark <martin@barkynet.com>
Date: Fri,  3 Jun 2016 20:15:46 +0100
Subject: [Buildroot] [PATCH 4/4] package/nodejs: Update npm to use
	NODEJS_CONF_OPTS
In-Reply-To: <1464981346-11741-1-git-send-email-martin@barkynet.com>
References: <1464981346-11741-1-git-send-email-martin@barkynet.com>
Message-ID: <1464981346-11741-4-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/nodejs/nodejs.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index aff73e8..f8f819f 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -33,6 +33,10 @@ else
 NODEJS_CONF_OPTS += --with-intl=none
 endif
 
+ifneq ($(BR2_PACKAGE_NODEJS_NPM),y)
+NODEJS_CONF_OPTS += --without-npm
+endif
+
 # nodejs build system is based on python, but only support python-2.6 or
 # python-2.7. So, we have to enforce PYTHON interpreter to be python2.
 define HOST_NODEJS_CONFIGURE_CMDS
@@ -109,7 +113,6 @@ define NODEJS_CONFIGURE_CMDS
 		PYTHON=$(HOST_DIR)/usr/bin/python2 \
 		$(HOST_DIR)/usr/bin/python2 ./configure \
 		--prefix=/usr \
-		$(if $(BR2_PACKAGE_NODEJS_NPM),,--without-npm) \
 		--dest-cpu=$(NODEJS_CPU) \
 		$(if $(NODEJS_ARM_FP),--with-arm-float-abi=$(NODEJS_ARM_FP)) \
 		$(if $(NODEJS_MIPS_ARCH_VARIANT),--with-mips-arch-variant=$(NODEJS_MIPS_ARCH_VARIANT)) \
-- 
2.7.4
