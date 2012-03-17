From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Mar 2012 09:15:57 +0100
Subject: [Buildroot] [git commit] vsftpd: fix SSL dependency
Message-ID: <20120317081647.5C49E90E36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cfb5fd9e10b1efeed316ed2cce2be1623c1efe65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/vsftpd/vsftpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 8d3a01e..3c9aa65 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -14,7 +14,7 @@ endef
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 VSFTPD_DEPENDENCIES += openssl
-VSFTPD_LIBS += -lssl
+VSFTPD_LIBS += -lssl -lcrypto
 VSFTPD_POST_CONFIGURE_HOOKS += VSFTPD_ENABLE_SSL
 endif
 
