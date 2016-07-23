From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 23 Jul 2016 14:30:35 -0300
Subject: [Buildroot] [PATCH 2/3] fio: add optional zlib dependency
In-Reply-To: <1469295036-21853-1-git-send-email-gustavo@zacarias.com.ar>
References: <1469295036-21853-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1469295036-21853-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fio/fio.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index e09bd71..662b2b2 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -13,6 +13,10 @@ ifeq ($(BR2_PACKAGE_LIBAIO),y)
 FIO_DEPENDENCIES += libaio
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+FIO_DEPENDENCIES += zlib
+endif
+
 define FIO_CONFIGURE_CMDS
 	(cd $(@D); ./configure --cc="$(TARGET_CC)" --extra-cflags="$(TARGET_CFLAGS)")
 endef
-- 
2.7.3
