From: Norbert Lange <nolange79@gmail.com>
Date: Fri,  9 Jul 2021 11:07:26 +0200
Subject: [Buildroot] [PATCH 1/3] package/systemd: set cgroups
 default-hierarchy to unified
Message-ID: <20210709090729.280632-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the unified hierarchy, which is systemds default since v243.
The biggest holdover was docker which now supports the unified
layout.

Note that systemd will automatically fallback to hybrid if the
kernel is too old or the unified hierarchy fails for other reasons.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/systemd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 74c561e67e..1a25a0b8c1 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -24,7 +24,7 @@ SYSTEMD_SELINUX_MODULES = systemd udev
 SYSTEMD_PROVIDES = udev
 
 SYSTEMD_CONF_OPTS += \
-	-Ddefault-hierarchy=hybrid \
+	-Ddefault-hierarchy=unified \
 	-Didn=true \
 	-Dima=false \
 	-Dkexec-path=/usr/sbin/kexec \
-- 
2.30.2
