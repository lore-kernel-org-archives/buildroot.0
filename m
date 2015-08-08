From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:41 -0000
Subject: [Buildroot] [git commit branch/next] c-icap: fix config script
Message-ID: <20150808105640.C8C147FFCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c73215493335f1ede26cad2d3898ef543d871d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit adjusts the c-icap config script by removing a bogus
-L$LIBDIR which was expanded to -L/usr/lib, which is wrong for
cross-compilation. It fixes the build of c-icap-modules:

  http://autobuild.buildroot.org/results/b05/b05141a6d450c94669c6a0a5a0f5b799c2c248f2/

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/c-icap/c-icap.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index 0f42b6c..0e27cc4 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -57,6 +57,7 @@ define C_ICAP_TUNE_INSTALLATION
 		$(STAGING_DIR)/usr/bin/{c-icap,c-icap-libicapapi}-config
 	$(SED) 's%INCDIR2=.*%INCDIR2=$(STAGING_DIR)/usr/include/c_icap%' \
 		$(STAGING_DIR)/usr/bin/{c-icap,c-icap-libicapapi}-config
+	$(SED) 's%-L$$LIBDIR %%' $(STAGING_DIR)/usr/bin/c-icap-libicapapi-config
 endef
 
 C_ICAP_POST_INSTALL_TARGET_HOOKS += C_ICAP_TUNE_INSTALLATION
