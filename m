From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] binutils: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161022132038.939CD7F9EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99f1e508f07b3d8a1869fb5a87e4cd71d6747ca0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 966cc79..ca481d2 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -108,16 +108,16 @@ endef
 # We just want libbfd, libiberty and libopcodes,
 # not the full-blown binutils in staging
 define BINUTILS_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D)/bfd DESTDIR=$(STAGING_DIR) install
-	$(MAKE) -C $(@D)/opcodes DESTDIR=$(STAGING_DIR) install
-	$(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
 endef
 
 # If we don't want full binutils on target
 ifneq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
 define BINUTILS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(TARGET_DIR) install
-	$(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
 endef
 endif
 
