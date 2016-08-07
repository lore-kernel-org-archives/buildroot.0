From: Dagg Stompler <daggs@gmx.com>
Date: Sun,  7 Aug 2016 21:10:53 +0300
Subject: [Buildroot] [PATCH] odroid: enable console display.
Message-ID: <20160807181053.9857-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the below change will redirect the output to screen and not only to
serial.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 board/hardkernel/odroidc2/boot.ini | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/hardkernel/odroidc2/boot.ini b/board/hardkernel/odroidc2/boot.ini
index 4f17fec..203a42a 100644
--- a/board/hardkernel/odroidc2/boot.ini
+++ b/board/hardkernel/odroidc2/boot.ini
@@ -13,7 +13,7 @@ setenv m_bpp "32"
 setenv hpd "true"
 
 # Default Console Device Setting
-setenv condev "console=ttyS0,115200n8"	# Serial Console
+setenv condev "console=ttyS0,115200n8 console=tty0"   # on both
 
 # Meson Timer
 # 1 - Meson Timer
-- 
2.9.2
