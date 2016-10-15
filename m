From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:17:22 +0200
Subject: [Buildroot] [git commit] gadgetfs-test: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121835.DF19B81F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a441c8ab4c64c2be599880aa6bba7f3931c52664
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gadgetfs-test/gadgetfs-test.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gadgetfs-test/gadgetfs-test.mk b/package/gadgetfs-test/gadgetfs-test.mk
index 655f50a..ca47738 100644
--- a/package/gadgetfs-test/gadgetfs-test.mk
+++ b/package/gadgetfs-test/gadgetfs-test.mk
@@ -15,11 +15,11 @@ GADGETFS_TEST_MAKEOPTS += USE_AIO=y
 endif
 
 define GADGETFS_TEST_BUILD_CMDS
-	$(MAKE) -C $(@D) $(GADGETFS_TEST_MAKEOPTS)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(GADGETFS_TEST_MAKEOPTS)
 endef
 
 define GADGETFS_TEST_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) prefix=/usr install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) prefix=/usr install
 endef
 
 $(eval $(generic-package))
