From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 28 Jan 2018 21:52:33 -0200
Subject: [Buildroot] [PATCH] libpciaccess: add dependency on hwdata
Message-ID: <20180128235233.26989-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libpciaccess requires /usr/share/hwdata/pci.ids (or pci.ids.gz, if
compiled with zlib support). That file is provided by the hwdata
package, so add it as a run-time dependency.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/libpciaccess/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libpciaccess/Config.in b/package/libpciaccess/Config.in
index 6cc983f577..381383e1f9 100644
--- a/package/libpciaccess/Config.in
+++ b/package/libpciaccess/Config.in
@@ -1,4 +1,6 @@
 config BR2_PACKAGE_LIBPCIACCESS
 	bool "libpciaccess"
+	select BR2_PACKAGE_HWDATA
+	select BR2_PACKAGE_HWDATA_PCI_IDS
 	help
 	  X.Org libpciaccess
-- 
2.14.3
