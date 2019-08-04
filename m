From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Aug 2019 17:09:56 +0200
Subject: [Buildroot] [PATCH 1/2] package/collectd: remove libvirt from list
 of disabled plugins
Message-ID: <20190804150957.7844-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With collectd 5.5.0 the "libvirt plugin has been renamed to virt":
https://git.octo.it/?p=collectd.git;a=blob;f=ChangeLog;h=b0a997c53ac1a74bc39470bdd243f853fa095c9f;hb=refs/tags/collectd-5.5.0#l235

"virt" is already mentioned in COLLECTD_PLUGINS_DISABLE so we can just
remove "libvirt" to fix:

configure: WARNING: unrecognized options: [...] --disable-libvirt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/collectd/collectd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index ca9a9e7a95..3443eb6fe4 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -15,7 +15,7 @@ COLLECTD_LICENSE_FILES = COPYING libltdl/COPYING.LIB
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
 	apple_sensors aquaero ascent barometer dbi dpdkstat email \
-	gmond grpc hddtemp intel_rdt ipmi java libvirt lpar lua lvm \
+	gmond grpc hddtemp intel_rdt ipmi java lpar lua lvm \
 	madwifi mbmon mic multimeter netapp notify_desktop numa \
 	nut onewire oracle perl pf pinba powerdns python routeros \
 	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
-- 
2.20.1
