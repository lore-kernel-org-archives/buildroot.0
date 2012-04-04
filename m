From: Markos Chandras <markos.chandras@imgtec.com>
Date: Wed, 4 Apr 2012 10:23:44 +0100
Subject: [Buildroot] [PATCH v2] rpm: Fix automagic dependency on openssl
Message-ID: <1333531424-32307-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/rpm/rpm.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 4d8fe21..50425a4 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -15,6 +15,7 @@ RPM_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/beecrypt -I
 RPM_CONF_OPT = --disable-build-versionscript --disable-rpath \
 	--without-selinux \
 	--without-python --without-perl \
+	--with-openssl=external \
 	--with-zlib=$(STAGING_DIR) \
 	--with-libbeecrypt=$(STAGING_DIR) \
 	--with-popt=$(STAGING_DIR)
-- 
1.7.1
