From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 20:34:35 +0100
Subject: [Buildroot] [git commit] package/snowball-init: use github helper
Message-ID: <20160201224701.5A7537FA6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7aecb34cbf4c9eeda5a1012b1a588de510506f60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise download is broken:

>>> snowball-init b064be21de25729039e5e54037bbdd2e25cfd5b7 Downloading
--2016-01-31 17:31:27--  https://github.com/igloocommunity/snowball-init/snowball-init-b064be21de25729039e5e54037bbdd2e25cfd5b7.tar.gz
Resolving github.com (github.com)... 192.30.252.128
Connecting to github.com (github.com)|192.30.252.128|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2016-01-31 17:31:27 ERROR 404: Not Found.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
