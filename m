From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 08:26:58 +0200
Subject: [Buildroot] [git commit] package/stellarium: bump version to 0.20.1
Message-ID: <20200421061232.AE7968F6B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1504b04983d385a069b4c33dd32a12e508f28d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream, adjust spaces in hash file.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Fix-building-Stellarium-without-scripting.patch | 56 ----------------------
 package/stellarium/stellarium.hash                 |  8 ++--
 package/stellarium/stellarium.mk                   |  2 +-
 3 files changed, 5 insertions(+), 61 deletions(-)

diff --git a/package/stellarium/0001-Fix-building-Stellarium-without-scripting.patch b/package/stellarium/0001-Fix-building-Stellarium-without-scripting.patch
deleted file mode 100644
index de0a656f01..0000000000
--- a/package/stellarium/0001-Fix-building-Stellarium-without-scripting.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From a5786f16b6330a4b6d4adb11e8d9bea23956977e Mon Sep 17 00:00:00 2001
-From: Alexander Wolf <alex.v.wolf@gmail.com>
-Date: Tue, 31 Mar 2020 16:49:15 +0700
-Subject: [PATCH] Fix building Stellarium without scripting
-
-Downloaded from upstream commit
-https://github.com/Stellarium/stellarium/commit/a5786f16b6330a4b6d4adb11e8d9bea23956977e
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- plugins/NavStars/src/NavStars.cpp | 3 +--
- src/gui/StelGui.cpp               | 4 +++-
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/plugins/NavStars/src/NavStars.cpp b/plugins/NavStars/src/NavStars.cpp
-index 7ef8cfb1d4..aa67bcc266 100644
---- a/plugins/NavStars/src/NavStars.cpp
-+++ b/plugins/NavStars/src/NavStars.cpp
-@@ -35,7 +35,6 @@
- #include "NavStarsWindow.hpp"
- #include "NavStarsCalculator.hpp"
- #include "Planet.hpp"
--#include <StelMainScriptAPI.hpp>
- 
- #include <QList>
- #include <QSharedPointer>
-@@ -489,7 +488,7 @@ void NavStars::extraInfo(StelCore* core, const StelObjectP& selectedObject, bool
- 	jde = core->getJDE();
- 
- 	NavStarsCalculator calc;
--	calc.setUTC(StelMainScriptAPI::getDate("utc"))
-+	calc.setUTC(StelUtils::julianDayToISO8601String(jd))
- 		.setLatDeg(core->getCurrentLocation().latitude)
- 		.setLonDeg(core->getCurrentLocation().longitude)
- 		.setJd(jd)
-diff --git a/src/gui/StelGui.cpp b/src/gui/StelGui.cpp
-index 09ef4ba8ca..c2eb91b35a 100644
---- a/src/gui/StelGui.cpp
-+++ b/src/gui/StelGui.cpp
-@@ -225,13 +225,15 @@ void StelGui::init(QGraphicsWidget *atopLevelGraphicsWidget)
- 	QString windowsGroup = N_("Windows");
- 	QString miscGroup = N_("Miscellaneous");
- 	actionsMgr->addAction("actionQuit_Global", miscGroup, N_("Quit"), this, "quit()", "Ctrl+Q", "Ctrl+X");
-+
-+#ifndef DISABLE_SCRIPTING
- 	actionsMgr->addAction("actionIncrease_Script_Speed", datetimeGroup, N_("Speed up the script execution rate"), this, "increaseScriptSpeed()");
- 	actionsMgr->addAction("actionDecrease_Script_Speed", datetimeGroup, N_("Slow down the script execution rate"), this, "decreaseScriptSpeed()");
- 	actionsMgr->addAction("actionSet_Real_Script_Speed", datetimeGroup, N_("Set the normal script execution rate"), this, "setRealScriptSpeed()");
- 	actionsMgr->addAction("actionStop_Script", datetimeGroup, N_("Stop script execution"), this, "stopScript()", "Ctrl+D, S");
- 	actionsMgr->addAction("actionPause_Script", datetimeGroup, N_("Pause script execution"), this, "pauseScript()", "Ctrl+D, P");
- 	actionsMgr->addAction("actionResume_Script", datetimeGroup, N_("Resume script execution"), this, "resumeScript()", "Ctrl+D, R");
--
-+#endif
- #ifdef ENABLE_SCRIPT_CONSOLE
- 	actionsMgr->addAction("actionShow_ScriptConsole_Window_Global", windowsGroup, N_("Script console window"), scriptConsole, "visible", "F12", "", true);
- #endif
diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index c816abe963..76da2d0b3b 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,6 +1,6 @@
 # From https://github.com/Stellarium/stellarium/releases
-md5 9c7059f6d3f0ea0f97147456f6d00069  stellarium-0.20.0.tar.gz
-sha1 2a86e4401d99efc7c46e182778522c4fb6cf7193  stellarium-0.20.0.tar.gz
-sha256 07ed1785d28f761511dc22f9b09ce70e96b5113fc7769fcdf4478f7a5a035370  stellarium-0.20.0.tar.gz
+md5  19422ba4800fbede0a71a723cf3df10f  stellarium-0.20.1.tar.gz
+sha1  20d89ff8e26bb8cef71796d138176be2602e6327   stellarium-0.20.0.tar.gz
+sha256  154e7bd9d4b914a99c40eab86d05b78e43040d657844ee665ebb2aa55a9e920c  stellarium-0.20.0.tar.gz
 # Locally computed
-sha256 3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
+sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 1d5a1e636a..72e762b65e 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 0.20.0
+STELLARIUM_VERSION = 0.20.1
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
 STELLARIUM_LICENSE_FILES = COPYING
