From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Mar 2020 08:21:52 +0100
Subject: [Buildroot] [PATCH] package/systemd: also fix rpath for
 machine-id-setup
Message-ID: <20200301072152.2499-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes: #12576

Reported-by: Melanie <melanie@trash-mail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Adam Duskett <aduskett@gmail.com>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 6e31a14ac3..5ee4104364 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -570,6 +570,7 @@ HOST_SYSTEMD_DEPENDENCIES = \
 # * thus re-tweak rpath after the installation for all binaries that need it
 HOST_SYSTEMD_HOST_TOOLS = \
 	systemd-analyze \
+	systemd-machine-id-setup \
 	systemd-mount \
 	systemctl \
 	udevadm
-- 
2.20.1
