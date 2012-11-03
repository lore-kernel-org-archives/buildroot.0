From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  3 Nov 2012 18:48:02 +0100
Subject: [Buildroot] [PATCH 17/18] netkitbase: mark as deprecated
In-Reply-To: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
References: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <bbf044155e3134db1522481725076c32a6473fdd.1351964808.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is no longer being developed, the FTP is dead, and Debian has
removed it from the distribution.

Also it allows to not worry about adding RPC support through libtirpc
to this package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netkitbase/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/netkitbase/Config.in b/package/netkitbase/Config.in
index 75bd728..dd9166c 100644
--- a/package/netkitbase/Config.in
+++ b/package/netkitbase/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NETKITBASE
 	bool "netkitbase"
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on BR2_DEPRECATED
 	help
 	  Old-style inetd.
 
-- 
1.7.9.5
