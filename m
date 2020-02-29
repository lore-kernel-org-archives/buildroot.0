From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Feb 2020 15:43:16 +0100
Subject: [Buildroot] [PATCH] package/systemd: also fix rpath for nspawn
Message-ID: <20200229144316.5283-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.org/results/e03ae6a3209eea00459b94cee9c10fd4f2184fec/

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: J?r?my Rosen <jeremy.rosen@smile.fr>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 6e31a14ac3..b5805e6470 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -571,6 +571,7 @@ HOST_SYSTEMD_DEPENDENCIES = \
 HOST_SYSTEMD_HOST_TOOLS = \
 	systemd-analyze \
 	systemd-mount \
+	systemd-nspawn \
 	systemctl \
 	udevadm
 
-- 
2.20.1
