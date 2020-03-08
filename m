From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun,  8 Mar 2020 17:09:37 -0600
Subject: [Buildroot] [PATCH 1/1] package/systemd: add gnutls support
Message-ID: <20200308230937.41178-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/systemd/systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 22165de2c1..1f87172f34 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -72,6 +72,13 @@ else
 SYSTEMD_CONF_OPTS += -Delfutils=false
 endif
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+SYSTEMD_DEPENDENCIES += gnutls
+SYSTEMD_CONF_OPTS += -Dgnutls=true
+else
+SYSTEMD_CONF_OPTS += -Dgnutls=false
+endif
+
 ifeq ($(BR2_PACKAGE_IPTABLES),y)
 SYSTEMD_DEPENDENCIES += iptables
 SYSTEMD_CONF_OPTS += -Dlibiptc=true
-- 
2.20.1
