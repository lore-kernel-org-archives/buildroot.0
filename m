From: erico.nunes <erico.nunes@datacom.ind.br>
Date: Tue, 20 Jan 2015 16:54:33 -0200
Subject: [Buildroot] [PATCH 1/1] gtest: install libgtest_main to staging
Message-ID: <1421780073-16345-1-git-send-email-erico.nunes@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gtest provides a separate libgtest_main library with a default main()
implementation for tests with basic needs.
This separate library isn't being installed by buildroot. This patch
adds the installation of this library to staging during the install of
gtest.

Signed-off-by: erico.nunes <erico.nunes@datacom.ind.br>
---
 package/gtest/gtest.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 3f3e889..7129c93 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -27,6 +27,7 @@ endef
 
 define GTEST_INSTALL_STAGING_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/libgtest.a $(STAGING_DIR)/usr/lib/libgtest.a
+	$(INSTALL) -D -m 0755 $(@D)/libgtest_main.a $(STAGING_DIR)/usr/lib/libgtest_main.a
 	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gtest/
 	cp -rp $(@D)/include/gtest/* $(STAGING_DIR)/usr/include/gtest/
 endef
-- 
1.9.1
