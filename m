From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Dec 2018 11:59:30 +0100
Subject: [Buildroot] [git commit] package/lm-sensors: make ISA tools depend
 on x86
Message-ID: <20181228110400.75D8483B2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31379277f739b00a4d2da631e16a2ebbb478ea89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The isadump and isaset tools are built for x86 targets only.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lm-sensors/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lm-sensors/Config.in b/package/lm-sensors/Config.in
index 60571b784f..a2e0275999 100644
--- a/package/lm-sensors/Config.in
+++ b/package/lm-sensors/Config.in
@@ -25,12 +25,14 @@ config BR2_PACKAGE_LM_SENSORS_FANCONTROL
 
 config BR2_PACKAGE_LM_SENSORS_ISADUMP
 	bool "isadump"
+	depends on BR2_i386 || BR2_x86_64
 	help
 	  Isadump is a small helper program to examine registers
 	  visible through the ISA bus.
 
 config BR2_PACKAGE_LM_SENSORS_ISASET
 	bool "isaset"
+	depends on BR2_i386 || BR2_x86_64
 	help
 	  Isaset is a small helper program to set register visible
 	  through the ISA bus.
