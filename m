From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu,  5 Mar 2020 07:55:21 -0300
Subject: [Buildroot] [PATCH] package/procps-ng: add
 PROCPS_NG_INSTALL_INIT_OPENRC
Message-ID: <20200305105521.26501-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Avoid installing S02sysctl, since openrc provides /etc/init.d/sysctl.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/procps-ng/procps-ng.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 6a41e9b322..5bafc7ee97 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -44,6 +44,11 @@ ifeq ($(BR2_STATIC_LIBS),y)
 PROCPS_NG_CONF_OPTS += --disable-numa
 endif
 
+# Avoid installing S02sysctl, since openrc provides /etc/init.d/sysctl.
+define PROCPS_NG_INSTALL_INIT_OPENRC
+	@:
+endef
+
 define PROCPS_NG_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/procps-ng/S02sysctl \
 		$(TARGET_DIR)/etc/init.d/S02sysctl
-- 
2.18.2
