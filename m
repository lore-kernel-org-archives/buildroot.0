From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Aug 2019 10:11:16 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/collectd:
 explicitly disable lua
Message-ID: <20190901200423.491AB88DB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2f310167109b11e1c81e05cf6b92c8d09b17184
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

lua plugin has been added in version 5.6.0 with
https://github.com/collectd/collectd/commit/023092323ca617c8ff95b1efd4a055c29b1aaa3b

Disabled it otherwise it'll be enabled if liblua is found

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 753bfec583b6bb921b44d6735df67f9d681c31c3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
