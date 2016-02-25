From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:16 +0000
Subject: [Buildroot] [PATCH 07/32] package/systemd: explicitly
	--enable/disable-microhttpd
In-Reply-To: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1456437341-19025-8-git-send-email-gabe@hashrabbit.co>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 18e0c5c..639b8a5 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -122,6 +122,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY),y)
 SYSTEMD_DEPENDENCIES += libmicrohttpd
+SYSTEMD_CONF_OPTS += --enable-microhttpd
 else
 SYSTEMD_CONF_OPTS += --disable-microhttpd
 endif
-- 
1.9.1
