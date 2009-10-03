From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Oct 2009 23:05:58 +0200
Subject: [Buildroot] [git commit master] vsftpd: create .configured stamp
	file
Message-ID: <20091003210638.10327776F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3a24e0385b5c72348cf2c6d3792d98fe90b31605
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ensures that the configure+make steps are not run every time.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/vsftpd/vsftpd.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index ed35d5f..3b1d7eb 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -42,10 +42,12 @@ endif
 else # not uclibc
 	$(SED) 's,.*__UCLIBC_.*,,g' $(VSFTPD_DIR)/builddefs.h
 endif
+	touch $@
 
 
 $(VSFTPD_DIR)/$(VSFTPD_BINARY): $(VSFTPD_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" LIBS="$(VSFTPD_LIBS)" -C $(VSFTPD_DIR)
+	touch -c $@
 
 $(TARGET_DIR)/$(VSFTPD_TARGET_BINARY): $(VSFTPD_DIR)/$(VSFTPD_BINARY)
 	cp -dpf $< $@
-- 
1.6.3.3
