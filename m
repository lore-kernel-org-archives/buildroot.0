From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun,  8 Mar 2020 17:18:22 -0600
Subject: [Buildroot] [PATCH 1/1] package/systemd: add fdisk support
Message-ID: <20200308231822.38941-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/systemd/systemd.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 22165de2c1..526c749191 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -125,6 +125,12 @@ else
 SYSTEMD_CONF_OPTS += -Dpam=false
 endif
 
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBFDISK),y)
+SYSTEMD_CONF_OPTS += -Dfdisk=true
+else
+SYSTEMD_CONF_OPTS += -Dfdisk=false
+endif
+
 ifeq ($(BR2_PACKAGE_VALGRIND),y)
 SYSTEMD_DEPENDENCIES += valgrind
 SYSTEMD_CONF_OPTS += -Dvalgrind=true
-- 
2.20.1
