From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:12 +0000
Subject: [Buildroot] [PATCH 03/32] package/systemd: add
	--enable/disable-bzip2
In-Reply-To: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1456437341-19025-4-git-send-email-gabe@hashrabbit.co>
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
index 7a1baf5..ac211c8 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -76,6 +76,13 @@ else
 SYSTEMD_CONF_OPTS += --disable-kdbus
 endif
 
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+SYSTEMD_DEPENDENCIES += bzip2
+SYSTEMD_CONF_OPTS += --enable-bzip2
+else
+SYSTEMD_CONF_OPTS += --disable-bzip2
+endif
+
 ifeq ($(BR2_PACKAGE_XZ),y)
 SYSTEMD_DEPENDENCIES += xz
 SYSTEMD_CONF_OPTS += --enable-xz
-- 
1.9.1
