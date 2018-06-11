From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 22:55:20 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/transmission: fix
 systemd support
Message-ID: <20180611211536.EA39D8832D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e3e52d303aefeb16b00cfbffece9ba8b6b30013
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Patch 0006-libsystemd.patch backports an upstream commit which renames
the systemd configure option.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b27bcedccbecaecfbbfdb69ba5c24f1f0e3fc064)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/transmission/transmission.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 4e78604fdb..32e8e70789 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -49,9 +49,9 @@ TRANSMISSION_CONF_OPTS += --enable-daemon
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 TRANSMISSION_DEPENDENCIES += systemd
-TRANSMISSION_CONF_OPTS += --with-systemd-daemon
+TRANSMISSION_CONF_OPTS += --with-systemd
 else
-TRANSMISSION_CONF_OPTS += --without-systemd-daemon
+TRANSMISSION_CONF_OPTS += --without-systemd
 endif
 
 define TRANSMISSION_USERS
