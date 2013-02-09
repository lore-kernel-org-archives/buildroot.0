From: Gilles Talis <gilles.talis@gmail.com>
Date: Sat,  9 Feb 2013 10:20:00 -0800
Subject: [Buildroot] [PATCH 1/1] mplayer: not supported on sh2/sh2a
In-Reply-To: <y>
References: <y>
Message-ID: <1360434000-10341-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mplayer configure script says that sh2a is not supported.

Fixes:
http://autobuild.buildroot.org/results/0e530fd99c4b37782208ee0549be500220643999/

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/multimedia/mplayer/Config.in |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/multimedia/mplayer/Config.in b/package/multimedia/mplayer/Config.in
index e285644..e36fc46 100644
--- a/package/multimedia/mplayer/Config.in
+++ b/package/multimedia/mplayer/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_MPLAYER
 	bool "mplayer"
 	# Those architectures are not supported by MPlayer
-	depends on !BR2_sh4a && !BR2_sh4aeb && !BR2_microblaze && !BR2_aarch64
+	depends on !(BR2_sh2 || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
+			|| BR2_microblaze || BR2_aarch64)
 	depends on BR2_LARGEFILE
 	help
 	  MPlayer is a movie player which runs on many systems and supports
-- 
1.7.10.4
