From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Oct 2016 22:13:58 -0300
Subject: [Buildroot] [PATCH 7/8] itstool: new host package
In-Reply-To: <1476321239-13894-1-git-send-email-gustavo@zacarias.com.ar>
References: <1476321239-13894-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1476321239-13894-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ITS Tool allows you to translate your XML documents with PO files, using
rules from the W3C Internationalization Tag Set (ITS) to determine what
to translate and how to separate it into PO file messages.

This is required by the upcoming evince package.

A target-variant package doesn't make much sense so leave it out.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/itstool/itstool.hash |  2 ++
 package/itstool/itstool.mk   | 14 ++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 package/itstool/itstool.hash
 create mode 100644 package/itstool/itstool.mk

diff --git a/package/itstool/itstool.hash b/package/itstool/itstool.hash
new file mode 100644
index 0000000..f266b93
--- /dev/null
+++ b/package/itstool/itstool.hash
@@ -0,0 +1,2 @@
+# From http://files.itstool.org/itstool/itstool-2.0.2.tar.bz2.sha256sum
+sha256	bf909fb59b11a646681a8534d5700fec99be83bb2c57badf8c1844512227033a	itstool-2.0.2.tar.bz2
diff --git a/package/itstool/itstool.mk b/package/itstool/itstool.mk
new file mode 100644
index 0000000..b8a282a
--- /dev/null
+++ b/package/itstool/itstool.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# itstool
+#
+################################################################################
+
+ITSTOOL_VERSION = 2.0.2
+ITSTOOL_SITE = http://files.itstool.org/itstool
+ITSTOOL_SOURCE = itstool-$(ITSTOOL_VERSION).tar.bz2
+HOST_ITSTOOL_DEPENDENCIES = host-python-libxml2 host-python
+ITSTOOL_LICENSE = GPLv3+
+ITSTOOL_LICENSE_FILES = COPYING COPYING.GPL3
+
+$(eval $(host-autotools-package))
-- 
2.7.3
