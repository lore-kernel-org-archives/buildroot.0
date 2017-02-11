From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Feb 2017 15:15:13 +0100
Subject: [Buildroot] [git commit] ddrescue: needs c++ compiler
Message-ID: <20170211141537.A7EBF82122@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0172c72b257f0298bb56cd0e5d9d3baab16ba779
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes [1].

[1] http://autobuild.buildroot.net/results/0af569ad06efa36e8e1ae45acd1facfd98b86f20

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ddrescue/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ddrescue/Config.in b/package/ddrescue/Config.in
index 7ec87ce..2ec3e7e 100644
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
