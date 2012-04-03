From: Markos Chandras <markos.chandras@imgtec.com>
Date: Tue, 3 Apr 2012 09:35:28 +0100
Subject: [Buildroot] [PATCH] rpm: Fix automagic dependency on openssl
Message-ID: <1333442128-16629-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/rpm/rpm.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 9f42ee1..47c2ee9 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -17,6 +17,13 @@ RPM_CONF_OPT = --disable-build-versionscript --disable-rpath \
 	--with-libbeecrypt=$(STAGING_DIR) \
 	--with-popt=$(STAGING_DIR)
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+RPM_DEPENDENCIES += openssl
+RPM_CONF_OPT += --with-openssl=external
+else
+RPM_CONF_OPT += --with-openssl=no
+endif
+
 ifeq ($(BR2_PACKAGE_PCRE),y)
 RPM_DEPENDENCIES += pcre
 RPM_CONF_OPT += --with-pcre=external
-- 
1.7.1
