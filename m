From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:50 +0100
Subject: [Buildroot] [PATCH 81/84 RFC] boot/barebox: use 'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <814a726f5647fa3e7b171d5e7702acfc246af0f9.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

barebox has more than 5 options, so use a 'menuconfig' to
group the options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 boot/barebox/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 207d9b2..f48ddc4 100644
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
