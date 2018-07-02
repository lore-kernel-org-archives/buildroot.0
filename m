From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:12:10 +0200
Subject: [Buildroot] [PATCH 36/50] package/busybox: invert dependency with
 grep
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <61b441156c6b0edd3b79bf405df239f5d783614c.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk | 1 +
 package/grep/grep.mk       | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 5d28d9ee46..de9498ab64 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_GREP),grep) \
 	$(if $(BR2_PACKAGE_GZIP),gzip) \
 	$(if $(BR2_PACKAGE_I2C_TOOLS),i2c-tools) \
 	$(if $(BR2_PACKAGE_IFENSLAVE),ifenslave) \
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 6e44a189f0..730f36a344 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -25,9 +25,4 @@ else
 GREP_CONF_OPTS += --disable-perl-regexp
 endif
 
-# Full grep preferred over busybox grep
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-GREP_DEPENDENCIES += busybox
-endif
-
 $(eval $(autotools-package))
-- 
2.14.1
