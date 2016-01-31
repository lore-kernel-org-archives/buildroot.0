From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jan 2016 17:32:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/snowball-init: use github helper
Message-ID: <1454257933-24422-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise download is broken:

>>> snowball-init b064be21de25729039e5e54037bbdd2e25cfd5b7 Downloading
--2016-01-31 17:31:27--  https://github.com/igloocommunity/snowball-init/snowball-init-b064be21de25729039e5e54037bbdd2e25cfd5b7.tar.gz
Resolving github.com (github.com)... 192.30.252.128
Connecting to github.com (github.com)|192.30.252.128|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2016-01-31 17:31:27 ERROR 404: Not Found.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/snowball-init/snowball-init.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/snowball-init/snowball-init.mk b/package/snowball-init/snowball-init.mk
index 40acdd6..f06b032 100644
--- a/package/snowball-init/snowball-init.mk
+++ b/package/snowball-init/snowball-init.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SNOWBALL_INIT_VERSION = b064be21de25729039e5e54037bbdd2e25cfd5b7
-SNOWBALL_INIT_SITE = https://github.com/igloocommunity/snowball-init
+SNOWBALL_INIT_SITE = $(call github,igloocommunity,snowball-init,$(SNOWBALL_INIT_VERSION))
 SNOWBALL_INIT_LICENSE = BSD-4c
 SNOWBALL_INIT_LICENSE_FILES = debian/copyright
 
-- 
2.7.0
