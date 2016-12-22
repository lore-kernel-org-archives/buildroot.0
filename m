From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 Dec 2016 22:59:19 -0300
Subject: [Buildroot] [PATCH 12/14] collectd: explicitly disable intel_rdt
	plugin
In-Reply-To: <20161222015921.6832-1-gustavo@zacarias.com.ar>
References: <20161222015921.6832-1-gustavo@zacarias.com.ar>
Message-ID: <20161222015921.6832-12-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It requires the libpqos library which buildroot doesn't provide yet.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/collectd/collectd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index f306d16..b105e90 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -15,8 +15,8 @@ COLLECTD_LICENSE_FILES = COPYING
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
 	amqp apple_sensors aquaero ascent barometer dbi dpdkstat email \
-	gmond grpc hddtemp ipmi java libvirt lpar lvm madwifi mbmon \
-	mic multimeter netapp notify_desktop numa \
+	gmond grpc hddtemp intel_rdt ipmi java libvirt lpar lvm \
+	madwifi mbmon mic multimeter netapp notify_desktop numa \
 	nut onewire oracle perl pf pinba powerdns python redis routeros \
 	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
 	tokyotyrant turbostat uuid varnish virt vserver write_kafka \
-- 
2.10.2
