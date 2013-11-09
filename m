From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  9 Nov 2013 17:57:37 -0300
Subject: [Buildroot] [PATCH] mplayer: disable for anything lower than ARMv5
Message-ID: <1384030657-18543-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable mplayer for anything lower than a v5 ARM core.
The support is broken and it's kind of pointless anyway. Fixes:
http://autobuild.buildroot.net/results/8f946e28b11b2ab1ba0d9688286c665488de0486/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mplayer/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index 7cee87d..b930cb5 100644
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -3,6 +3,9 @@ config BR2_PACKAGE_MPLAYER
 	# Those architectures are not supported by MPlayer
 	depends on !(BR2_sh2 || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
 			|| BR2_microblaze || BR2_aarch64)
+	# Broken support for <ARMv5
+	depends on !(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t \
+		|| BR2_arm920t || BR2_arm922t || BR2_fa526 || BR2_strongarm)
 	depends on BR2_LARGEFILE
 	help
 	  MPlayer is a movie player which runs on many systems and supports
-- 
1.8.3.2
