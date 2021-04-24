From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 24 Apr 2021 14:03:12 +0200
Subject: [Buildroot] [PATCH 1/1] support/dependencies: set cmake version min
 to 3.16
Message-ID: <20210424120312.1459212-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

domoticz requires cmake 3.16 since version 2020.2 and
https://github.com/domoticz/domoticz/commit/275effddf0921698197dbc38bde199c48d4956f9

Fixes:
 - http://autobuild.buildroot.org/results/0caec85c70341036a039dbc337ad99196b6005a9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 support/dependencies/check-host-cmake.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
index e1bbcd62c8..dfc252e919 100644
--- a/support/dependencies/check-host-cmake.mk
+++ b/support/dependencies/check-host-cmake.mk
@@ -1,9 +1,9 @@
-# Set this to either 3.15 or higher, depending on the highest minimum
+# Set this to either 3.16 or higher, depending on the highest minimum
 # version required by any of the packages bundled in Buildroot. If a
 # package is bumped or a new one added, and it requires a higher
 # version, our cmake infra will catch it and build its own.
 #
-BR2_CMAKE_VERSION_MIN = 3.15
+BR2_CMAKE_VERSION_MIN = 3.16
 
 BR2_CMAKE_CANDIDATES ?= cmake cmake3
 BR2_CMAKE ?= $(call suitable-host-package,cmake,\
-- 
2.30.2
