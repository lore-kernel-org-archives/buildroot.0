From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 21 Jul 2009 22:57:29 +0200
Subject: [Buildroot] [git commit] tremor: provide libvorbis* alias for
	targets
Message-ID: <20090722055744.0AF6477420@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11eb084fc79a75395465a95facfc95bac395e4b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


several packages depend on libvorbis, so also provide libvorbis
targets when tremor is selected.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/libvorbis/libvorbis.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/multimedia/libvorbis/libvorbis.mk b/package/multimedia/libvorbis/libvorbis.mk
index 6f90408..a881726 100644
--- a/package/multimedia/libvorbis/libvorbis.mk
+++ b/package/multimedia/libvorbis/libvorbis.mk
@@ -83,15 +83,15 @@ $(TARGET_DIR)/usr/lib/tremor.a: $(TARGET_DIR)/usr/lib/tremor.so
 	cp -dpf $(TREMOR_DIR)/lib/tremor.a $(TARGET_DIR)/usr/lib/
 	touch $@
 
-tremor: uclibc host-pkgconfig host-autoconf host-automake libogg $(TARGET_DIR)/usr/lib/tremor.so
+tremor libvorbis: uclibc host-pkgconfig host-autoconf host-automake libogg $(TARGET_DIR)/usr/lib/tremor.so
 
-tremor-source: $(DL_DIR)/$(TREMOR_SOURCE)
+tremor-source libvorbis-source: $(DL_DIR)/$(TREMOR_SOURCE)
 
-tremor-clean:
+tremor-clean libvorbis-clean:
 	$(MAKE) prefix=$(STAGING_DIR)/usr -C $(TREMOR_DIR) uninstall
 	-$(MAKE) -C $(TREMOR_DIR) clean
 
-tremor-dirclean:
+tremor-dirclean libvorbis-dirclean:
 	rm -rf $(TREMOR_DIR)
 
 
-- 
1.6.3.3
