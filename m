From: Will Wagner <will_wagner@carallon.com>
Date: Fri, 14 Oct 2011 15:52:00 +0100
Subject: [Buildroot] [PATCH 8/9] qt: fix config when specifying custom
	config file
In-Reply-To: <1318603921-22899-1-git-send-email-will_wagner@carallon.com>
References: <1318603921-22899-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1318603921-22899-9-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/qt/qt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 1137218..e900363 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -32,7 +32,7 @@ endif
 QT_CONFIG_FILE=$(call qstrip,$(BR2_PACKAGE_QT_CONFIG_FILE))
 
 ifneq ($(QT_CONFIG_FILE),)
-QT_CONFIGURE_OPTS += -config buildroot
+QT_CONFIGURE_OPTS += -qconfig buildroot
 endif
 
 QT_CFLAGS = $(TARGET_CFLAGS)
-- 
1.7.2.5
