From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Fri, 17 Sep 2010 14:09:48 +0200
Subject: [Buildroot] [git commit master 1/1] Use the normal download method
	for Tremor
Message-ID: <20100917121159.EDCCA8B3CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=91f2599d9b9f069f719f5577ae44d987ccd58649
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the generic download method supports Subversion, fall back to
the normal usage of AUTOTARGETS for Tremor.

Signed-off-by: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/tremor/tremor.mk |   12 ++----------
 1 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/package/multimedia/tremor/tremor.mk b/package/multimedia/tremor/tremor.mk
index 74fd725..654a403 100644
--- a/package/multimedia/tremor/tremor.mk
+++ b/package/multimedia/tremor/tremor.mk
@@ -5,19 +5,11 @@
 ############################################################
 
 TREMOR_SITE:=http://svn.xiph.org/trunk/Tremor/
+TREMOR_SITE_METHOD:=svn
 TREMOR_VERSION:=16259
-TREMOR_SVNDIR = Tremor-svn-r$(TREMOR_VERSION)
-TREMOR_SOURCE:= $(TREMOR_SVNDIR).tar.bz2
+
 TREMOR_AUTORECONF = YES
 TREMOR_INSTALL_STAGING = YES
 TREMOR_INSTALL_TARGET = YES
 
-$(DL_DIR)/$(TREMOR_SOURCE):
-	$(SVN_CO) -r $(TREMOR_VERSION) $(TREMOR_SITE) $(BUILD_DIR)/$(TREMOR_SVNDIR)
-	tar -cv -C $(BUILD_DIR) $(TREMOR_SVNDIR) | bzip2 - -c > $@
-	rm -rf $(BUILD_DIR)/$(TREMOR_SVNDIR)
-
-# use custom download step
-TREMOR_TARGET_SOURCE := $(DL_DIR)/$(TREMOR_SOURCE)
-
 $(eval $(call AUTOTARGETS,package/multimedia,tremor))
-- 
1.7.1
