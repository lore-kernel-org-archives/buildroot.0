From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 12 Aug 2012 13:01:16 -0400
Subject: [Buildroot] [PATCH 2/2] vsftpd: add linux-pam support
In-Reply-To: <1344790876-27962-1-git-send-email-danomimanchego123@gmail.com>
References: <1344790876-27962-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1344790876-27962-2-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/vsftpd/vsftpd.mk |    5 +++++
 1 file changed, 5 insertions(+)

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
-- 
1.7.9.5
