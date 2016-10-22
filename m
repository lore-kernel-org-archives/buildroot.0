From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] libsepol: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161022132038.DFAF3819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d059e8cca6f784e7eae49a897ed96afde3aaec82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsepol/libsepol.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index 3b02175..650e36d 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -22,15 +22,15 @@ endif
 define LIBSEPOL_BUILD_CMDS
 	# DESTDIR is needed during the compile to compute library and
 	# header paths.
-	$(MAKE) -C $(@D) $(LIBSEPOL_MAKE_FLAGS) DESTDIR=$(STAGING_DIR)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBSEPOL_MAKE_FLAGS) DESTDIR=$(STAGING_DIR)
 endef
 
 define LIBSEPOL_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) install $(LIBSEPOL_MAKE_FLAGS) DESTDIR=$(STAGING_DIR)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install $(LIBSEPOL_MAKE_FLAGS) DESTDIR=$(STAGING_DIR)
 endef
 
 define LIBSEPOL_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) install $(LIBSEPOL_MAKE_FLAGS) DESTDIR=$(TARGET_DIR)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install $(LIBSEPOL_MAKE_FLAGS) DESTDIR=$(TARGET_DIR)
 endef
 
 define HOST_LIBSEPOL_BUILD_CMDS
