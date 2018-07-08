From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 13:08:05 +0200
Subject: [Buildroot] [git commit] package/busybox: invert dependency with
 grep
Message-ID: <20180708110811.112A7863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3fa18f1a440ac484ef8ab84f1cf2417e2f6f02ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk | 1 +
 package/grep/grep.mk       | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index b00341c576..f614576de7 100644
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
