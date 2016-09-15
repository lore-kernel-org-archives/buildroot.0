From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Thu, 15 Sep 2016 18:27:48 +0200
Subject: [Buildroot] [PATCH] openal: Disable build also for examples and
	tests
Message-ID: <1473956868-9619-1-git-send-email-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/openal/openal.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index 356f2c1..6384104 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -16,8 +16,8 @@ OPENAL_LICENSE = LGPLv2+
 OPENAL_LICENSE_FILES = COPYING
 OPENAL_INSTALL_STAGING = YES
 
-# We don't need the utilities, Distros don't ship them either
-OPENAL_CONF_OPTS += -DALSOFT_UTILS=OFF
+# We don't need examples, tests and utilities, Distros don't ship them either
+OPENAL_CONF_OPTS += -DALSOFT_UTILS=OFF -DALSOFT_EXAMPLES=OFF -DALSOFT_TESTS=OFF
 
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8),y)
 OPENAL_CONF_OPTS += -DEXTRA_LIBS=atomic
-- 
2.7.4
