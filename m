From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 23:29:05 +0100
Subject: [Buildroot] [PATCH 1/2] texinfo: new host package
In-Reply-To: <1364164146-16517-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364164146-16517-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364164146-16517-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The makeinfo program from texinfo is needed to get Crosstool-NG to
build properly a toolchain. Long term, it would be great if
Crosstool-NG supported building without texinfo, simply by disabling
the build of documentation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/texinfo/texinfo.mk |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 package/texinfo/texinfo.mk

diff --git a/package/texinfo/texinfo.mk b/package/texinfo/texinfo.mk
new file mode 100644
index 0000000..54d18b6
--- /dev/null
+++ b/package/texinfo/texinfo.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# texinfo
+#
+#############################################################
+
+# We are intentionally not using the latest version 5.x, because it
+# causes issues with the documentation building process when creating
+# a toolchain with the Crosstool-NG backend.
+
+TEXINFO_VERSION = 4.13a
+TEXINFO_SITE = $(BR2_GNU_MIRROR)/texinfo
+
+$(eval $(host-autotools-package))
-- 
1.7.9.5
