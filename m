From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Jan 2015 01:09:16 +0100
Subject: [Buildroot] [git commit] qt: make QtDeclarative depend on QtSql
Message-ID: <20150124001256.54DE980E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=29fba02bbaf121f2d1c43ae1d8f215802ebdfb63
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As indicated by QtDeclarative.pc, QtDeclarative needs QtSql.
It builds fine without it, but then you get a run-time error.
So add QtSql to the QtDeclarative depends-on list.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index ba71e12..990014e 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -483,6 +483,7 @@ config BR2_PACKAGE_QT_DECLARATIVE
 	bool "Declarative module"
 	depends on BR2_PACKAGE_QT_SCRIPT
 	depends on BR2_PACKAGE_QT_GUI_MODULE
+	depends on BR2_PACKAGE_QT_SQL_MODULE
 	help
 	  Build the Qt Declarative Module for qml support
 	  if unsure, say n.
