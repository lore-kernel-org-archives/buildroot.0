From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Oct 2010 17:36:01 +0200
Subject: [Buildroot] [git commit master 1/1] vsftpd: fix build when libcap
	is enabled
Message-ID: <20101018153622.05D6A8D2FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e46016ad3b46b791676397365f99653b2add38d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/vsftpd/vsftpd.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index c8c68d2..64a56cc 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -19,6 +19,11 @@ VSFTPD_LIBS += -lssl
 VSFTPD_POST_CONFIGURE_HOOKS += VSFTPD_ENABLE_SSL
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+VSFTPD_DEPENDENCIES += libcap
+VSFTPD_LIBS += -lcap
+endif
+
 define VSFTPD_BUILD_CMDS
 	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" LIBS="$(VSFTPD_LIBS)" -C $(@D)
-- 
1.7.1
