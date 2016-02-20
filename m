From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 23:23:28 +0100
Subject: [Buildroot] [PATCH v8 28/28] package/freeswitch: add optional
	dependency to xz
In-Reply-To: <1456007008-5200-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456007008-5200-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456007008-5200-29-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 7178590..69b0d6c 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -288,4 +288,8 @@ ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 FREESWITCH_DEPENDENCIES += util-linux
 endif
 
+ifeq ($(BR2_PACKAGE_XZ),y)
+FREESWITCH_DEPENDENCIES += xz
+endif
+
 $(eval $(autotools-package))
-- 
2.7.0
