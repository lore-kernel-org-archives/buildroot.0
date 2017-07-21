From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 08:59:49 +0200
Subject: [Buildroot] [git commit] linux-zigbee: fix build with gcc 7
Message-ID: <20170721065542.8785281ED1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1bebe18e54ad634bd6151445f009aa53038d765
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable -Werror to avoid the fatal result of new gcc 7 format string warnings.

Fixes:
http://autobuild.buildroot.net/results/29c/29c72bc38042305310576be945c721b2fad95894/
http://autobuild.buildroot.net/results/a7d/a7d38d72834b94291eaff159da277b11e2f9d63a/
http://autobuild.buildroot.net/results/cfe/cfed5176075f0cb9e2f56ebef10f5d6c352baf10/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-zigbee/linux-zigbee.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-zigbee/linux-zigbee.mk b/package/linux-zigbee/linux-zigbee.mk
index 9450ca4..8d3248f 100644
--- a/package/linux-zigbee/linux-zigbee.mk
+++ b/package/linux-zigbee/linux-zigbee.mk
@@ -15,6 +15,7 @@ LINUX_ZIGBEE_AUTORECONF = YES
 
 LINUX_ZIGBEE_CONF_OPTS = \
 	--disable-manpages \
+	--disable-werror \
 	--with-leasefile="$(call qstrip,$(BR2_PACKAGE_LINUX_ZIGBEE_LEASEFILE))"
 
 ifeq ($(BR2_PACKAGE_LINUX_ZIGBEE_TESTS),y)
