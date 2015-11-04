From: =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>
Date: Wed,  4 Nov 2015 18:47:05 +0100
Subject: [Buildroot] [PATCH v2 2/2] tpm-tools: new package
In-Reply-To: <1446659225-30438-1-git-send-email-nrubinstein@aldebaran.com>
References: <1446659225-30438-1-git-send-email-nrubinstein@aldebaran.com>
Message-ID: <1446659225-30438-2-git-send-email-nrubinstein@aldebaran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Al West <al.west@v-nova.com>
Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>

---

Previously submitted by Al West <al.west@v-nova.com>

Changes since v1:
* Removed upstreamed patch
* Remove configuration option "--disable-usercheck"
* Use upstream hashes
* More verbose package description
* Cosmetic changes
---
 package/Config.in                |  1 +
 package/tpm-tools/Config.in      |  8 ++++++++
 package/tpm-tools/tpm-tools.hash |  3 +++
 package/tpm-tools/tpm-tools.mk   | 13 +++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/tpm-tools/Config.in
 create mode 100644 package/tpm-tools/tpm-tools.hash
 create mode 100644 package/tpm-tools/tpm-tools.mk

diff --git a/package/Config.in b/package/Config.in
index 850cb83..ad77244 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -765,6 +765,7 @@ menu "Crypto"
 	source "package/nettle/Config.in"
 	source "package/openssl/Config.in"
 	source "package/polarssl/Config.in"
+	source "package/tpm-tools/Config.in"
 	source "package/trousers/Config.in"
 endmenu
 
diff --git a/package/tpm-tools/Config.in b/package/tpm-tools/Config.in
new file mode 100644
index 0000000..0c25c76
--- /dev/null
+++ b/package/tpm-tools/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_TPM_TOOLS
+	bool "tpm-tools"
+	select BR2_PACKAGE_TROUSERS
+	depends on BR2_PACKAGE_OPENSSL
+	help
+	  Tools to manage and diagnose a TPM
+
+	  http://trousers.sourceforge.net/
diff --git a/package/tpm-tools/tpm-tools.hash b/package/tpm-tools/tpm-tools.hash
new file mode 100644
index 0000000..8c1ff89
--- /dev/null
+++ b/package/tpm-tools/tpm-tools.hash
@@ -0,0 +1,3 @@
+# http://sourceforge.net/projects/trousers/files/tpm-tools/1.3.8/
+sha1 f2c799ac8dc78f3537e1dbe4ae7c6e93f37e868c tpm-tools-1.3.8.tar.gz
+md5  85a978c4e03fefd4b73cbeadde7c4d0b         tpm-tools-1.3.8.tar.gz
diff --git a/package/tpm-tools/tpm-tools.mk b/package/tpm-tools/tpm-tools.mk
new file mode 100644
index 0000000..d6fea7b
--- /dev/null
+++ b/package/tpm-tools/tpm-tools.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# tpm-tools
+#
+##############################################################
+
+TPM_TOOLS_VERSION = 1.3.8
+TPM_TOOLS_SOURCE = tpm-tools-$(TPM_TOOLS_VERSION).tar.gz
+TPM_TOOLS_SITE = http://downloads.sourceforge.net/project/trousers/tpm-tools/$(TPM_TOOLS_VERSION)
+TPM_TOOLS_STRIP_COMPONENTS = 2
+TPM_TOOLS_DEPENDENCIES = trousers
+
+$(eval $(autotools-package))
-- 
2.1.4
