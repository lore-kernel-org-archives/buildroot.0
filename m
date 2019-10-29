From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 29 Oct 2019 21:37:01 +0100
Subject: [Buildroot] [PATCH] package/python-autobahn: add missing dependency
 on C++
Message-ID: <20191029203701.9558-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The indirect dependency via python-cryptography was not set in the
Config.in.

Detected with randconfig.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-autobahn/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-autobahn/Config.in b/package/python-autobahn/Config.in
index e08d5d58a1..ba54d8b12f 100644
--- a/package/python-autobahn/Config.in
+++ b/package/python-autobahn/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_AUTOBAHN
 	bool "python-autobahn"
+	depends on BR2_INSTALL_LIBSTDCPP # python-cryptography -> python-pyasn
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TXAIO # runtime
@@ -8,3 +9,6 @@ config BR2_PACKAGE_PYTHON_AUTOBAHN
 	  framework.
 
 	  https://pypi.python.org/pypi/autobahn
+
+comment "python-autobahn needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.21.0
