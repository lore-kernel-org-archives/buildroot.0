From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:30 +0200
Subject: [Buildroot] [PATCH 79/83 v2] boot/barebox: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <4d2bf62d745954c224160609faa07e1e7c90e2c0.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

barebox has more than 5 options, so use a 'menuconfig' to
group the options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 boot/barebox/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index fd5cb8c..90aaede 100644
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
2.7.4
