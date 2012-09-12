From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 13 Sep 2012 00:19:43 +0200
Subject: [Buildroot] [git commit] vsftpd: add linux-pam support
Message-ID: <20120913051437.DD75C99637@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d7f8dda7c07dd5eaddc1f0e2fa4d7426e673f8ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/vsftpd/vsftpd.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index ca711bb..ce042c5 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -23,6 +23,11 @@ VSFTPD_DEPENDENCIES += libcap
 VSFTPD_LIBS += -lcap
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+VSFTPD_DEPENDENCIES += linux-pam
+VSFTPD_LIBS += -lpam
+endif
+
 define VSFTPD_BUILD_CMDS
 	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" LIBS="$(VSFTPD_LIBS)" -C $(@D)
