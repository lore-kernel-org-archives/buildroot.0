From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jul 2019 17:55:02 +0200
Subject: [Buildroot] [git commit] package/qt5: change upstream location
Message-ID: <20190730155429.B43F782818@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=675d38dd65ddbbe8607bb2b3e43e0dc9b0c00e89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream pushes their delivery archives in to places:
    https://download.qt.io/official_releases/
    https://download.qt.io/archive/

After a while, only the latter remains, whith the former being pruned
actively to contain only officially supported versions.

Switch to using the archive location, as it has everything, even the
latest versions.

Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 247748ca4d..468c1ac4d5 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -13,7 +13,7 @@ QT5_VERSION_MAJOR = 5.6
 QT5_VERSION = $(QT5_VERSION_MAJOR).3
 QT5_SOURCE_TARBALL_PREFIX = opensource-src
 endif
-QT5_SITE = https://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
+QT5_SITE = https://download.qt.io/archive/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 
 include $(sort $(wildcard package/qt5/*/*.mk))
 
