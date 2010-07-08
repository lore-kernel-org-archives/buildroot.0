From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Jul 2010 13:57:12 +0200
Subject: [Buildroot] [git commit master 1/1] libsvgtiny: needs
	host-pkg-config
Message-ID: <20100708115827.4E7978269B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0faf47206c87b7537d8c862a96bf09fd28ab2497
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The makefile uses pkg-config for libxml2 support.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libsvgtiny/libsvgtiny.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index ed73195..b559e52 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -10,7 +10,7 @@ LIBSVGTINY_SVNDIR = libsvgtiny-svn-r$(LIBSVGTINY_VERSION)
 LIBSVGTINY_SOURCE = $(LIBSVGTINY_SVNDIR).tar.bz2
 LIBSVGTINY_INSTALL_STAGING = YES
 LIBSVGTINY_INSTALL_TARGET = YES
-LIBSVGTINY_DEPENDENCIES = libxml2 host-gperf
+LIBSVGTINY_DEPENDENCIES = libxml2 host-gperf host-pkg-config
 
 $(DL_DIR)/$(LIBSVGTINY_SOURCE):
 	$(SVN_CO) -r $(LIBSVGTINY_VERSION) $(LIBSVGTINY_SITE) $(BUILD_DIR)/$(LIBSVGTINY_SVNDIR)
-- 
1.7.1
