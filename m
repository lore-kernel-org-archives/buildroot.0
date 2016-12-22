From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 Dec 2016 22:59:18 -0300
Subject: [Buildroot] [PATCH 11/14] collectd: explicitly disable dpdkstat
	plugin
In-Reply-To: <20161222015921.6832-1-gustavo@zacarias.com.ar>
References: <20161222015921.6832-1-gustavo@zacarias.com.ar>
Message-ID: <20161222015921.6832-11-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It requires the libdpdk library which buildroot doesn't provide yet.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.10.2
