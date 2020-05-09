From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 13:42:42 +0200
Subject: [Buildroot] [git commit] package/systemd: add support for apparmor
Message-ID: <20200509112705.4072A90EA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b285cd9b05e5211a2a33f82e84fe84b3fec2c2e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If libapparmor is selected, depend on libapparmor and set -Dapparmor=true

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 9f5429fd19..50398e747e 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -49,6 +49,13 @@ else
 SYSTEMD_CONF_OPTS += -Dacl=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
+SYSTEMD_DEPENDENCIES += libapparmor
+SYSTEMD_CONF_OPTS += -Dapparmor=true
+else
+SYSTEMD_CONF_OPTS += -Dapparmor=false
+endif
+
 ifeq ($(BR2_PACKAGE_AUDIT),y)
 SYSTEMD_DEPENDENCIES += audit
 SYSTEMD_CONF_OPTS += -Daudit=true
