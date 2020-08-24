From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Aug 2020 22:05:52 +0200
Subject: [Buildroot] [git commit] package/ipmitool: fix build with gcc 10
Message-ID: <20200824195916.C1C438137F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ddb4a931e9a718fa9bc31f7fffd714da750ea9d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/b6231d601d6051c97d3c2a0ed3065df03648c40d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...mfwupg-move-variable-definition-to-c-file.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/ipmitool/0007-hpmfwupg-move-variable-definition-to-c-file.patch b/package/ipmitool/0007-hpmfwupg-move-variable-definition-to-c-file.patch
new file mode 100644
index 0000000000..0b49160ba4
--- /dev/null
+++ b/package/ipmitool/0007-hpmfwupg-move-variable-definition-to-c-file.patch
@@ -0,0 +1,40 @@
+From c3939dac2c060651361fc71516806f9ab8c38901 Mon Sep 17 00:00:00 2001
+From: Vaclav Dolezal <vdolezal@redhat.com>
+Date: Thu, 23 Jan 2020 11:26:32 +0100
+Subject: [PATCH] hpmfwupg: move variable definition to .c file
+
+Signed-off-by: Vaclav Dolezal <vdolezal@redhat.com>
+[Retrieved from:
+https://github.com/ipmitool/ipmitool/commit/c3939dac2c060651361fc71516806f9ab8c38901]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/ipmitool/ipmi_hpmfwupg.h | 2 +-
+ lib/ipmi_hpmfwupg.c              | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/include/ipmitool/ipmi_hpmfwupg.h b/include/ipmitool/ipmi_hpmfwupg.h
+index de65292b..07f597be 100644
+--- a/include/ipmitool/ipmi_hpmfwupg.h
++++ b/include/ipmitool/ipmi_hpmfwupg.h
+@@ -800,7 +800,7 @@ typedef struct _VERSIONINFO {
+ 	char descString[HPMFWUPG_DESC_STRING_LENGTH + 1];
+ }VERSIONINFO, *PVERSIONINFO;
+ 
+-VERSIONINFO gVersionInfo[HPMFWUPG_COMPONENT_ID_MAX];
++extern VERSIONINFO gVersionInfo[HPMFWUPG_COMPONENT_ID_MAX];
+ 
+ #define TARGET_VER (0x01)
+ #define ROLLBACK_VER (0x02)
+diff --git a/lib/ipmi_hpmfwupg.c b/lib/ipmi_hpmfwupg.c
+index 4aa8cecd..d63d2c15 100644
+--- a/lib/ipmi_hpmfwupg.c
++++ b/lib/ipmi_hpmfwupg.c
+@@ -50,6 +50,8 @@
+ 
+ extern int verbose;
+ 
++VERSIONINFO gVersionInfo[HPMFWUPG_COMPONENT_ID_MAX];
++
+ int HpmfwupgUpgrade(struct ipmi_intf *intf, char *imageFilename,
+ 		int activate, int, int);
+ int HpmfwupgValidateImageIntegrity(struct HpmfwupgUpgradeCtx *pFwupgCtx);
