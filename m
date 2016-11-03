From: Jeroen Roovers <jer@airfi.aero>
Date: Thu,  3 Nov 2016 13:56:14 +0100
Subject: [Buildroot] [PATCH v2 1/2] libidn2: new package
In-Reply-To: <20161103125615.21592-1-jer@airfi.aero>
References: <20161103125615.21592-1-jer@airfi.aero>
Message-ID: <20161103125615.21592-2-jer@airfi.aero>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

An implementation of the IDNA2008 specifications (RFC 5890, RFC 5891,
RFC 5892, RFC 5893)
---
 package/Config.in            |  1 +
 package/libidn2/Config.in    |  4 ++++
 package/libidn2/libidn2.hash |  2 ++
 package/libidn2/libidn2.mk   | 11 +++++++++++
 4 files changed, 18 insertions(+)
 create mode 100644 package/libidn2/Config.in
 create mode 100644 package/libidn2/libidn2.hash
 create mode 100644 package/libidn2/libidn2.mk

diff --git a/package/Config.in b/package/Config.in
index 9ed296f..7ffb756 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1198,6 +1198,7 @@ menu "Networking"
 	source "package/libgsasl/Config.in"
 	source "package/libhttpparser/Config.in"
 	source "package/libidn/Config.in"
+	source "package/libidn2/Config.in"
 	source "package/libiscsi/Config.in"
 	source "package/libldns/Config.in"
 	source "package/libmbus/Config.in"
diff --git a/package/libidn2/Config.in b/package/libidn2/Config.in
new file mode 100644
index 0000000..991a4aa
--- /dev/null
+++ b/package/libidn2/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_LIBIDN2
+	bool "libidn2"
+	help
+	  An implementation of the IDNA2008 specifications (RFCs 5890, 5891, 5892, 5893)
diff --git a/package/libidn2/libidn2.hash b/package/libidn2/libidn2.hash
new file mode 100644
index 0000000..a9e5295
--- /dev/null
+++ b/package/libidn2/libidn2.hash
@@ -0,0 +1,2 @@
+# Calculated locally after checking signature
+sha256  5d397bdc258b372b8a25c8fb5240430d6fae28f9d790d3670f4b6012fa87bfff  libidn2-0.11.tar.gz
diff --git a/package/libidn2/libidn2.mk b/package/libidn2/libidn2.mk
new file mode 100644
index 0000000..40221f3
--- /dev/null
+++ b/package/libidn2/libidn2.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# libidn2
+#
+################################################################################
+
+LIBIDN2_VERSION = 0.11
+LIBIDN2_SITE = ftp://alpha.gnu.org/gnu/libidn
+LIBIDN2_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
2.10.2
