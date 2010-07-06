From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Jul 2010 16:43:04 +0200
Subject: [Buildroot] [git commit master 1/1] libsvgtiny: needs gperf on the
	host
Message-ID: <20100706144330.269478257C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=94962bf597920eb3b9a29c4c20001278c6f536f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And fix the .mk file name while we're at it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libsvgtiny/{libsvtiny.mk => libsvgtiny.mk} |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
 rename package/libsvgtiny/{libsvtiny.mk => libsvgtiny.mk} (96%)

diff --git a/package/libsvgtiny/libsvtiny.mk b/package/libsvgtiny/libsvgtiny.mk
similarity index 96%
rename from package/libsvgtiny/libsvtiny.mk
rename to package/libsvgtiny/libsvgtiny.mk
index 57430fe..ca0d2c9 100644
--- a/package/libsvgtiny/libsvtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -10,7 +10,7 @@ LIBSVGTINY_SVNDIR = libsvgtiny-svn-r$(LIBSVGTINY_VERSION)
 LIBSVGTINY_SOURCE = $(LIBSVGTINY_SVNDIR).tar.bz2
 LIBSVGTINY_INSTALL_STAGING = YES
 LIBSVGTINY_INSTALL_TARGET = YES
-LIBSVGTINY_DEPENDENCIES = libxml2
+LIBSVGTINY_DEPENDENCIES = libxml2 host-gperf
 
 $(DL_DIR)/$(LIBSVGTINY_SOURCE):
 	$(SVN_CO) -r $(LIBSVGTINY_VERSION) $(LIBSVGTINY_SITE) $(BUILD_DIR)/$(LIBSVGTINY_SVNDIR)
-- 
1.7.1
