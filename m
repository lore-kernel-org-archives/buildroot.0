From: Frank Vanbever <frank.vanbever@essensium.com>
Date: Wed, 26 Feb 2020 15:26:15 +0100
Subject: [Buildroot] [PATCH 1/3] package/python-iptables: add explicit
 dependency on dynamic libs
Message-ID: <20200226142617.4170-1-frank.vanbever@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
---
 package/python-iptables/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-iptables/Config.in b/package/python-iptables/Config.in
index e55359963e..a35577bad3 100644
--- a/package/python-iptables/Config.in
+++ b/package/python-iptables/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_PYTHON_IPTABLES
 	bool "python-iptables"
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_IPTABLES # runtime dependency
 	help
 	  Python bindings for iptables.
 
 	  https://github.com/ldx/python-iptables
+
+comment "python-iptables needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
-- 
2.20.1
