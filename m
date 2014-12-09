From: kiwi <gregd72002@gmail.com>
Date: Tue,  9 Dec 2014 21:23:26 +0000
Subject: [Buildroot] [PATCH 6/8] Adding sofia-sip
In-Reply-To: <1418160208-1569-1-git-send-email-gregd72002@gmail.com>
References: <1418160208-1569-1-git-send-email-gregd72002@gmail.com>
Message-ID: <1418160208-1569-6-git-send-email-gregd72002@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gregory Dymarek <gregd72002@gmail.com>

Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
---
 package/sofia-sip/Config.in    |  6 ++++++
 package/sofia-sip/sofia-sip.mk | 18 ++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 package/sofia-sip/Config.in
 create mode 100644 package/sofia-sip/sofia-sip.mk

diff --git a/package/sofia-sip/Config.in b/package/sofia-sip/Config.in
new file mode 100644
index 0000000..3d85ffc
--- /dev/null
+++ b/package/sofia-sip/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_SOFIA_SIP
+	bool "sofia-sip"
+	help
+	  Adds Sofia-SIP - an open-source SIP User-Agent library, compliant with the IETF RFC3261 specification
+
+	  http://sofia-sip.sourceforge.net
diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
new file mode 100644
index 0000000..5258844
--- /dev/null
+++ b/package/sofia-sip/sofia-sip.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# sofiasip
+#
+#############################################################
+SOFIA_SIP_VERSION = 1.12.11
+SOFIA_SIP_SITE = http://downloads.sourceforge.net/project/sofia-sip/sofia-sip/$(SOFIA_SIP_VERSION) 
+SOFIA_SIP_INSTALL_STAGING = YES
+SOFIA_SIP_LICENSE = LGPLv2.1+ 
+SOFIA_SIP_LICENSE_FILE = COPYING COPYRIGHTS
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_INET_IPV6),y)
+	SOFIA_SIP_CONF_OPTS = --enable-ip6
+else
+	SOFIA_SIP_CONF_OPTS = --disable-ip6
+endif
+
+$(eval $(autotools-package))
-- 
1.9.1
