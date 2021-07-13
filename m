From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Jul 2021 21:47:19 +0200
Subject: [Buildroot] [git commit] package/seatd: disable -Werror
Message-ID: <20210713191510.2FEE69555D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=464fb90793516c8d8e5c25b6531773b33aa4d676
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Tested-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
