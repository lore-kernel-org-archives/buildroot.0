From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  4 Jul 2011 09:00:30 +0300
Subject: [Buildroot] [PATCH 2/2] iw: fix build
In-Reply-To: <52492b5cb97af2b80f86cf2dee27c8a931d14856.1309759154.git.baruch@tkos.co.il>
References: <52492b5cb97af2b80f86cf2dee27c8a931d14856.1309759154.git.baruch@tkos.co.il>
Message-ID: <a57ca01c880d3bb519f1e96aa12ec0e7ca135648.1309759154.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The --sysroot option is required in CFLAGS and LDFLAGS to avoid compile time
and link time failures.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/iw/iw.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 0f5dd0e..4db47c5 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -15,8 +15,8 @@ IW_MAKE_ENV = PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
 
 define IW_CONFIGURE_CMDS
 	echo "CC = $(TARGET_CC)" >$(IW_CONFIG)
-	echo "CFLAGS = $(TARGET_CFLAGS)" >>$(IW_CONFIG)
-	echo "LDFLAGS = $(TARGET_LDFLAGS)" >>$(IW_CONFIG)
+	echo "CFLAGS = $(TARGET_CFLAGS) --sysroot=$(STAGING_DIR)" >>$(IW_CONFIG)
+	echo "LDFLAGS = $(TARGET_LDFLAGS) --sysroot=$(STAGING_DIR)" >>$(IW_CONFIG)
 endef
 
 define IW_BUILD_CMDS
-- 
1.7.5.4
