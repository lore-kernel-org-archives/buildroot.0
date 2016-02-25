From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:14 +0000
Subject: [Buildroot] [PATCH 05/32] package/systemd: add --enable/disable-zlib
In-Reply-To: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1456437341-19025-6-git-send-email-gabe@hashrabbit.co>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 9f15f24..29c764e 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -97,6 +97,13 @@ else
 SYSTEMD_CONF_OPTS += --disable-xz
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+SYSTEMD_DEPENDENCIES += zlib
+SYSTEMD_CONF_OPTS += --enable-zlib
+else
+SYSTEMD_CONF_OPTS += --disable-zlib
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 SYSTEMD_DEPENDENCIES += libgcrypt
 SYSTEMD_CONF_OPTS += \
-- 
1.9.1
