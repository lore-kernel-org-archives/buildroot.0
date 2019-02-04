From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  4 Feb 2019 20:13:26 +0100
Subject: [Buildroot] [PATCH 1/3] package/systemd: add optional valgrind
 dependency
Message-ID: <20190204191328.31922-1-fontaine.fabrice@gmail.com>
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
index f9df66b039..5b2abdc3fe 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -117,6 +117,13 @@ else
 SYSTEMD_CONF_OPTS += -Dpam=false
 endif
 
+ifeq ($(BR2_PACKAGE_VALGRIND),y)
+SYSTEMD_DEPENDENCIES += valgrind
+SYSTEMD_CONF_OPTS += -Dvalgrind=true
+else
+SYSTEMD_CONF_OPTS += -Dvalgrind=false
+endif
+
 ifeq ($(BR2_PACKAGE_XZ),y)
 SYSTEMD_DEPENDENCIES += xz
 SYSTEMD_CONF_OPTS += -Dxz=true
-- 
2.14.1
