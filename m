From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 28 Apr 2016 21:59:31 +0200
Subject: [Buildroot] [PATCH] moarvm: use libtommath
Message-ID: <1461873571-26319-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/moarvm/Config.in | 1 +
 package/moarvm/moarvm.mk | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/moarvm/Config.in b/package/moarvm/Config.in
index 6bc3090..82e4509 100644
--- a/package/moarvm/Config.in
+++ b/package/moarvm/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_MOARVM
 	# needs AO_fetch_compare_and_swap, not implemented for sparcv9
 	depends on !BR2_sparc64
 	select BR2_PACKAGE_LIBUV
+	select BR2_PACKAGE_LIBTOMMATH
 	select BR2_PACKAGE_LIBATOMIC_OPS
 	help
 	  Short for "Metamodel On A Runtime", MoarVM is a virtual machine
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index 734c027..ee58f76 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -10,7 +10,7 @@ MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
 MOARVM_LICENSE_FILES = Artistic2.txt
 MOARVM_INSTALL_STAGING = YES
-MOARVM_DEPENDENCIES = host-luajit libuv libatomic_ops
+MOARVM_DEPENDENCIES = host-luajit libuv libtommath libatomic_ops
 
 MOARVM_CONF_OPTS = \
 	--build=$(GNU_HOST_NAME) \
@@ -21,6 +21,7 @@ MOARVM_CONF_OPTS = \
 	--prefix="/usr" \
 	--lua=$(HOST_DIR)/usr/bin/luajit \
 	--has-libuv \
+	--has-libtommath \
 	--has-libatomic
 
 ifeq ($(BR2_ENDIAN),"BIG")
-- 
2.5.0
