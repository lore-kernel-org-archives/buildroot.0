From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  3 Feb 2019 19:04:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: add optional iptables
 dependency
Message-ID: <20190203180416.32140-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/systemd/systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 15db1969e5..f9df66b039 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -64,6 +64,13 @@ else
 SYSTEMD_CONF_OPTS += -Delfutils=false
 endif
 
+ifeq ($(BR2_PACKAGE_IPTABLES),y)
+SYSTEMD_DEPENDENCIES += iptables
+SYSTEMD_CONF_OPTS += -Dlibiptc=true
+else
+SYSTEMD_CONF_OPTS += -Dlibiptc=false
+endif
+
 # Both options can't be selected at the same time so prefer libidn2
 ifeq ($(BR2_PACKAGE_LIBIDN2),y)
 SYSTEMD_DEPENDENCIES += libidn2
-- 
2.14.1
