From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 13 Dec 2020 12:19:45 +0100
Subject: [Buildroot] [PATCH v1 1/3] package/qt5knx: bump version to 5.15.2
 (and fix download)
Message-ID: <20201213111947.5385-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- bump version to 5.15.2
- change download url to original site

Fixes:

  - http://autobuild.buildroot.net/results/a043bb991a827880d6c743e63f070fc6a3b72a2f

  >>> qt5knx 5.15.2 Downloading[27m
  --2020-12-12 13:42:47--  https://github.com/qt/qtknx/archive/v5.15.2/qt5knx-5.15.2.tar.gz
  Resolving github.com (github.com)... 140.82.114.3
  Connecting to github.com (github.com)|140.82.114.3|:443... connected.
  HTTP request sent, awaiting response... 302 Found
  Location: https://codeload.github.com/qt/qtknx/tar.gz/v5.15.2/qt5knx-5.15.2 [following]
  --2020-12-12 13:42:47--  https://codeload.github.com/qt/qtknx/tar.gz/v5.15.2/qt5knx-5.15.2
  Resolving codeload.github.com (codeload.github.com)... 140.82.114.10
  Connecting to codeload.github.com (codeload.github.com)|140.82.114.10|:443... connected.
  HTTP request sent, awaiting response... 404 Not Found
  2020-12-12 13:42:47 ERROR 404: Not Found.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5knx/qt5knx.hash | 2 +-
 package/qt5/qt5knx/qt5knx.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5knx/qt5knx.hash b/package/qt5/qt5knx/qt5knx.hash
index 05abe706af..0cb964134a 100644
--- a/package/qt5/qt5knx/qt5knx.hash
+++ b/package/qt5/qt5knx/qt5knx.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  8ee0df130fad39ef6b9a0bef390b648d3ad6539ffca33e22fb569e889d0bd043  qt5knx-5.15.1.tar.gz
+sha256  e246de9d7c5103edd6c3b735d2ed1f13f7ff86d32cb08521abb5718538353daf  qt5knx-5.15.2.tar.gz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5knx/qt5knx.mk b/package/qt5/qt5knx/qt5knx.mk
index 494e63226b..9fc121111c 100644
--- a/package/qt5/qt5knx/qt5knx.mk
+++ b/package/qt5/qt5knx/qt5knx.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 QT5KNX_VERSION = $(QT5_VERSION)
-QT5KNX_SITE = $(call github,qt,qtknx,v$(QT5_VERSION))
+QT5KNX_SITE = https://code.qt.io/cgit/qt/qtknx.git
+QT5KNX_SITE_METHOD = git
 QT5KNX_INSTALL_STAGING = YES
 QT5KNX_LICENSE = GPL-3.0 with exception
 QT5KNX_LICENSE_FILES = LICENSE.GPL3 LICENSE.GPL3-EXCEPT
-- 
2.29.2
