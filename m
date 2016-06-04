From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jun 2016 14:32:16 +0200
Subject: [Buildroot] [git commit] package/nodejs: Update npm to use
	NODEJS_CONF_OPTS
Message-ID: <20160604123235.2D2648079A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a898d5de17f4b32ee29ff47734ff5717c6b40f03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nodejs/nodejs.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 0938652..efd9308 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -34,6 +34,10 @@ else
 NODEJS_CONF_OPTS += --with-intl=none
 endif
 
+ifneq ($(BR2_PACKAGE_NODEJS_NPM),y)
+NODEJS_CONF_OPTS += --without-npm
+endif
+
 # nodejs build system is based on python, but only support python-2.6 or
 # python-2.7. So, we have to enforce PYTHON interpreter to be python2.
 define HOST_NODEJS_CONFIGURE_CMDS
@@ -110,7 +114,6 @@ define NODEJS_CONFIGURE_CMDS
 		PYTHON=$(HOST_DIR)/usr/bin/python2 \
 		$(HOST_DIR)/usr/bin/python2 ./configure \
 		--prefix=/usr \
-		$(if $(BR2_PACKAGE_NODEJS_NPM),,--without-npm) \
 		--dest-cpu=$(NODEJS_CPU) \
 		$(if $(NODEJS_ARM_FP),--with-arm-float-abi=$(NODEJS_ARM_FP)) \
 		$(if $(NODEJS_MIPS_ARCH_VARIANT),--with-mips-arch-variant=$(NODEJS_MIPS_ARCH_VARIANT)) \
