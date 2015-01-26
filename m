From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jan 2015 17:16:24 +0100
Subject: [Buildroot] [git commit] benejson: needs c++
Message-ID: <20150126162902.A529D7FE16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af503843f33f0f34e4325ba6d18d002667f94b7e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pull.cpp doesn't look like vanilla C
Fixes local tests (no autobuilder tests to show off atm).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/benejson/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/benejson/Config.in b/package/benejson/Config.in
index 4e8ee2c..cb86d67 100644
--- a/package/benejson/Config.in
+++ b/package/benejson/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_BENEJSON
 	bool "benejson"
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  benejson is a buffering SAX-style JSON parser library.
 	  The library package contains 3 major components:
@@ -9,3 +10,6 @@ config BR2_PACKAGE_BENEJSON
 	  - Core: The parsing core with minimal dependencies
 
 	  https://codehero.github.io/benejson/
+
+comment "benejson needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
