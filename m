From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 11:44:07 +0100
Subject: [Buildroot] [git commit branch/2020.02.x]
 support/dependencies/check-host-cmake.mk: gerbera needs cmake 3.14+
Message-ID: <20210130102409.3F0EE83B8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d65cdf4aeabffcc56f05d90b4b3a138d3b11bf44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes:
http://autobuild.buildroot.net/results/871/8717612ae32cc491b868f37fbbc960c16b562877/

Since the security bump to gerbera 1.6.4, gerbera now needs cmake 3.14+,
whereas Buildroot currently enforces 3.10+.

As a fix, bump the requirement to 3.14+ when gerbera is enabled.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/check-host-cmake.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
index 01f38da376..33281f0bcc 100644
--- a/support/dependencies/check-host-cmake.mk
+++ b/support/dependencies/check-host-cmake.mk
@@ -3,7 +3,12 @@
 # package is bumped or a new one added, and it requires a higher
 # version, our cmake infra will catch it and build its own.
 #
+ifeq ($(BR2_PACKAGE_GERBERA),y)
+# gerbera needs 3.14+
+BR2_CMAKE_VERSION_MIN = 3.14
+else
 BR2_CMAKE_VERSION_MIN = 3.10
+endif
 
 BR2_CMAKE_CANDIDATES ?= cmake cmake3
 BR2_CMAKE ?= $(call suitable-host-package,cmake,\
