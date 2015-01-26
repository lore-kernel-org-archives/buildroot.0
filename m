From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 26 Jan 2015 11:17:39 -0300
Subject: [Buildroot] [PATCH 2/2] benejson: needs c++
In-Reply-To: <1422281859-4003-1-git-send-email-gustavo@zacarias.com.ar>
References: <1422281859-4003-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1422281859-4003-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pull.cpp doesn't look like vanilla C
Fixes local tests (no autobuilder tests to show off atm).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/benejson/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

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
-- 
2.0.5
