From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 Apr 2020 22:23:35 +0200
Subject: [Buildroot] [git commit] package/python-iptables: add explicit
 dependency on dynamic libs
Message-ID: <20200415201730.58ED48ED12@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21b85bc56cdcf030cced57dea0f78cdce59912b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package uses ctypes.CDLL extensively which only makes sense when dynamic
libraries are available.

Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
