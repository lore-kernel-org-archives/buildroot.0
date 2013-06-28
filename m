From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jun 2013 11:13:02 +0200
Subject: [Buildroot] [git commit] qt5quick1: needs widgets support in qt5base
Message-ID: <20130628092437.659249B25D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1bbd809f64869c43c37873abfd8f5ec3b71b443
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Which in turn needs gui support.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt5/qt5quick1/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5quick1/Config.in b/package/qt5/qt5quick1/Config.in
index 65b1f62..dc3f621 100644
--- a/package/qt5/qt5quick1/Config.in
+++ b/package/qt5/qt5quick1/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_QT5QUICK1
 	bool "qt5quick1"
 	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5SCRIPT
 	select BR2_PACKAGE_QT5XMLPATTERNS
 	select BR2_PACKAGE_QT5DECLARATIVE
