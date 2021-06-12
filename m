From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Jun 2021 23:15:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/seatd: disable -Werror
Message-ID: <20210612211502.594066-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable -Werror to avoid the following build failure which is raised
since the addition of the package in commit
daae31149017cbf8b03634cfc56da132f7e1ad83

../seatd/seat.c: In function 'seat_activate_device':
../seatd/seat.c:374:48: error: unused parameter 'client' [-Werror=unused-parameter]
  374 | static int seat_activate_device(struct client *client, struct seat_device *seat_device) {
      |                                 ~~~~~~~~~~~~~~~^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/0ec925aab23d83c52684f5fea7a4395c93a674c4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/seatd/seatd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/seatd/seatd.mk b/package/seatd/seatd.mk
index 2abcefbfaa..bf582f0d1d 100644
--- a/package/seatd/seatd.mk
+++ b/package/seatd/seatd.mk
@@ -13,7 +13,8 @@ SEATD_INSTALL_STAGING = YES
 
 SEATD_CONF_OPTS += \
 	-Dman-pages=disabled \
-	-Dexamples=disabled
+	-Dexamples=disabled \
+	-Dwerror=false
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_LOGIND),y)
 SEATD_CONF_OPTS += -Dlogind=enabled
-- 
2.30.2
