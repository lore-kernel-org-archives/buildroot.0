From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:39 -0300
Subject: [Buildroot] [PATCH 32/51] gadgetfs-test: use $(TARGET_MAKE_ENV)
	when calling $(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-33-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
-- 
2.7.3
