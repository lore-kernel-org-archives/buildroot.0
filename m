From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 22 Dec 2019 11:33:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/rygel: drop autoreconf
Message-ID: <20191222103342.2182120-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

autoreconf is not needed since bump to version 0.36.2 in commit
76f86c409d016851d4d63216ada969e6cd81dd56

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rygel/rygel.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/rygel/rygel.mk b/package/rygel/rygel.mk
index 5ffb6a9400..d87beda8c9 100644
--- a/package/rygel/rygel.mk
+++ b/package/rygel/rygel.mk
@@ -17,8 +17,6 @@ RYGEL_DEPENDENCIES = \
 	sqlite \
 	$(TARGET_NLS_DEPENDENCIES)
 RYGEL_INSTALL_STAGING = YES
-# We're patching configure.ac
-RYGEL_AUTORECONF = YES
 
 RYGEL_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 RYGEL_CONF_OPTS += \
-- 
2.24.0
