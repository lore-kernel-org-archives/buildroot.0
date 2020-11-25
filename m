From: Francois Gervais <fgervais@distech-controls.com>
Date: Wed, 25 Nov 2020 10:27:17 -0500
Subject: [Buildroot] [PATCH 1/1] Revert "package/systemd: disable portabled"
Message-ID: <20201125152717.1984-1-fgervais@distech-controls.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We depend on this feature to dynamically extend the capabilities of
our embedded devices.

Also if it makes any difference, portablectl is now in /usr/bin.

This reverts commit b37fa74380557689f2309370c5bc1e770a1831eb.

Signed-off-by: Francois Gervais <fgervais@distech-controls.com>
---
 package/systemd/systemd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index cb12f667d6..e24c357ccf 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -33,7 +33,6 @@ SYSTEMD_CONF_OPTS += \
 	-Dman=false \
 	-Dmount-path=/usr/bin/mount \
 	-Dnss-systemd=true \
-	-Dportabled=false \
 	-Dquotacheck-path=/usr/sbin/quotacheck \
 	-Dquotaon-path=/usr/sbin/quotaon \
 	-Drootlibdir='/usr/lib' \
-- 
2.17.1
