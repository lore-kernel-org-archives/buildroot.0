From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Aug 2019 10:13:10 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/collectd: remove
 libvirt from list of disabled plugins
Message-ID: <20190901200415.8E68388DA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3905465970130b2f82d8ceef91858d0e29726b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

With collectd 5.5.0 the "libvirt plugin has been renamed to virt":
https://git.octo.it/?p=collectd.git;a=blob;f=ChangeLog;h=b0a997c53ac1a74bc39470bdd243f853fa095c9f;hb=refs/tags/collectd-5.5.0#l235

"virt" is already mentioned in COLLECTD_PLUGINS_DISABLE so we can just
remove "libvirt" to fix:

configure: WARNING: unrecognized options: [...] --disable-libvirt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a8c80b72e9ebc42a4c35032413b0faf599879e54)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/collectd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 027df8f111..a6ffb8644d 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -15,7 +15,7 @@ COLLECTD_LICENSE_FILES = COPYING libltdl/COPYING.LIB
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
 	amqp apple_sensors aquaero ascent barometer dbi dpdkstat email \
-	gmond grpc hddtemp intel_rdt ipmi java libvirt lpar lua lvm \
+	gmond grpc hddtemp intel_rdt ipmi java lpar lua lvm \
 	madwifi mbmon mic multimeter netapp notify_desktop numa \
 	nut onewire oracle perl pf pinba powerdns python redis routeros \
 	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
