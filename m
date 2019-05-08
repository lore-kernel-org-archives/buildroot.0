From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  8 May 2019 23:05:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/collectd: explicitly disable lua
Message-ID: <20190508210543.13740-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lua plugin has been added in version 5.6.0 with
https://github.com/collectd/collectd/commit/023092323ca617c8ff95b1efd4a055c29b1aaa3b

Disabled it otherwise it'll be enabled if liblua is found

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/collectd/collectd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 589324e612..027df8f111 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -15,7 +15,7 @@ COLLECTD_LICENSE_FILES = COPYING libltdl/COPYING.LIB
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
 	amqp apple_sensors aquaero ascent barometer dbi dpdkstat email \
-	gmond grpc hddtemp intel_rdt ipmi java libvirt lpar lvm \
+	gmond grpc hddtemp intel_rdt ipmi java libvirt lpar lua lvm \
 	madwifi mbmon mic multimeter netapp notify_desktop numa \
 	nut onewire oracle perl pf pinba powerdns python redis routeros \
 	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
-- 
2.20.1
