From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun,  8 Mar 2020 16:53:36 -0600
Subject: [Buildroot] [PATCH 1/1] package/systemd: add p11-kit support
Message-ID: <20200308225336.118095-1-james.hilliard1@gmail.com>
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
index 22165de2c1..803db898f2 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -160,6 +160,13 @@ else
 SYSTEMD_CONF_OPTS += -Dgcrypt=false
 endif
 
+ifeq ($(BR2_PACKAGE_P11_KIT),y)
+SYSTEMD_DEPENDENCIES += p11-kit
+SYSTEMD_CONF_OPTS += -Dp11kit=true
+else
+SYSTEMD_CONF_OPTS += -Dp11kit=false
+endif
+
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 SYSTEMD_DEPENDENCIES += pcre2
 SYSTEMD_CONF_OPTS += -Dpcre2=true
-- 
2.20.1
