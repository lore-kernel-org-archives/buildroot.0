From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Fri, 31 Jul 2020 12:10:31 +0200
Subject: [Buildroot] [PATCH 06/15] package/systemd: select SELinux modules
In-Reply-To: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
References: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
Message-ID: <20200731101040.1723047-7-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Select the systemd and udev SELinux modules so that they will be
compiled in the refpolicy. This way, if an SELinux policy is generated,
Systemd will be supported.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 package/systemd/systemd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 107fcbe66a6c..76dcee408226 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -18,6 +18,8 @@ SYSTEMD_DEPENDENCIES = \
 	util-linux \
 	$(TARGET_NLS_DEPENDENCIES)
 
+SYSTEMD_SELINUX_MODULES = systemd udev
+
 SYSTEMD_PROVIDES = udev
 
 SYSTEMD_CONF_OPTS += \
-- 
2.26.2
