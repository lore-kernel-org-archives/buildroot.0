From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 23:41:16 +0100
Subject: [Buildroot] [git commit] rsyslog: install systemd services links
Message-ID: <20141221224157.2BF4B80543@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e86a2fcc6a99c338436cd921905a0c34d435662
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thierry Bultel <tbultel@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rsyslog/rsyslog.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 6b72bb5..688a335 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -43,6 +43,14 @@ define RSYSLOG_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S01rsyslog
 endef
 
+define RSYSLOG_INSTALL_INIT_SYSTEMD
+	ln -sf /lib/systemd/system/rsyslog.service \
+		$(TARGET_DIR)/etc/systemd/system/syslog.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../syslog.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/syslog.service
+endef
+
 define RSYSLOG_INSTALL_CONF
 	$(INSTALL) -m 0644 -D $(@D)/platform/redhat/rsyslog.conf \
 		$(TARGET_DIR)/etc/rsyslog.conf
