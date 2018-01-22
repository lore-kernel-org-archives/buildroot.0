From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Jan 2018 12:15:15 +0100
Subject: [Buildroot] [git commit] python-txtorcon: needs C++ support
Message-ID: <20180122111549.2FF1883EDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a877626f5d52636c7fb089275e9d0964b0e1276e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python-txtorcon selects python-pyopenssl and python-service-identity, both
(indirectly) needing C++ support, so propagate that dependency.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-txtorcon/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-txtorcon/Config.in b/package/python-txtorcon/Config.in
index c4081ab..4f91e7b 100644
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
