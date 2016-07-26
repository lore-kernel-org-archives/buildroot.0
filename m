From: Dagg Stompler <daggs@gmx.com>
Date: Tue, 26 Jul 2016 18:54:05 +0300
Subject: [Buildroot] [PATCH v2] odroid-scripts: select fbset if selected.
Message-ID: <20160726155405.5316-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---

v1 -> v2:
 - select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS in addition to BR2_PACKAGE_FBSET (Thomas Petazzoni)

 package/odroid-scripts/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/odroid-scripts/Config.in b/package/odroid-scripts/Config.in
index 48544b6..73d1c4b 100644
--- a/package/odroid-scripts/Config.in
+++ b/package/odroid-scripts/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_ODROID_SCRIPTS
 	bool "odroid-scripts"
 	depends on BR2_aarch64 || BR2_arm
+	select BR2_PACKAGE_FBSET
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  Install the scripts for the odroidc2 based systems.
 
-- 
2.9.2
