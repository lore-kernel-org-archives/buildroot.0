From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 13:08:04 +0200
Subject: [Buildroot] [git commit] package/busybox: invert dependency with mtd
Message-ID: <20180708110810.A326B863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14a16b3bc6730eefc433c1ad8f399967168dbe04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk | 1 +
 package/mtd/mtd.mk         | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 451aae46a5..efb463554c 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_MTD),mtd) \
 	$(if $(BR2_PACKAGE_NET_TOOLS),net-tools) \
 	$(if $(BR2_PACKAGE_NETCAT),netcat) \
 	$(if $(BR2_PACKAGE_NETCAT_OPENSBSD),netcat-openbsd) \
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 83bd6a6ae9..13e501fc33 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -31,10 +31,6 @@ else
 MTD_CONF_OPTS += --disable-tests --disable-install-tests
 endif
 
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-MTD_DEPENDENCIES += busybox
-endif
-
 # If extended attributes are required, the acl package must
 # also be enabled which will also include the attr package.
 ifeq ($(BR2_PACKAGE_ACL),y)
