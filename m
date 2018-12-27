From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 27 Dec 2018 12:13:47 +0200
Subject: [Buildroot] [PATCH 2/3] lm-sensors: make ISA tools depend on x86
In-Reply-To: <6592ba5b855eb8d5f79c6d883a45bdf02f1bfb49.1545905628.git.baruch@tkos.co.il>
References: <6592ba5b855eb8d5f79c6d883a45bdf02f1bfb49.1545905628.git.baruch@tkos.co.il>
Message-ID: <1b5190fd8020442b7297d7144535e9ddd421c1bc.1545905628.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The isadump and isaset tools are built for x86 targets only.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lm-sensors/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lm-sensors/Config.in b/package/lm-sensors/Config.in
index 60571b784f2a..a2e027599908 100644
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
-- 
2.19.2
