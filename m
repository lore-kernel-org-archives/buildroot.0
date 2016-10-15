From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:17:20 +0200
Subject: [Buildroot] [git commit] feh: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161015121835.D524781F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be4a6bb3a334bc00ce2bf8ee2414f9b5e9a802ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/feh/feh.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 0d5da06..03651cd 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -12,12 +12,12 @@ FEH_LICENSE = MIT
 FEH_LICENSE_FILES = COPYING
 
 define FEH_BUILD_CMDS
-	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
+	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
 		-C $(@D) all
 endef
 
 define FEH_INSTALL_TARGET_CMDS
-	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) " \
+	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) " \
 		PREFIX=/usr DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
