From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:38:08 +0100
Subject: [Buildroot] [PATCH 76/80 v1] boot/barebox: use 'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <e94d00fc8b99d734b696db083f51e356d0623a91.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

barebox has more than 5 options, so use a 'menuconfig' to
group the options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/barebox/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 39cb5d2..f27afb6 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_BAREBOX
+menuconfig BR2_TARGET_BAREBOX
 	bool "Barebox"
 	help
 	  The Barebox bootloader, formerly known as U-Boot v2.
@@ -6,6 +6,7 @@ config BR2_TARGET_BAREBOX
 	  http://www.barebox.org
 
 if BR2_TARGET_BAREBOX
+
 choice
 	prompt "version"
 	help
-- 
1.9.1
