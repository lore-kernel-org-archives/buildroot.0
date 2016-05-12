From: Atul Singh <atul.singh.mandla@rockwellcollins.com>
Date: Thu, 12 May 2016 18:26:54 +0530
Subject: [Buildroot] [PATCH v1 1/1] raptor: Patch to remove the support for
	blackfin architecture.
Message-ID: <1463057814-9991-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
---
 package/raptor/0002-remove-blackfin-support.patch | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 package/raptor/0002-remove-blackfin-support.patch

diff --git a/package/raptor/0002-remove-blackfin-support.patch b/package/raptor/0002-remove-blackfin-support.patch
new file mode 100644
index 0000000..0d374fc
--- /dev/null
+++ b/package/raptor/0002-remove-blackfin-support.patch
@@ -0,0 +1,14 @@
+Removed support for blackfin architecture.
+
+Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
+
+--- a/Config.in
++++ b/Config.in
+@@ -2,6 +2,7 @@
+ 	bool "raptor"
+ 	select BR2_PACKAGE_LIBXML2
+ 	select BR2_PACKAGE_LIBXSLT
++	depends on !BR2_bfin
+ 	help
+ 	  A C library that provides a set of parsers and
+ 	  serializers that generate Resource Description
-- 
2.5.0
