From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jun 2016 14:31:52 +0200
Subject: [Buildroot] [git commit] package/nodejs: Update icu to use
	NODEJS_CONF_OPTS
Message-ID: <20160604123235.123C58079A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be0d8ecc2762b3a2547b91cf8471c2a4c28cc942
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nodejs/nodejs.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index d2c5be4..68adbff 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -26,6 +26,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_ICU),y)
 NODEJS_DEPENDENCIES += icu
+NODEJS_CONF_OPTS += --with-intl=system-icu
+else
+NODEJS_CONF_OPTS += --with-intl=none
 endif
 
 # nodejs build system is based on python, but only support python-2.6 or
@@ -105,7 +108,6 @@ define NODEJS_CONFIGURE_CMDS
 		$(HOST_DIR)/usr/bin/python2 ./configure \
 		--prefix=/usr \
 		$(if $(BR2_PACKAGE_OPENSSL),--shared-openssl,--without-ssl) \
-		$(if $(BR2_PACKAGE_ICU),--with-intl=system-icu,--with-intl=none) \
 		$(if $(BR2_PACKAGE_NODEJS_NPM),,--without-npm) \
 		--dest-cpu=$(NODEJS_CPU) \
 		$(if $(NODEJS_ARM_FP),--with-arm-float-abi=$(NODEJS_ARM_FP)) \
