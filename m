From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Jan 2018 23:09:16 +0100
Subject: [Buildroot] [PATCH] python-txtorcon: needs C++ support
Message-ID: <20180121220916.27851-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python-txtorcon selects python-pyopenssl and python-service-identity, both
(indirectly) needing C++ support, so propagate that dependency.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-txtorcon/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-txtorcon/Config.in b/package/python-txtorcon/Config.in
index c4081ab0a3..4f91e7b048 100644
--- a/package/python-txtorcon/Config.in
+++ b/package/python-txtorcon/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_TXTORCON
 	bool "python-txtorcon"
+	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl, python-service-identity
 	select BR2_PACKAGE_PYTHON_AUTOMAT # runtime
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
 	select BR2_PACKAGE_PYTHON_INCREMENTAL # runtime
@@ -13,3 +14,6 @@ config BR2_PACKAGE_PYTHON_TXTORCON
 	  configuration abstractions.
 
 	  https://github.com/meejah/txtorcon
+
+comment "python-txtorcon needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.11.0
