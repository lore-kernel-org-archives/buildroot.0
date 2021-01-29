From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Jan 2021 10:57:10 +0100
Subject: [Buildroot] [PATCH-2020.11.x]
 support/dependencies/check-host-cmake.mk: gerbera needs cmake 3.14+
Message-ID: <20210129095710.31193-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/871/8717612ae32cc491b868f37fbbc960c16b562877/

Since the security bump to gerbera 1.6.4, gerbera now needs cmake 3.14+,
whereas Buildroot currently enforces 3.10+.

As a fix, bump the requirement to 3.14+ when gerbera is enabled.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/check-host-cmake.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
index 01f38da376..cd280b78e0 100644
--- a/support/dependencies/check-host-cmake.mk
+++ b/support/dependencies/check-host-cmake.mk
@@ -3,7 +3,11 @@
 # package is bumped or a new one added, and it requires a higher
 # version, our cmake infra will catch it and build its own.
 #
+ifeq ($(BR2_PACKAGE_GERBERA),y)
+BR2_CMAKE_VERSION_MIN = 3.14
+else
 BR2_CMAKE_VERSION_MIN = 3.10
+endif
 
 BR2_CMAKE_CANDIDATES ?= cmake cmake3
 BR2_CMAKE ?= $(call suitable-host-package,cmake,\
-- 
2.20.1
