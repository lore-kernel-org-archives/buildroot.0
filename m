From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 Dec 2016 22:59:16 -0300
Subject: [Buildroot] [PATCH 09/14] collectd: explicitly disable grpc plugin
In-Reply-To: <20161222015921.6832-1-gustavo@zacarias.com.ar>
References: <20161222015921.6832-1-gustavo@zacarias.com.ar>
Message-ID: <20161222015921.6832-9-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It requires the libgrpc++ library which buildroot doesn't provide yet.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.10.2
