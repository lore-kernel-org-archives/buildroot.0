From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 15:29:58 +0200
Subject: [Buildroot] [git commit] package/transmission: fix systemd support
Message-ID: <20180520132911.B069481000@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b27bcedccbecaecfbbfdb69ba5c24f1f0e3fc064
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch 0006-libsystemd.patch backports an upstream commit which renames
the systemd configure option.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
