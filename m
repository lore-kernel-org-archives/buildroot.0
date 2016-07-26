From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jul 2016 21:34:02 +0200
Subject: [Buildroot] [git commit] odroid-scripts: select fbset
Message-ID: <20160726193408.376D481F4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aeadc84203cafa8d884295dc3206c6c517cb6764
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fbset is used by one of the init scripts, so we need it as a runtime
dependency.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/odroid-scripts/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/odroid-scripts/Config.in b/package/odroid-scripts/Config.in
index 48544b6..c4e09ca 100644
--- a/package/odroid-scripts/Config.in
+++ b/package/odroid-scripts/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_ODROID_SCRIPTS
 	bool "odroid-scripts"
 	depends on BR2_aarch64 || BR2_arm
+	select BR2_PACKAGE_FBSET # runtime
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # needed for fbset
 	help
 	  Install the scripts for the odroidc2 based systems.
 
