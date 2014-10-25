From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 10:48:35 +0200
Subject: [Buildroot] [git commit] package/monolite: new package
Message-ID: <20141025084936.85177B0EFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9cd62c96e9d4db3e688e5a28abbb2a61d4ccc90d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds Monolite package. This package is a dependency of Mono
package.

[Thomas: adjust license information.]

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/monolite/monolite.mk |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
new file mode 100644
index 0000000..b759c13
--- /dev/null
+++ b/package/monolite/monolite.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# monolite
+#
+#############################################################
+
+MONOLITE_VERSION = 111
+MONOLITE_SITE = http://storage.bos.xamarin.com/mono-dist-master/latest/
+MONOLITE_SOURCE = monolite-$(MONOLITE_VERSION)-latest.tar.gz
+MONOLITE_LICENSE = LGPLv2 or commercial
+
+define HOST_MONOLITE_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/usr/lib/monolite
+	cp $(@D)/* $(HOST_DIR)/usr/lib/monolite
+endef
+
+$(eval $(host-generic-package))
