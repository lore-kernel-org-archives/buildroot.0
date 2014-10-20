From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 20 Oct 2014 16:15:27 +0200
Subject: [Buildroot] [PATCH 1/2 v5] package/monolite: new package
In-Reply-To: <1413814528-26904-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1413814528-26904-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1413814528-26904-2-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds Monolite package. This package is a dependency of Mono
package.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/monolite/monolite.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 package/monolite/monolite.mk

diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
new file mode 100644
index 0000000..82eaf57
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
+MONOLITE_LICENSE = Dual license LGPL, commercial
+
+define HOST_MONOLITE_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/usr/lib/monolite
+	cp $(@D)/* $(HOST_DIR)/usr/lib/monolite
+endef
+
+$(eval $(host-generic-package))
-- 
2.1.1
