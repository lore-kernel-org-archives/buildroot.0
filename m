From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Apr 2017 10:39:33 +0200
Subject: [Buildroot] [git commit] phytool: add kernel headers dependency
Message-ID: <20170416084136.9356F8270A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6f077832fa8565f64cf8c28a6c96a6dea98fb9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

phytool includes linux/mdio.h, that is available since
kernel 3.7. So add related dependency.

Fixes:
http://autobuild.buildroot.net/results/e0e/e0eebcb9a694cd5d4c76c40e5dba971e3ac9d7c5/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/phytool/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/phytool/Config.in b/package/phytool/Config.in
index 7dca31d..985468f 100644
--- a/package/phytool/Config.in
+++ b/package/phytool/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_PHYTOOL
 	bool "phytool"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 # linux/mdio.h
 	help
 	  Linux MDIO register access utility.
 
 	  https://github.com/wkz/phytool
+
+comment "phytool needs a toolchain w/ headers >= 3.7"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
