From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 10 Feb 2017 21:21:12 +0100
Subject: [Buildroot] [PATCH v1] ddrescue: needs c++ compiler
Message-ID: <20170210202112.3601-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1].

[1] http://autobuild.buildroot.net/results/0af569ad06efa36e8e1ae45acd1facfd98b86f20

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/ddrescue/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ddrescue/Config.in b/package/ddrescue/Config.in
index 7ec87ced7..2ec3e7e30 100644
--- a/package/ddrescue/Config.in
+++ b/package/ddrescue/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_DDRESCUE
 	bool "ddrescue"
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  GNU ddrescue is a data recovery tool. It copies data from one file
 	  or block device (hard disc, cdrom, etc) to another, trying to
 	  rescue the good parts first in case of read errors.
 
 	  http://www.gnu.org/software/ddrescue/ddrescue.html
+
+comment "ddrescue needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.11.0
