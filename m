From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Dec 2016 22:41:06 +0100
Subject: [Buildroot] [git commit] collectd: explicitly disable grpc plugin
Message-ID: <20161223214640.1492281765@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b2ef2881e65858f75782575ceabd740a379fa13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It requires the libgrpc++ library which buildroot doesn't provide yet.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/collectd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 97e2e98..2b57e51 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -15,7 +15,7 @@ COLLECTD_LICENSE_FILES = COPYING
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
 	amqp apple_sensors aquaero ascent barometer dbi email \
-	gmond hddtemp ipmi java libvirt lpar lvm madwifi mbmon \
+	gmond grpc hddtemp ipmi java libvirt lpar lvm madwifi mbmon \
 	mic multimeter netapp notify_desktop numa \
 	nut onewire oracle perl pf pinba powerdns python redis routeros \
 	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
