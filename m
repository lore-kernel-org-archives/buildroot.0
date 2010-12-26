From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun, 26 Dec 2010 17:16:34 +0100
Subject: [Buildroot] [PATCH 1/3] vtun: fix startup script installation
In-Reply-To: <1293380196-22990-1-git-send-email-llandwerlin@gmail.com>
References: <1293380196-22990-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1293380196-22990-2-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

In case etc/init.d does not exist.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
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
1.7.2.3
