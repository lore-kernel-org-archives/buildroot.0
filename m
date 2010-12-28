From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 28 Dec 2010 20:35:40 +0100
Subject: [Buildroot] [git commit master 1/1] vtun: fix startup script
	installation
Message-ID: <20101228193702.A34AA8EB88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=58ddf43464ab3892d2af0c3973e6d9ef31653fdf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In case etc/init.d does not exist.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/vtun/vtun-3.0.2-001-Makefile.in.patch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/vtun/vtun-3.0.2-001-Makefile.in.patch b/package/vtun/vtun-3.0.2-001-Makefile.in.patch
index 063d4b3..1f93969 100644
--- a/package/vtun/vtun-3.0.2-001-Makefile.in.patch
+++ b/package/vtun/vtun-3.0.2-001-Makefile.in.patch
@@ -26,7 +26,7 @@ diff -urN vtun/Makefile.in vtun-2.6/Makefile.in
  	$(INSTALL) -d -m 755 $(INSTALL_OWNER) $(DESTDIR)$(LOCK_DIR)
  	$(INSTALL) -d -m 755 $(INSTALL_OWNER) $(DESTDIR)$(SBIN_DIR)
  	$(INSTALL) -m 755 $(INSTALL_OWNER) vtund $(DESTDIR)$(SBIN_DIR)
-+	$(INSTALL) -m 755 $(INSTALL_OWNER) scripts/vtund.rc.debian \
++	$(INSTALL) -m 755 -D $(INSTALL_OWNER) scripts/vtund.rc.debian \
 +		$(DESTDIR)$(ETC_DIR)/init.d/S90vtun
  
  # DO NOT DELETE THIS LINE -- make depend depends on it.
-- 
1.7.2.2
