From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Dec 2016 22:41:47 +0100
Subject: [Buildroot] [git commit] collectd: explicitly disable dpdkstat
	plugin
Message-ID: <20161223214640.2742081765@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3d7b588f42e7231ef613f592448b4be22e136c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It requires the libdpdk library which buildroot doesn't provide yet.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/collectd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 392c76f..f306d16 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -14,7 +14,7 @@ COLLECTD_LICENSE_FILES = COPYING
 
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
-	amqp apple_sensors aquaero ascent barometer dbi email \
+	amqp apple_sensors aquaero ascent barometer dbi dpdkstat email \
 	gmond grpc hddtemp ipmi java libvirt lpar lvm madwifi mbmon \
 	mic multimeter netapp notify_desktop numa \
 	nut onewire oracle perl pf pinba powerdns python redis routeros \
