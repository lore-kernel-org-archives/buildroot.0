From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jun 2016 22:56:19 +0200
Subject: [Buildroot] [git commit] gtest: fix typo in .pc file installation
Message-ID: <20160624205705.0BD7782126@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db35305a99db516f54dbc9d73b75806b2b83e7ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/08e/08e1eb10f63f07378237ba72953d7201ea0786ab/build-end.log

Reported-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gtest/gtest.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index a4ef45b..11aa7e9 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -31,7 +31,7 @@ define GTEST_INSTALL_STAGING_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/libgtest_main.a $(STAGING_DIR)/usr/lib/libgtest_main.a
 	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gtest/
 	cp -rp $(@D)/include/gtest/* $(STAGING_DIR)/usr/include/gtest/
-	$(INSTALL) -D -m 0644 packages/gtest/gtest.pc \
+	$(INSTALL) -D -m 0644 package/gtest/gtest.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/gtest.pc
 	# Generate the gtest-config script manually, since the CMake
 	# build system is not doing it.
