From: Fabio Urquiza <fabiorush@gmail.com>
Date: Fri, 28 Sep 2018 10:59:23 -0300
Subject: [Buildroot] [PATCH 4/4] neutrino: new package
In-Reply-To: <1538143163-20596-1-git-send-email-fabiorush@gmail.com>
References: <1538143163-20596-1-git-send-email-fabiorush@gmail.com>
Message-ID: <1538143163-20596-5-git-send-email-fabiorush@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A privacy-preserving Bitcoin light client

Signed-off-by: Fabio Urquiza <fabiorush@gmail.com>
---
 package/Config.in              |  1 +
 package/neutrino/Config.in     | 13 +++++++++++++
 package/neutrino/neutrino.hash |  3 +++
 package/neutrino/neutrino.mk   | 14 ++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/neutrino/Config.in
 create mode 100644 package/neutrino/neutrino.hash
 create mode 100644 package/neutrino/neutrino.mk

diff --git a/package/Config.in b/package/Config.in
index 6a74a80..4e40d43 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1974,6 +1974,7 @@ endif
 menu "Blockchain Applications"
 	source "package/bitcoin/Config.in"
 	source "package/btcd/Config.in"
+	source "package/neutrino/Config.in"
 endmenu
 
 endmenu
diff --git a/package/neutrino/Config.in b/package/neutrino/Config.in
new file mode 100644
index 0000000..e09f53a
--- /dev/null
+++ b/package/neutrino/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_NEUTRINO
+	bool "neutrino"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO_GLIDE
+	help
+	  Neutrino is an experimental Bitcoin light client written in Go
+	  and designed with mobile Lightning Network clients in mind. It
+	  uses a new proposal for compact block filters to minimize
+	  bandwidth and storage use on the client side, while attempting
+	  to preserve privacy and minimize processor load on full nodes
+	  serving light clients.
+
+	  https://github.com/lightninglabs/neutrino
diff --git a/package/neutrino/neutrino.hash b/package/neutrino/neutrino.hash
new file mode 100644
index 0000000..4e88053
--- /dev/null
+++ b/package/neutrino/neutrino.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 581bb625173252d006d6a1cb7962578829f0d7d26605cdcb2ac4e6191a294d8f  neutrino-bee0ed11601a4ad0c3b23d462cd71089fc11f2cd.tar.gz
+sha256 86d02f0ba9cb90c5da357c931eec3d3d69667ea1cf83804f07cc1ed69494cf46  LICENSE
diff --git a/package/neutrino/neutrino.mk b/package/neutrino/neutrino.mk
new file mode 100644
index 0000000..4187936
--- /dev/null
+++ b/package/neutrino/neutrino.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# neutrino
+#
+################################################################################
+
+NEUTRINO_VERSION = bee0ed11601a4ad0c3b23d462cd71089fc11f2cd
+NEUTRINO_SITE = $(call github,lightninglabs,neutrino,$(NEUTRINO_VERSION))
+NEUTRINO_LICENSE = MIT
+NEUTRINO_LICENSE_FILES = LICENSE
+NEUTRINO_GO_GLIDE = YES
+
+$(eval $(golang-package))
+
-- 
2.7.4
