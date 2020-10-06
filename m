From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 22:22:26 +0200
Subject: [Buildroot] [git commit] package/ebtables: select bash when
 installing ebtables-legacy-save
Message-ID: <20201006201218.ECE4E851A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1904893971c5b1b415689cf9ba3c1e51ec693f98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To allow easier installation of ebtables-legacy-save from the config
menu, select BR2_PACKAGE_BASH. All dependencies of bash are met
already by ebtables depending on BR2_USE_MMU.

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
Tested-by: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ebtables/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ebtables/Config.in b/package/ebtables/Config.in
index b98d03b626..703e55a3c3 100644
--- a/package/ebtables/Config.in
+++ b/package/ebtables/Config.in
@@ -10,7 +10,8 @@ if BR2_PACKAGE_EBTABLES
 
 config BR2_PACKAGE_EBTABLES_UTILS_SAVE
 	bool "ebtables save"
-	depends on BR2_PACKAGE_BASH # runtime
+	select BR2_PACKAGE_BASH # runtime
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	help
 	  Install the ebtables-legacy-save tool
 
