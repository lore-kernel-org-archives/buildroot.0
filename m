From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 May 2012 11:39:05 +0200
Subject: [Buildroot] [git commit] libmad: unbreak after 5d6f32878f7 (move
	audio libraries out)
Message-ID: <20120506094021.6943996A19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b3ffb2aaaa3931f8e2039c3f95f1c2c65093bff9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libmad is no longer in package/multimeda, so adjust .pc handling to match.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libmad/libmad.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
index a469fec..6e53cf2 100644
--- a/package/libmad/libmad.mk
+++ b/package/libmad/libmad.mk
@@ -15,12 +15,12 @@ define LIBMAD_PREVENT_AUTOMAKE
 endef
 
 define LIBMAD_INSTALL_STAGING_PC
-	$(INSTALL) -D package/multimedia/libmad/mad.pc \
+	$(INSTALL) -D package/libmad/mad.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/mad.pc
 endef
 
 define LIBMAD_INSTALL_TARGET_PC
-	$(INSTALL) -D package/multimedia/libmad/mad.pc \
+	$(INSTALL) -D package/libmad/mad.pc \
 		$(TARGET_DIR)/usr/lib/pkgconfig/mad.pc
 endef
 
