From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:17:42 -0000
Subject: [Buildroot] [git commit] boot/at91bootstrap3: move
 BR2_TARGET_AT91BOOTSTRAP3_NEEDS_PYTHON3
Message-ID: <20210607144655.453D781191@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a86318a79f405b5e601515e6c85d3ce7544bcb17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As spotted by Eugen, BR2_TARGET_AT91BOOTSTRAP3_NEEDS_PYTHON3 currently
is outside the at91bootstrap section, because it was inccorectly added
after the 'endif' statement rather than before, which makes the
menuconfig layout weird.

Move it around.

Reported-by: Eugen Hristev <eugen.hristev@microchip.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/at91bootstrap3/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index 966e393db5..f44597bc00 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -100,8 +100,6 @@ config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE
 	help
 	  Path to the at91bootstrap3 configuration file
 
-endif # BR2_TARGET_AT91BOOTSTRAP3
-
 config BR2_TARGET_AT91BOOTSTRAP3_NEEDS_PYTHON3
 	bool "needs host-python3"
 	help
@@ -109,3 +107,5 @@ config BR2_TARGET_AT91BOOTSTRAP3_NEEDS_PYTHON3
 	  Python 3.x to be available on the host. This is needed in
 	  some at91bootstrap configurations to use NAND/PMECC Python
 	  scripts.
+
+endif # BR2_TARGET_AT91BOOTSTRAP3
