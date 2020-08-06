From: Michael Fischer <mf@go-sys.de>
Date: Thu, 6 Aug 2020 11:58:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/smstools3: fix build with gcc 10.x
Message-ID: <20200806095831.18563-1-mf@go-sys.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/smstools3/smstools3.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/smstools3/smstools3.mk b/package/smstools3/smstools3.mk
index 87d189baa8..b15e189c60 100644
--- a/package/smstools3/smstools3.mk
+++ b/package/smstools3/smstools3.mk
@@ -10,6 +10,11 @@ SMSTOOLS3_LICENSE = GPL-2.0+
 SMSTOOLS3_LICENSE_FILES = doc/license.html LICENSE
 
 SMSTOOLS3_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_GCC_VERSION_10_X),y)
+	SMSTOOLS3_CFLAGS += -Wl,--allow-multiple-definition
+endif
+
 SMSTOOLS3_CFLAGS += -D NUMBER_OF_MODEMS=$(BR2_PACKAGE_SMSTOOLS3_NB_MODEMS)
 SMSTOOLS3_CFLAGS += -D NOSTATS
 
-- 
2.28.0
