From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 18 Mar 2015 14:44:42 -0700
Subject: [Buildroot] [PATCH 1/3] package/procps-ng: if building with systemd,
	enable systemd-specific features
Message-ID: <1426715084-24894-1-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---
 package/procps-ng/procps-ng.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 71e32dd..1483662 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -24,6 +24,11 @@ PROCPS_NG_DEPENDENCIES += gettext
 PROCPS_NG_CONF_OPTS += LIBS=-lintl
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+PROCPS_NG_DEPENDENCIES += systemd
+PROCPS_NG_CONF_OPTS += --with-systemd
+endif
+
 # We need this to make procps-ng binaries installed in $(TARGET_DIR)/usr
 # instead of $(TARGET_DIR)/usr/usr
 PROCPS_NG_CONF_OPTS += --exec-prefix=
-- 
2.3.3
