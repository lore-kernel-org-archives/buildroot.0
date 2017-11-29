From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 21:46:29 +0100
Subject: [Buildroot] [git commit branch/next] package/qt5: simplify and
 cleanup _SITE variables
Message-ID: <20171129203922.2763781E7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b865c38ea627ae59e46a67efe805b4bce101fecb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The variable QT5_SNAPSHOTS_SITE was introduced in commit 9d5ac9698 to
fetch sources of obsolete modules. It was used to download qt5webkit
tarballs.

The variable is not referenced anymore since the qt5webkit tarballs are
downloaded from the Qt community release site.

Since the introduction of qt-5.9 in aa1c40ba3, the QT5_SITE variable
was duplicated for no good reason.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 0e49c6b..5d63433 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -7,13 +7,11 @@
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5_VERSION_MAJOR = 5.9
 QT5_VERSION = $(QT5_VERSION_MAJOR).2
-QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 else
 QT5_VERSION_MAJOR = 5.6
 QT5_VERSION = $(QT5_VERSION_MAJOR).3
-QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
-QT5_SNAPSHOTS_SITE = http://download.qt.io/snapshots/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/latest_src/submodules
 endif
+QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 
 include $(sort $(wildcard package/qt5/*/*.mk))
 
