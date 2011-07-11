From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2011 23:46:22 +0200
Subject: [Buildroot] [git commit] at91dataflashboot: use "config" instead of
	"menuconfig"
Message-ID: <20110711214654.7291A8A482@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4a665aa9459f6f2ebcb2c46efd4a0a73fb1f9795
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since at91dataflashboot has no suboption, using "menuconfig" is
useless and confusing, as it creates an empty submenu in the
configuration interface.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/at91dataflashboot/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/at91dataflashboot/Config.in b/boot/at91dataflashboot/Config.in
index 88cd058..a4efe11 100644
--- a/boot/at91dataflashboot/Config.in
+++ b/boot/at91dataflashboot/Config.in
@@ -1,3 +1,3 @@
-menuconfig BR2_TARGET_AT91DATAFLASHBOOT
+config BR2_TARGET_AT91DATAFLASHBOOT
        depends on BR2_arm
        bool "AT91 DataFlashBoot"
-- 
1.7.3.4
