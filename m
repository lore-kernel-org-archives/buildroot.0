From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 23 Jul 2020 23:56:22 +0200
Subject: [Buildroot] [PATCH 1/2] package/squid: add optional systemd
 dependency
Message-ID: <20200723215623.890307-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd is an optional dependency (enabled by default) since version
4.11 and
https://github.com/squid-cache/squid/commit/6fa8c66435d55a2e713db0222cdca3a9dccf5bbe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/squid/squid.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index d281eee3ed..ef2f84085c 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -62,6 +62,13 @@ else
 SQUID_CONF_OPTS += --without-gnutls
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+SQUID_CONF_OPTS += --with-systemd
+SQUID_DEPENDENCIES += systemd
+else
+SQUID_CONF_OPTS += --without-systemd
+endif
+
 define SQUID_CLEANUP_TARGET
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, \
 		RunCache RunAccel)
-- 
2.27.0
