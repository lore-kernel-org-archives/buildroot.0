From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  6 Dec 2014 10:56:26 +0100
Subject: [Buildroot] [PATCH 2/3] fconfig: remove redundant CFLAGS/LDFLAGS
In-Reply-To: <1417859787-31970-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417859787-31970-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417859787-31970-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CFLAGS and LDFLAGS are already passed as part of
$(TARGET_CONFIGURE_OPTS).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fconfig/fconfig.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/fconfig/fconfig.mk b/package/fconfig/fconfig.mk
index 7f7faad..509fc2c 100644
--- a/package/fconfig/fconfig.mk
+++ b/package/fconfig/fconfig.mk
@@ -12,9 +12,7 @@ FCONFIG_LICENSE = GPLv2+
 FCONFIG_LICENSE_FILES = fconfig.c
 
 define FCONFIG_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
 
 define FCONFIG_INSTALL_TARGET_CMDS
-- 
2.1.0
