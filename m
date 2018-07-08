From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 13:08:05 +0200
Subject: [Buildroot] [git commit] package/busybox: invert dependency with
 fbset
Message-ID: <20180708110811.2321D863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef265261cfbd6c737faa984a7234279d0df1365e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk | 1 +
 package/fbset/fbset.mk     | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index aac31fdba7..a567f25231 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_FBSET),fbset) \
 	$(if $(BR2_PACKAGE_GAWK),gawk) \
 	$(if $(BR2_PACKAGE_GREP),grep) \
 	$(if $(BR2_PACKAGE_GZIP),gzip) \
diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
index d6ee104a22..787b4e1dca 100644
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -9,11 +9,6 @@ FBSET_SITE = http://users.telenet.be/geertu/Linux/fbdev
 FBSET_DEPENDENCIES = host-bison host-flex
 FBSET_LICENSE = GPL-2.0
 
-# Make sure full fbset wins over busybox fbset
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-FBSET_DEPENDENCIES += busybox
-endif
-
 define FBSET_BUILD_CMDS
 	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
