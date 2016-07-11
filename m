From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Jul 2016 00:16:24 +0200
Subject: [Buildroot] [PATCH 01/12 v8] package/eudev: explicitly disable
	rules generator if not wanted
In-Reply-To: <cover.1468274498.git.yann.morin.1998@free.fr>
References: <cover.1468274498.git.yann.morin.1998@free.fr>
Message-ID: <a54f4d334dd0d21d9ca3197aeffba16d3e8ec9a2.1468274498.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/eudev/eudev.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 4818ea5..e3d3d63 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -31,6 +31,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_EUDEV_RULES_GEN),y)
 EUDEV_CONF_OPTS += --enable-rule-generator
+else
+EUDEV_CONF_OPTS += --disable-rule-generator
 endif
 
 ifeq ($(BR2_PACKAGE_EUDEV_ENABLE_HWDB),y)
-- 
2.7.4
