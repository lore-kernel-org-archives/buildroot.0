From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Apr 2018 09:04:58 +0200
Subject: [Buildroot] [git commit] board/atmel: add flasher.sh support for
 at91sam9260ek
Message-ID: <20180407070541.BD0B683FEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f76d07548f707cbaa2231007f7b77d52a2f998d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support to the flasher.sh script for the at91sam9260-ek board which
complements the existing at91sam9260eknf_defconfig.

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/atmel/flasher.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/board/atmel/flasher.sh b/board/atmel/flasher.sh
index c122760952..8cae6af906 100755
--- a/board/atmel/flasher.sh
+++ b/board/atmel/flasher.sh
@@ -4,6 +4,10 @@ BUILDIR=$1
 TTY=$2
 BOARD=$3
 
+family_at91sam9260ek="at91sam9260ek"
+mach_at91sam9260ek="at91sam9260-ek"
+dtb_at91sam9260ek="at91sam9260ek.dtb"
+
 family_at91sam9g45m10ek="at91sam9m10g45ek"
 mach_at91sam9g45m10ek="at91sam9m10-g45-ek"
 dtb_at91sam9g45m10ek="at91sam9m10g45ek.dtb"
@@ -90,6 +94,7 @@ Usage:
   $0 <builddir_path> <interface> <board>
 
 Available boards:
+  at91sam9260ek
   at91sam9g45m10ek
   at91sam9rlek
   at91sam9g15ek
