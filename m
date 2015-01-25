From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 18:45:20 +0100
Subject: [Buildroot] [git commit] gtest: install libgtest_main to staging
Message-ID: <20150125174532.2145C80462@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f846793386e1924c38b8926b0f74ee510001f97
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gtest provides a separate libgtest_main library with a default main()
implementation for tests with basic needs.
This separate library isn't being installed by buildroot. This patch
adds the installation of this library to staging during the install of
gtest.

Signed-off-by: Erico Nunes <erico.nunes@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gtest/gtest.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
