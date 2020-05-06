From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 May 2020 07:15:01 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/python-iptables:
 add explicit dependency on dynamic libs
Message-ID: <20200506051931.924CC811F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6d45c45cb0e0e0a7080350dadb2eccefdaa8b0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The package uses ctypes.CDLL extensively which only makes sense when dynamic
libraries are available.

Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 21b85bc56cdcf030cced57dea0f78cdce59912b8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
