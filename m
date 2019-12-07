From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Dec 2019 12:07:31 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/rauc: select
 fw_printenv for uboot based systems
Message-ID: <20191207110229.B9DAA88438@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9dc8cf5c760ef17fa5c731f9f2c1165d219e697
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

When operating on a uboot based system, rauc interacts with
the bootloader environment using fw_printenv and fw_setenv [1].

These commands should therefore be present on the target if
the system being built uses uboot.

[1] See:
https://github.com/rauc/rauc/blob/v1.2/src/bootchooser.c#L21-L22
https://github.com/rauc/rauc/blob/v1.2/src/bootchooser.c#L644-L645

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ccf67ebe3b93bf659e64e4e933f2e0bac148a141)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rauc/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rauc/Config.in b/package/rauc/Config.in
index 4a1516a595..676ff42b51 100644
--- a/package/rauc/Config.in
+++ b/package/rauc/Config.in
@@ -7,6 +7,8 @@ config BR2_PACKAGE_RAUC
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_SQUASHFS # run-time dependency
+	select BR2_PACKAGE_UBOOT_TOOLS if BR2_TARGET_UBOOT # run-time dependency
+	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV if BR2_TARGET_UBOOT
 	help
 	  RAUC is the Robust Auto-Update Controller developed by
 	  Pengutronix. It supports updating embedded Linux
