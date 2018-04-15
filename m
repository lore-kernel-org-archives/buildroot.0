From: Asaf Kahlon <asafka7@gmail.com>
Date: Sun, 15 Apr 2018 22:39:57 +0300
Subject: [Buildroot] [PATCH 1/1] zeromq: add libunwind as an optional
 dependency
Message-ID: <20180415193957.7328-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/zeromq/zeromq.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 2682a567de..8273cad763 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -51,4 +51,11 @@ else
 ZEROMQ_CONF_OPTS += --without-libsodium
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
+ZEROMQ_DEPENDENCIES += libunwind
+ZEROMQ_CONF_OPTS += --enable-libunwind
+else
+ZEROMQ_CONF_OPTS += --disable-libunwind
+endif
+
 $(eval $(autotools-package))
-- 
2.17.0
